

class Monitor extends uvm_monitor;

`uvm_component_utils(Monitor)

virtual ALU_Intf intf;

Seq_Item  item;


uvm_analysis_port #(Seq_Item) monitor_port;

function new(string name ="Monitor" , uvm_component parent);

  super.new(name,parent);
  `uvm_info(get_type_name(),"inside constructor Monitor class",UVM_LOW)
  
  monitor_port= new("monitor_port",this);

endfunction



function void build_phase(uvm_phase phase);

   super.build_phase(phase);

  `uvm_info(get_type_name(),"inside build phase of Monitor class",UVM_LOW)
  
    if(!uvm_config_db #(virtual ALU_Intf)::get(null,"*","intf",intf))
     `uvm_error(get_type_name(),"not able to get interface")
  
endfunction



function void connect_phase(uvm_phase phase);

super.connect_phase(phase);

`uvm_info(get_type_name(),"inside connect phase of Monitor class",UVM_LOW)


endfunction



task run_phase(uvm_phase phase);

super.run_phase(phase);

`uvm_info(get_type_name(),"inside run phase of Monitor class",UVM_LOW)




forever begin

  item= Seq_Item::type_id::create("item");
  
@(posedge intf.CLK);

  item.A=intf.A;
  item.B=intf.B;
  item.Reset=intf.Reset;
  item.op_code=intf.op_code;
  item.C_in=intf.C_in;

@(posedge intf.CLK);

  item.Result=intf.Result;
  item.C_out=intf.C_out;
  item.Z_flag=intf.Z_flag;



monitor_port.write(item);




end

endtask














endclass

