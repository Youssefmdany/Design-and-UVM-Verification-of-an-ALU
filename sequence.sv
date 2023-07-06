



class Base_Sequence extends uvm_sequence #(ALU_sequence_item);
  


  `uvm_object_utils(Base_Sequence)
  
  ALU_sequence_item reset_pkt;
  
  
  
  
  function new (string name= "Base_Sequence");
  
  
       super.new(name);
		 
		 `uvm_info(get_type_name()," Inside constructor of Base_Sequence ",UVM_HIGH)

		 
  endfunction: new
  
  
  
  
  
  
  
  task body();
  
     reset_pkt = ALU_sequence_item::type_id::create("reset_pkt");
	  
	  start_item(reset_pkt);
     
	  if(!(reset_pkt.randomize() with {Reset==1;}))
	       
			 `uvm_error(" Base_Sequence "," the randomization faild ")
  
     finish_item(reset_pkt);
  
  endtask: body
  
  
  
  
  endclass: Base_Sequence
  
  
  
  
  
  
  
  
  
  
  
  
  class Test_Sequence extends Base_Sequence;


  `uvm_object_utils(Test_Sequence)
  
  ALU_sequence_item item;
  
  
  
  
  function new (string name= "Test_Sequence");
  
  
       super.new(name);
		 
		 `uvm_info(get_type_name() ," Inside constructor of Test_Sequence ",UVM_HIGH)

		 
  endfunction: new
  
  
  
  
  
  
  
  task body();
  
     item = ALU_sequence_item::type_id::create("item");
	  
	  start_item(item);
     
	  if(!(item.randomize() with {Reset==0;}))
	       
			 `uvm_error(" Test_Sequence "," the randomization faild ")
  
     finish_item(item);
  
  endtask: body
  
  
  
  
  endclass: Test_Sequence