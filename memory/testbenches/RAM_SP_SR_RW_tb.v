// Testbench
module test;
   parameter DATA_WIDTH = 8;
  parameter A_WIDTH = 8;
  parameter RAM_DEPTH = 1<<A_WIDTH;

  reg        clk;
  reg  [DATA_WIDTH-1:0] data_write;
  reg        write_enable;
  reg cs;
  reg  [A_WIDTH-1:0] address;
  wire [DATA_WIDTH-1:0] data_read;
  reg   [DATA_WIDTH-1:0] temp[(1<<A_WIDTH):0];
  
  RAM_SP_SR_RW #(DATA_WIDTH,A_WIDTH , RAM_DEPTH) RAM (
    .clk(clk),
    .address(address),
    .data_in(data_write),
    .we(write_enable),
    .data_out(data_read),
    .cs(cs));
    
  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1, test);
    cs=1;
    clk = 1;
    
    write_enable = 0;
    address = 0;
    toggle_clk;
    
    

    for(int i=0;i<(1<<A_WIDTH);i++)begin
    //write a random value at each address of the ram
    write_enable = 1;
    address = i;
    data_write = $random%(DATA_WIDTH) ;
      temp[i]=data_write; //storing the random values in temp 
    toggle_clk;
    end
    
    
    //read the earlier written values from each address of the ram
    for(int i=0;i<(1<<A_WIDTH);i++)begin
    address = i;
    write_enable = 0;
    toggle_clk;
      //check whether the read values match with values written earlier
      if(data_read!=temp[i])begin
        $display("data from address %d was not read correctly",i);
        #20 $finish;
      end
    end
     
    $display("All tests passed"); 
    #20 $finish;
  end
  
  task toggle_clk;
    begin
      #10 clk = ~clk;
      #10 clk = ~clk;
    end
  endtask

endmodule
