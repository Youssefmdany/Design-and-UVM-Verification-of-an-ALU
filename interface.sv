
interface ALU_interface(input logic Clk);

 logic Reset;
 
 logic[7:0] A,B;

 logic[3:0] op_code;

 bit C_in;

 logic[15:0] Result;

 bit C_out,Z_flag;




endinterface 