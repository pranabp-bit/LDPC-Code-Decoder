//generated from c++
module pi_2_shuffle_tb;
  reg [6-1 : 0] data_in [0 : 35];
  reg [6-1 : 0] data_out [0 : 35];
  
  pi_2_shuffle#(6) test(
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
      if(( data_out[0] != 30) ||
( data_out[1] != 31) ||
( data_out[2] != 32) ||
( data_out[3] != 33) ||
( data_out[4] != 34) ||
( data_out[5] != 35) ||
( data_out[6] != 24) ||
( data_out[7] != 25) ||
( data_out[8] != 26) ||
( data_out[9] != 27) ||
( data_out[10] != 28) ||
( data_out[11] != 29) ||
( data_out[12] != 18) ||
( data_out[13] != 19) ||
( data_out[14] != 20) ||
( data_out[15] != 21) ||
( data_out[16] != 22) ||
( data_out[17] != 23) ||
( data_out[18] != 12) ||
( data_out[19] != 13) ||
( data_out[20] != 14) ||
( data_out[21] != 15) ||
( data_out[22] != 16) ||
( data_out[23] != 17) ||
( data_out[24] != 6) ||
( data_out[25] != 7) ||
( data_out[26] != 8) ||
( data_out[27] != 9) ||
( data_out[28] != 10) ||
( data_out[29] != 11) ||
( data_out[30] != 0) ||
( data_out[31] != 1) ||
( data_out[32] != 2) ||
( data_out[33] != 3) ||
( data_out[34] != 4) ||
( data_out[35] != 5)
         
        )begin $display("FAILED");
      #10 $finish;
         end
      
        $display("All tests passed.");
        #10 $finish;
      end
endmodule
