
class Driver extends uvm_driver #(ALU_sequence_item);



 `uvm_component_utils(Driver)
 
 
 virtual ALU_interface intf;
 
 ALU_sequence_item item;
 
 
 
 
 function new (string name= "Driver",uvm_component parent);
 
   super.new(name,parent);
   
	`uvm_info(get_type_name() ,"Inside constructor of Driver class ", UVM_LOW);

	
 endfunction: new
 
 
 
 
 function void build_phase (uvm_phase phase);
 
    super.build_phase(phase);
	 
	`uvm_info(get_type_name() ,"Inside build phase of Driver class ", UVM_LOW);
	 
	 
	 if(!(uvm_config_db #(virtual ALU_interface)::get(this, "*", "intf",intf)))
	 
	    `uvm_error(get_type_name(), " failed to get virtual interface inside Driver class ")
		 

 
 endfunction: build_phase
 
 
 
 
 
 function void connect_phase (uvm_phase phase);
 
    super.connect_phase(phase);
	  
 	`uvm_info(get_type_name() ,"Inside conncet phase of Driver class ", UVM_LOW);

	
 endfunction: connect_phase
 
 
 
 
 
 task run_phase (uvm_phase phase);
 
    super.run_phase(phase);

 	`uvm_info(get_type_name() ,"Inside run phase of Driver class ", UVM_LOW);
	 
    forever begin 
	 
	    item=ALU_sequence_item::type_id::create("item");
	     
		 seq_item_port.get_next_item(item);
	     
		 drive(item);

		 seq_item_port.item_done();
	 
	 end
 
 
 
 endtask: run_phase
 
 
 
 
 
 
 task drive (ALU_sequence_item item);
 
	 
	 
	 @(posedge intf.Clk );
	  
    
	 	     intf.Reset = item.Reset;

	        intf.A = item.A;
			  
	        intf.B = item.B;
			  
	        intf.op_code = item.op_code;
			  
	        intf.C_in = item.C_in;
			 
			 
    
 
     
     
 endtask: drive
 
 
 
 
 
 
 endclass: Driver