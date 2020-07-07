module pi_1_shuffle_tb;
  reg [6-1 : 0] data_in [0 : 35];
  reg [6-1 : 0] data_out [0 : 35];
  
  pi_1_shuffle#(6) test(
    .data_in(data_in),
    .data_out(data_out));
  
    initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1, test);
    
      for(int i=0;i<36;i++)begin
        data_in[i]=i;
      end
      
      #10;
      if(data_out[0]!=0) begin
        $display("data_in[0] not shuffled correctly");
          #10 $finish;
        end 
      
      for(int i=1;i<35;i++)begin
        if(data_out[i]!=((6*i)%35)) begin
          $display("data_in[%d] not shuffled correctly",(6*i)%35);
          #10 $finish;
        end
      end
      
      if(data_out[35]!=35) begin
        $display("data_in[35] not shuffled correctly");
          #10 $finish;
        end     
      
        $display("All tests passed.");
        #10 $finish;
      end
endmodule
