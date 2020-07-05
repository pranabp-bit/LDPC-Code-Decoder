module tb_counter;
    parameter DATA_WIDTH = 8;
    parameter COUNT_FROM=8; 
  reg en;
  reg clk;                     // Declare an internal TB variable called clk to drive clock to the design
  reg rstn;                    // Declare an internal TB variable called rstn to drive active low reset to design
  wire [7:0] out;              // Declare a wire to connect to design output

  // Instantiate counter design and connect with Testbench variables
  ADDRESS_GENERATOR #(DATA_WIDTH, COUNT_FROM)   AG ( .clk (clk),
                                            .reset (rstn),
                                            .en(en), 
                                            .out (out) );

  // Generate a clock that should be driven to design
  always #5 clk = ~clk;

  // This initial block forms the stimulus of the testbench
  initial begin
    $monitor ("[%0tns] clk=%0b rstn=%0b out=0x%0h", $time, clk, rstn, out);
    
    // 1. Initialize testbench variables to 0 at start of simulation
    clk <= 0;
    rstn <= 0;

    en<=1;
    // 2. Drive rest of the stimulus, reset is asserted in between
    #20   rstn <= 0;                   
    #50   rstn <= 0;
    #80   rstn <= 1;
    #50   rstn <= 0;
    #80   rstn <= 1;
    #50   rstn <= 0;
    
    // 3. Finish the stimulus after 200ns
    #200 $finish;
  end
  
  initial begin
    $dumpvars;
    $dumpfile("dump.vcd");
  end
endmodule
