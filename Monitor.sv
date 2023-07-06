
class Monitor extends uvm_monitor;



  `uvm_component_utils(Monitor)
  
  
  
  virtual ALU_interface intf;
  
  ALU_sequence_item item;
  
  
  uvm_analysis_port #(ALU_sequence_item) monitor_port;
  
  
 function new (string name= "Monitor", uvm_component parent);
 
 
     super.new(name,parent);
 
     `uvm_info(get_type_name() ," Inside constructor of Monitor Class ",UVM_LOW)
 
 
 endfunction: new
  
  
  
  
 
  function void build_phase (uvm_phase phase);
 
 
     super.build_phase(phase);
 
     `uvm_info(get_type_name() ," Inside build_phase of Monitor Class ",UVM_LOW)
	  
	  if(!(uvm_config_db #(virtual ALU_interface)::get(this, "*", "intf", intf)))
	  
	      `uvm_error(get_type_name() ," failed to get virtual interface inside Monitor class ")
 
      
		monitor_port=new("monitor_port",this);
		
		
 endfunction: build_phase
 
 
 
 
 
 
  function void connect_phase (uvm_phase phase);
 
 
     super.connect_phase(phase);
 
     `uvm_info(get_type_name() ," Inside connect_phase of Monitor Class ",UVM_LOW)
     
	  
 
 endfunction: connect_phase


 
 
 
 task run_phase(uvm_phase phase);

      super.run_phase(phase);
		
     `uvm_info(get_type_name() ," Inside run_phase of Monitor Class ",UVM_LOW)

	  
	  forever begin 
	  
	    item = ALU_sequence_item::type_id::create("item");
		 
		 wait(!intf.Reset);
		 
		 
		    @(posedge intf.Clk) 
			 
			 begin 
			 
			    item.A = intf.A;
				 
			    item.B = intf.B;
				 
			    item.op_code = intf.op_code;
				 
			    item.C_in = intf.C_in;
			 
			    
			 end
		 
		 
		 
		   @(posedge intf.Clk) 
			 
			 begin 
			 
			    item.Result = intf.Result;
				 
			    item.C_out = intf.C_out;
				 
			    item.Z_flag = intf.Z_flag;
				 			 
			 end		 
		 
	      
			monitor_port.write(item);
	  
	  
	  end
	  
	  
	  
endtask: run_phase 
 
 
 





endclass: Monitor