// Testbench
module test;

  reg        clk;
  reg  [7:0] address;
  reg  [4:0] data_write;
  reg        write_enable;
  reg        cs;
  wire [4:0] data_read;
  reg        rs;
  reg [4:0]  temp[0:1][0:255];
   
  // Instantiate design under test
  // DATA_WIDTH = 5
  // ADDRESS_WIDTH = 8
  // RAM_DEPTH = 2^A_WIDTH = 256
  INT_RAM #(5, 8, 256) RAM (
    .clk(clk),
    .address(address),
    .data_in(data_write),
    .we(write_enable),
    .data_out(data_read),
    .cs(cs),
    .rs(rs));
    
  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1, test);
    cs=1;
    rs=0;
    clk = 1;
    write_enable = 0;

    $display("Read initial data.");
    toggle_clk;
    $display("data[%0h]: %0h",
      address, data_read);
    
    for(int i=0;i<256;i++)begin 
    $display("Write new data.");
    rs=0;
    write_enable = 1;
    address = i;
    data_write = $random%6;
      temp[0][i]=data_write;
    toggle_clk;
    end
    
        
    #10;
    for(int i=0;i<256;i++)begin
    $display("Write new data.");
    rs=1;
    write_enable = 1;
    address = i;
      data_write = $random %6;
      temp[1][i]=data_write;
    toggle_clk;
    end
    
    #10;
    for(int i=0;i<256;i++)begin 
    rs=0;
    $display("Read new data.");
    address = i;
    write_enable = 0;
    toggle_clk;
    $display("data[%0h]: %0h",
      address, data_read);
      if(data_read!=temp[0][i])begin
        $display("read incorrectly on address %0h",address);
        $finish;
      end
    end
    
    
    #10;
    for(int i=0;i<256;i++)begin
    rs=1;
    $display("Read new data.");
    address = i;
    write_enable = 0;
    toggle_clk;
      if(data_read!=temp[1][i])begin
        $display("read incorrectly on address %0h",address);
        $finish;
      end      
    $display("data[%0h]: %0h",
      address, data_read);
    end  
    $display("all tests passed");


  end
  
  task toggle_clk;
    begin
      #10 clk = ~clk;
      #10 clk = ~clk;
      #10 clk = ~clk;
      #10 clk = ~clk;       
    end
  endtask



endmodule
