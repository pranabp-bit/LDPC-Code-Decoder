module UP_COUNTER(clk, rstn, en, out);
  
    parameter DATA_WIDTH = 8;
    parameter COUNT_FROM=0;
  
    input clk;               
    input rstn; 
    input en;
    output reg[DATA_WIDTH-1:0] out;   
  
  
  
  
  always @ (posedge clk && en) begin
    if (rstn) begin
      out <= COUNT_FROM;
    end 
    else begin 
      out <= out + 1;
    end
  end
endmodule
