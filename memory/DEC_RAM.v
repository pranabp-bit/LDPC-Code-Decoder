`include "RAM_SP_SR_RW.v"
module DEC_RAM 
#(
  parameter DATA_WIDTH = 1 ,
  parameter ADDR_WIDTH = 8 ,
  parameter RAM_DEPTH  = 1 << ADDR_WIDTH
)
(
  input  logic                  clk      , // Clock Input
  input  logic [ADDR_WIDTH-1:0] address  , // Address Input
  input  logic                  we       , // Write Enable
  input  logic                  cs       , // Chip select
  input  logic [DATA_WIDTH-1:0] data_in  , // Data Input
  input  logic                  rs       ,
  output  [DATA_WIDTH-1:0] data_out  // Data Output
);
  reg [DATA_WIDTH-1:0] data_out;
  reg [DATA_WIDTH-1:0] data_out_1;
  reg [DATA_WIDTH-1:0] data_in_1;
  reg [DATA_WIDTH-1:0] data_out_2;
  reg [DATA_WIDTH-1:0] data_in_2;
  reg we_1;
  reg we_2;
  always @ *
    begin
    if(rs==0)begin
      if(we==1)begin
        we_1=1'b1;
        we_2=1'b0;
      end
      else begin
        we_1=1'b0;
        we_2=1'b0;        
      end      
    data_in_1=data_in;
    end
    else begin
      if(we==1)begin
        we_1=1'b0;
        we_2=1'b1;
      end
      else begin
        we_1=1'b0;
        we_2=1'b0;        
      end
    data_in_2=data_in; 
    end
    
  end
  RAM_SP_SR_RW #(DATA_WIDTH, ADDR_WIDTH, RAM_DEPTH) dec_ram_current
  (
    .clk      (clk),
    .data_in  (data_in_1),
    .data_out (data_out_1),
    .address  (address),
    .we       (we_1),
    .cs       (cs)
  );
  RAM_SP_SR_RW #(DATA_WIDTH, ADDR_WIDTH, RAM_DEPTH) dec_ram_next
  (
    .clk      (clk),
    .data_in  (data_in_2),
    .data_out (data_out_2),
    .address  (address),
    .we       (we_2),
    .cs       (cs)
  ); 
    always @ * begin
    if(rs==0)begin
    data_out = data_out_1;
    end
    else begin    
    data_out = data_out_2;      
    end
    
  end
endmodule
