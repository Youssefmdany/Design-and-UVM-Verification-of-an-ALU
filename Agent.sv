
class Agent extends uvm_agent;



  `uvm_component_utils(Agent)
  
  
  Monitor ALU_monitor;
  
  Driver  ALU_driver;

  Sequencer ALU_sequencer;
  
  
  
  
  
  
  
  
 function new (string name= "Agent", uvm_component parent);
 
 
     super.new(name,parent);
 
     `uvm_info(get_type_name()," Inside constructor of Agent Class ",UVM_LOW)
 
 
 endfunction: new
  
  
  
  
 
  function void build_phase (uvm_phase phase);
 
 
     super.build_phase(phase);
 
     `uvm_info(get_type_name() ," Inside build_phase of Agent Class ",UVM_LOW)
	  
	     ALU_monitor = Monitor::type_id::create("ALU_monitor",this);
  
        ALU_driver = Driver::type_id::create("ALU_driver",this);

        ALU_sequencer = Sequencer::type_id::create("ALU_sequencer",this);
	  
 
 endfunction: build_phase
 
 
 
 
 
 
  function void connect_phase (uvm_phase phase);
 
 
     super.connect_phase(phase);
 
     `uvm_info(get_type_name()," Inside connect_phase of Agent Class ",UVM_LOW)
 
     ALU_driver.seq_item_port.connect(ALU_sequencer.seq_item_export);
	  
	  
	  
 endfunction: connect_phase


 
 
 
 task run_phase(uvm_phase phase);

      super.run_phase(phase);
		
     `uvm_info(get_type_name() ," Inside run_phase of Agent Class ",UVM_LOW)

	  
endtask: run_phase 
 
 
 





endclass: Agent