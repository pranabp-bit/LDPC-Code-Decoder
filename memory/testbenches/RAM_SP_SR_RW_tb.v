module tb;
  parameter ADDR_WIDTH = 8;
  parameter DATA_WIDTH = 8;
  parameter DEPTH = 256;
  reg clk;
  reg cs;
  reg we;
  reg [ADDR_WIDTH-1:0] address;
  wire [DATA_WIDTH-1:0] data_out;
  reg [DATA_WIDTH-1:0] tb_data;
  RAM_SP_SR_RW #(DATA_WIDTH,ADDR_WIDTH,DEPTH)RAM(
   .clk(clk),
   .address(address),
    .data_in(tb_data),
   .cs(cs),
   .we(we),
   .data_out(data_out));
  always #10 clk = ~clk;
  initial begin
    //dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1, tb);
    {clk, cs, we, address, tb_data} <= 0;
    repeat (2) @ (posedge clk) begin
    for (int i = 0; i < (1<<ADDR_WIDTH); i= i+1) begin
      repeat (1) @(posedge clk) begin address <= i; we <= 1; cs <=1; tb_data <= $random %8;
      end
    end
      for (int i = 0; i < (1<<ADDR_WIDTH); i= i+1) begin
      repeat (1) @(posedge clk) begin
        address <= i; we <= 0; cs <= 1;
      end
    end
    end
    #20 $finish;
  end
endmodule
