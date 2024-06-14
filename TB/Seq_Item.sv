

class Seq_Item extends uvm_sequence_item ;



 `uvm_object_utils(Seq_Item)


rand logic Reset;

rand logic[7:0] A,B;

rand logic[3:0] op_code;

rand bit C_in;

logic[15:0] Result;

bit C_out, Z_flag;



constraint op_const  {  op_code inside {[4'b0000:4'b0101]} ; }



function new (string name= "Seq_Item ");

   super.new(name);

   `uvm_info(get_type_name(),"inside constructor of Seq_Item  class",UVM_LOW)


endfunction










endclass: Seq_Item 
