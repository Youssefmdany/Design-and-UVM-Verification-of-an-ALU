

`timescale 1ns/1ns

`include "interface.sv"

module Top();



import ALU_pkg::*;

import uvm_pkg::*;



logic clk;



ALU_interface intf(.Clk(clk));



DUT ALU_dut(

             .CLk(intf.Clk),
				 
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

clk=0;

forever #5 clk = ~clk;


end



initial begin 

uvm_config_db #(virtual ALU_interface)::set(null, "*", "intf", intf);
run_test("ALU_Test");

end

initial begin 
  
  #10000;
  
  $finish();
  
end





endmodule 