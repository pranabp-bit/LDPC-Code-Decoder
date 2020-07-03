`include "RAM_SP_SR_RW.v"
module EXT_RAM (clk, address, data_in, we, cs, data_out); 
  parameter DATA_WIDTH = 5;
  parameter ADDR_WIDTH = 8;
  parameter RAM_DEPTH = 1<<ADDR_WIDTH;  
    // Write port
  input                clk;
  input  [ADDR_WIDTH-1:0] address;
  input  [DATA_WIDTH-1:0] data_in;
  input                we;
  input                cs;
    // Read port
  output [DATA_WIDTH-1:0] data_out;
  reg    [DATA_WIDTH-1:0] data_out;
  RAM_SP_SR_RW #( .DATA_WIDTH(5), 
                  .ADDR_WIDTH(8), 
                  .RAM_DEPTH(256)) EXT_RAM
                ( .clk(clk),
                  .address(address),
                 .data_in(data_in),
                  .we(cs),
                  .cs(cs),
                 .data_out(data_out));
  
  endmodule
