//compiled with system verilog support
module pi_2_shuffle(data_in ,data_out);

    parameter DATA_WIDTH = 6;


  input [DATA_WIDTH-1 : 0] data_in [0 : 35];
  output [DATA_WIDTH-1 : 0] data_out [0 : 35];

//Inputs from PE (x,y) in order => PE (1,1), PE(2,1),  PE(3,1)...
 //PE(x,y) has to be mapped to same CNU
 //here, map PE(x,y) with same y to same group of 6 outputs
assign data_out[0] = data_in[30];
assign data_out[1] = data_in[31];
assign data_out[2] = data_in[32];
assign data_out[3] = data_in[33];
assign data_out[4] = data_in[34];
assign data_out[5] = data_in[35];
assign data_out[6] = data_in[24];
assign data_out[7] = data_in[25];
assign data_out[8] = data_in[26];
assign data_out[9] = data_in[27];
assign data_out[10] = data_in[28];
assign data_out[11] = data_in[29];
assign data_out[12] = data_in[18];
assign data_out[13] = data_in[19];
assign data_out[14] = data_in[20];
assign data_out[15] = data_in[21];
assign data_out[16] = data_in[22];
assign data_out[17] = data_in[23];
assign data_out[18] = data_in[12];
assign data_out[19] = data_in[13];
assign data_out[20] = data_in[14];
assign data_out[21] = data_in[15];
assign data_out[22] = data_in[16];
assign data_out[23] = data_in[17];
assign data_out[24] = data_in[6];
assign data_out[25] = data_in[7];
assign data_out[26] = data_in[8];
assign data_out[27] = data_in[9];
assign data_out[28] = data_in[10];
assign data_out[29] = data_in[11];
assign data_out[30] = data_in[0];
assign data_out[31] = data_in[1];
assign data_out[32] = data_in[2];
assign data_out[33] = data_in[3];
assign data_out[34] = data_in[4];
assign data_out[35] = data_in[5];

endmodule
