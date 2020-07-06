  
// Convert number from Signed format to Two's complement

module S_to_T (in, out);
  parameter DATA_WIDTH = 5; 

  input  [DATA_WIDTH - 1 : 0] in;
  output [DATA_WIDTH - 1 : 0] out;

  reg [DATA_WIDTH - 1 : 0] out;

always @* begin
  if (in[DATA_WIDTH-1] == 1)       //negative
    out = ~in[DATA_WIDTH-2:0]+1;   //then take 2's complement of all bits except the signed bit
  else                             //positive
    out = in;                      // output the same number 
end

endmodule
