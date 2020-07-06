module FULL_ADDER(A,B,CIN,COUT,SUM);

//input ports
  input A;
  input B;
  input CIN;

//output ports  
  output reg COUT;
  output reg SUM;

//behavioral model
  always @(A or B or CIN)
  begin 
   SUM = A ^ B ^ CIN; 
   COUT = A&B | (A^B) & CIN; 
  end

endmodule  
