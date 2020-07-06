module test;
  
  reg A;
  reg B;
  reg CIN;
  
  wire COUT;
  wire SUM; 
  
  int i,j,k;
    FULL_ADDER F_A (
      .A(A),
      .B(B),
      .CIN(CIN),
      .COUT(COUT),
      .SUM(SUM)
    );
  
  
  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1, test);
  
    for(i=0;i<=1;i++)begin
      A<=i;
      #10
      for(j=0;j<=1;j++)begin
        B<=j;
        #10
        for(k=0;k<=1;k++)begin
          CIN<=k;
          #10
          if(i+j+k > 1)begin
            if(COUT!=1)begin
              $display("COUT is not read correctly");
              #50 $finish;
            end
          end
          else begin
            if(COUT!=0)begin
              $display("COUT is not read correctly");
              #50 $finish;
            end            
          end
          if(SUM!=(i+j+k)%2)begin
            $display("SUM is not read correctly");
            #50 $finish;
          end
          $display("A=%d B=%d CIN=%d SUM=%d COUT=%d ",A,B,CIN,SUM,COUT);
        end
      end
    end
    $display("All tests passed.")
    #50 $finish;
  end
    
endmodule
          
