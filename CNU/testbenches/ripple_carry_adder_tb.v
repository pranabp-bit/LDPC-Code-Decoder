module ripple_carry_adder_tb ;
 
  parameter WIDTH = 5;
 
  reg [WIDTH-1:0] r_ADD_1 = 0;
  reg [WIDTH-1:0] r_ADD_2 = 0;
  wire [WIDTH-1:0]  w_RESULT;
  wire COUT;
   
  ripple_carry_adder #(.WIDTH(WIDTH)) ripple_carry_inst
    (
     .A(r_ADD_1),
     .B(r_ADD_2),
      .SUM(w_RESULT),
      .COUT(COUT)
     );
 
  initial
    begin
      $dumpfile("dump.vcd"); 
      $dumpvars;
      for(int i=0;i<50;i++)begin
        r_ADD_1 = $random%(WIDTH+1);
        r_ADD_2 = $random%(WIDTH+1);
        #10;
        if(r_ADD_1+r_ADD_2 != w_RESULT+COUT*(1<<WIDTH))begin 
          $display("FAILED");
          #10 $finish;
        end
      end
      $display("All tests passed.");
      #10 $finish;
    end
 
endmodule // ripple_carry_adder_tb
