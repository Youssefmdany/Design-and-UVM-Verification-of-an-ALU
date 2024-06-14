
import uvm_pkg::*;


`include "Interface.sv"

import ALU_pkg::*;


module Top;



logic clk;


ALU_Intf intf(.CLK(clk));

DUT ALU_DUT( 
             .CLK(intf.CLK),
             .Reset(intf.Reset),
             .A(intf.A),                          
             .B(intf.B),                 
             .op_code(intf.op_code),
             .C_in(intf.C_in),
             .Result(intf.Result),
             .C_out(intf.C_out),
             .Z_flag(intf.Z_flag)             
                          
);






initial begin
  
  clk = 0;
  
  forever #10 clk=~clk;
  
end







initial begin
  

  #900000
  
  $finish();
  
end






initial begin
  
uvm_config_db #(virtual ALU_Intf)::set(null,"*","intf",intf);

run_test("Test");


 
end



endmodule

