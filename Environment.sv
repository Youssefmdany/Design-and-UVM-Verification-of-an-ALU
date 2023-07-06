

class Environment extends uvm_env;



  `uvm_component_utils(Environment)
  
  
  
   Agent ALU_agent;
	
	Scoreborad ALU_scoreborad;
	
	
  
  
  
  
 function new (string name= "ALU_env", uvm_component parent);
 
 
     super.new(name,parent);
 
     `uvm_info(get_type_name() ," Inside constructor of Environment Class ",UVM_LOW)
 
 
 endfunction: new
  
  
  
  
 
  function void build_phase (uvm_phase phase);
 
 
     super.build_phase(phase);
 
     `uvm_info(get_type_name() ," Inside build_phase of Environment Class ",UVM_LOW)
	  
	  
      ALU_agent = Agent::type_id::create("ALU_agent",this);
		
		ALU_scoreborad = Scoreborad::type_id::create("ALU_scoreborad",this);
		
		
 endfunction: build_phase
 
 
 
 
 
 
  function void connect_phase (uvm_phase phase);
 
 
     super.connect_phase(phase);
 
     `uvm_info(get_type_name() ," Inside connect_phase of Environment Class ",UVM_LOW)
 
      ALU_agent.ALU_monitor.monitor_port.connect(ALU_scoreborad.scoreborad_port);
     
 
 endfunction: connect_phase


 
 
 
 
 task run_phase(uvm_phase phase);

      super.run_phase(phase);
		
     `uvm_info(get_type_name() ," Inside run_phase of Environment Class ",UVM_LOW)

	  
endtask: run_phase 
 
 
 
 
 
 
endclass: Environment