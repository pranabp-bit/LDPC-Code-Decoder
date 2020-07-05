`include "UP_COUNTER.v"
module ADDRESS_GENERATOR(clk,reset,en,out);
      parameter DATA_WIDTH   = 8;
      parameter COUNT_FROM   = 0;
      

      input clk;   // clock input
      input en;  // enable
      input reset; // reset


      output reg [DATA_WIDTH-1:0] out;

  UP_COUNTER #(DATA_WIDTH, COUNT_FROM) AG 
    (
    .clk(clk),
    .rstn(reset),
    .en(en),
    .out(out)
    );

endmodule
