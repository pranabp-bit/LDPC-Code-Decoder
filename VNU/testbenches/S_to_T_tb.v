module S_to_T_tb;

    parameter DATA_WIDTH = 6;
  
    reg [DATA_WIDTH-1 : 0] in;
    wire [DATA_WIDTH-1 : 0] out;
  
  reg [DATA_WIDTH-1 : 0] temp;  


  S_to_T # (DATA_WIDTH) test (
      .in(in),
      .out(out)
    );

    initial begin
      $dumpfile("dump.vcd"); 
      $dumpvars;

      for(int i=0; i<(1<<DATA_WIDTH); ++i) begin
            in = i;
        $display("input = %b", i[DATA_WIDTH-1:0]);
            #10;
          if(i<=31)begin
            if(out!=in)begin
              $display("FAILED at in= %b",in);
              #10 $finish;
            end
          end
          else begin
            temp=-(i-(1<<(DATA_WIDTH-1)));
            if(out!=temp)begin
              $display("FAILED at in= %b",in);
              #10 $finish;              
            end
          end
              $display("output = %b", out);
        end

          $display("ALL tests passed.");
        #10 $finish;
    end
endmodule
