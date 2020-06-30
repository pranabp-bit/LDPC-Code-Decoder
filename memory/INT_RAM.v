module INT_RAM (clk, address,
  data_in, we, cs, rs, data_out);
  
  parameter DATA_WIDTH = 5;
  parameter ADDR_WIDTH = 8;
  parameter RAM_DEPTH = 1<<ADDR_WIDTH; // 2^A_WIDTH

  // Write port
  input                clk;
  input  [ADDR_WIDTH-1:0] address;
  input  [DATA_WIDTH-1:0] data_in;
  input                we;
  input                cs;
  input                rs;
  // Read port
  output [DATA_WIDTH-1:0] data_out;
  
  reg    [DATA_WIDTH-1:0] data_out;
  
  // Memory as multi-dimensional array
  reg [DATA_WIDTH-1:0] memory [0:1][RAM_DEPTH-1:0];

  // Write data to memory
  always @(posedge clk) begin
    if (we & cs) begin
      memory[!(!rs)][address] <= data_in;
    end
  end

  // Read data from memory
  always @(posedge clk) begin
    if(!we & cs ) begin
      data_out <= memory[!(!rs)][address];
    end
  end

endmodule

