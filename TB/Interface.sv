

interface ALU_Intf (input logic CLK);


logic Reset;

logic[7:0] A,B;

logic[3:0] op_code;

bit C_in;

logic[15:0] Result;

bit C_out, Z_flag;





endinterface
