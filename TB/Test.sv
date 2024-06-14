class Test extends uvm_test;



 `uvm_component_utils(Test)

 
 
 
   Environment Test_environment;
   
	Reset_Sequence  Reset_seq;
	
	Test_Sequence1  Test_seq1;
	Test_Sequence2  Test_seq2;
	Test_Sequence3  Test_seq3;	
	Test_Sequence4  Test_seq4;
	Test_Sequence5  Test_seq5;	
	
	
	
 
 function new (string name= "Test", uvm_component parent);
 
    super.new(name,parent);
 
    `uvm_info(get_type_name() ," Inside constructor of Test class ",UVM_LOW);
 
 endfunction: new





function void build_phase (uvm_phase phase);
    
	 super.build_phase(phase);
	 
    `uvm_info(get_type_name() ," Inside build phase of Test class ",UVM_LOW);

	 Test_environment= Environment::type_id::create("Test_environment",this);
	 
	 
endfunction: build_phase








task run_phase (uvm_phase phase );


     super.run_phase(phase);
     `uvm_info(get_type_name() ," Inside run phase of Test class ",UVM_LOW);

	  
   phase.raise_objection(this);
	 
	 
	       Reset_seq = Reset_Sequence::type_id::create("Reset_seq");
	    
		 Reset_seq.start(Test_environment.agent.sequencer);
	 
	    #10;
		 
		 		 
	 repeat(20000) begin 
		 
		 
		    Test_seq1 = Test_Sequence1::type_id::create("Test_seq1");

		    Test_seq1.start(Test_environment.agent.sequencer);
			 
			 #20;
			 		 
			 
	 end





	 repeat(100) begin 
		 
		 
		    Test_seq2 = Test_Sequence2::type_id::create("Test_seq2");

		    Test_seq2.start(Test_environment.agent.sequencer);
			 
			 #20;
			 		 
			 
	 end


	 repeat(100) begin 
		 
		 
		    Test_seq3 = Test_Sequence3::type_id::create("Test_seq3");

		    Test_seq3.start(Test_environment.agent.sequencer);
			 
			 #20;
			 		 
			 
	 end



	 repeat(100) begin 
		 
		 
		    Test_seq4 = Test_Sequence4::type_id::create("Test_seq4");

		    Test_seq4.start(Test_environment.agent.sequencer);
			 
			 #20;
			 		 
			 
	 end






	 repeat(100) begin 
		 
		 
		    Test_seq5 = Test_Sequence5::type_id::create("Test_seq5");

		    Test_seq5.start(Test_environment.agent.sequencer);
			 
			 #20;
			 		 
			 
	 end

	  
   phase.drop_objection(this);
	 
	 
	 

endtask: run_phase







endclass: Test
