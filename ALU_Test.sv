

class ALU_Test extends uvm_test;



 `uvm_component_utils(ALU_Test)

 
 
 
   Environment ALU_environment;
   
	Base_Sequence  Reset_seq;
	
	Test_Sequence  Test_seq;
	
	
	
	
	
 
 function new (string name= "ALU_Test", uvm_component parent);
 
    super.new(name,parent);
 
    `uvm_info(get_type_name() ," Inside constructor of ALU_Test class ",UVM_LOW);
 
 endfunction: new





function void build_phase (uvm_phase phase);
    
	 super.build_phase(phase);
	 
    `uvm_info(get_type_name() ," Inside build phase of ALU_Test class ",UVM_LOW);

	 ALU_environment = Environment::type_id::create("ALU_environment",this);
	 
	 
endfunction: build_phase







function void connect_phase (uvm_phase phase);

     super.connect_phase(phase);
	  
	  `uvm_info(get_type_name() ," Inside connect phase of ALU_Test class ",UVM_LOW);


endfunction: connect_phase








task run_phase (uvm_phase phase );


     super.run_phase(phase);
	  
	  `uvm_info(get_type_name() ," Inside run phase of ALU_Test class ",UVM_LOW);

	  
    phase.raise_objection(this);
	 
	 
	    Reset_seq = Base_Sequence::type_id::create("Reset_seq");
	    
		 Reset_seq.start(ALU_environment.ALU_agent.ALU_sequencer);
	 
	    #10;
		 
		 		 
	 repeat(900) begin 
		 
		 
		    Test_seq = Test_Sequence::type_id::create("Test_seq");

		    Test_seq.start(ALU_environment.ALU_agent.ALU_sequencer);
			 
			 #10;
			 
			 
			 
			 
			 
	 end
	  
    phase.drop_objection(this);
	 
	 
	 

endtask: run_phase







endclass: ALU_Test