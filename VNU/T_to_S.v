// Convert number from Two's complement to sign-magnitude

module T_to_S (in, out);
  parameter DATA_WIDTH = 6; 

  input  [DATA_WIDTH - 1 : 0] in;
  output [DATA_WIDTH : 0] out;

  reg [DATA_WIDTH  : 0] out;

always @* begin
  if (in[DATA_WIDTH-1] == 1)begin        //negative
    out[DATA_WIDTH]=1;                   //sign bit 
    out[DATA_WIDTH-1:0] = ~(in-1);       //getting the modulus of number from its 2's complement
  end
  else begin                             //positive
    out = in;                            //same input as output
  end// output the same number 
end

endmodule
