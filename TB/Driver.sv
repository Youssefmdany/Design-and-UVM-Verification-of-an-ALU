

class Driver extends uvm_driver #(Seq_Item);

`uvm_component_utils(Driver )

virtual ALU_Intf intf;

Seq_Item  item;


function new(string name ="Driver" , uvm_component parent);

  super.new(name,parent);
  `uvm_info(get_type_name(),"inside constructor Driver class",UVM_LOW)

endfunction



function void build_phase(uvm_phase phase);

   super.build_phase(phase);

  `uvm_info(get_type_name(),"inside build phase of Driver class",UVM_LOW)
  
   if(!uvm_config_db #(virtual ALU_Intf) ::get(null,"*","intf",intf))
     `uvm_error(get_type_name(),"not able to get interface")
  
endfunction



function void connect_phase(uvm_phase phase);

super.connect_phase(phase);

`uvm_info(get_type_name(),"inside connect phase of Driver class",UVM_LOW)


endfunction



task run_phase(uvm_phase phase);

super.run_phase(phase);

`uvm_info(get_type_name(),"inside run phase of Driver class",UVM_LOW)

forever begin

  item= Seq_Item::type_id::create("item");
  
  seq_item_port.get_next_item(item);
  
  drive(item);

  seq_item_port.item_done();

  
end

endtask





task drive (Seq_Item item);

@(posedge intf.CLK);

 intf.Reset=item.Reset;
 intf.A=item.A;
 intf.B=item.B;
 intf.op_code=item.op_code;
 intf.C_in=item.C_in;


endtask









endclass


