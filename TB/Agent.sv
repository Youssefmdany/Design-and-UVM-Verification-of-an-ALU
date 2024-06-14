


class Agent extends uvm_agent;

`uvm_component_utils(Agent)

Sequencer sequencer;

Driver driver;

Monitor monitor;

function new(string name ="Agent" , uvm_component parent);

  super.new(name,parent);
  `uvm_info(get_type_name(),"inside constructor Agent class",UVM_LOW)

endfunction



function void build_phase(uvm_phase phase);

   super.build_phase(phase);

  `uvm_info(get_type_name(),"inside build phase of Agent class",UVM_LOW)
 
   sequencer = Sequencer::type_id::create("Sequencer",this);

   driver = Driver::type_id::create("Driver",this);

   monitor = Monitor::type_id::create("Monitor",this);


endfunction



function void connect_phase(uvm_phase phase);

super.connect_phase(phase);

`uvm_info(get_type_name(),"inside connect phase of Agent class",UVM_LOW)

driver.seq_item_port.connect(sequencer.seq_item_export);


endfunction



task run_phase(uvm_phase phase);

super.run_phase(phase);

`uvm_info(get_type_name(),"inside run phase of Agent class",UVM_LOW)

endtask

endclass

