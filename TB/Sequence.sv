

class Base_Sequence extends uvm_sequence #(Seq_Item);
  


  `uvm_object_utils(Base_Sequence)
  
  
  
  
  
  
  function new (string name= "Base_Sequence");
  
  
       super.new(name);
		 
		 `uvm_info(get_type_name()," Inside constructor of Base_Sequence ",UVM_HIGH)

		 
  endfunction: new
  
  
  
  
  
  
  
 
  
  
  
  
  endclass: Base_Sequence
  
  
  
  
  class Reset_Sequence extends Base_Sequence;


  `uvm_object_utils(Reset_Sequence)
  
  Seq_Item  item;
  
  
  
  
  function new (string name= "Reset_Sequence");
  
  
       super.new(name);
		 
		 `uvm_info(get_type_name() ," Inside constructor of Reset_Sequence ",UVM_HIGH)

		 
  endfunction: new
  
  
  
  
  
  
  
  task body();
  
     item = Seq_Item ::type_id::create("item");
	  
	  start_item(item);
     
	  if(!(item.randomize() with {Reset==1;}))
	       
			 `uvm_error(" Reset_Sequence "," the randomization faild ")
  
     finish_item(item);
  
  endtask: body
  
  
  
  
  endclass: Reset_Sequence 
  
  
  
  
  
  
  
  class Test_Sequence1 extends Base_Sequence;


  `uvm_object_utils(Test_Sequence1)
  
  Seq_Item  item;
  
  
  
  
  function new (string name= "Test_Sequence1");
  
  
       super.new(name);
		 
		 `uvm_info(get_type_name() ," Inside constructor of Test_Sequence1 ",UVM_HIGH)

		 
  endfunction: new
  
  
  
  
  
  
  
  task body();
  
     item = Seq_Item ::type_id::create("item");
	  
	  start_item(item);
     
	  if(!(item.randomize() with {Reset==0;}))
	       
			 `uvm_error(" Test_Sequence1 "," the randomization faild ")
  
     finish_item(item);
  
  endtask: body
  
  
  
  
  endclass: Test_Sequence1







class Test_Sequence2 extends Base_Sequence;


  `uvm_object_utils(Test_Sequence2)
  
  Seq_Item  item;
  
  
  
  
  function new (string name= "Test_Sequence2");
  
  
       super.new(name);
		 
		 `uvm_info(get_type_name() ," Inside constructor of Test_Sequence2 ",UVM_HIGH)

		 
  endfunction: new
  
  
  
  
  
  
  
  task body();
  
     item = Seq_Item ::type_id::create("item");
	  
	  start_item(item);
     
	  if(!(item.randomize() with {Reset==0; A==8'b1111_1111; B==8'b1111_1111;}))
	       
			 `uvm_error(" Test_Sequence2 "," the randomization faild ")
  
     finish_item(item);
  
  endtask: body
  
  
  
  
  endclass: Test_Sequence2





class Test_Sequence3 extends Base_Sequence;


  `uvm_object_utils(Test_Sequence3)
  
  Seq_Item  item;
  
  
  
  
  function new (string name= "Test_Sequence3");
  
  
       super.new(name);
		 
		 `uvm_info(get_type_name() ," Inside constructor of Test_Sequence3 ",UVM_HIGH)

		 
  endfunction: new
  
  
  
  
  
  
  
  task body();
  
     item = Seq_Item ::type_id::create("item");
	  
	  start_item(item);
     
	  if(!(item.randomize() with {Reset==0; A==0; B==0;}))
	       
			 `uvm_error(" Test_Sequence3 "," the randomization faild ")
  
     finish_item(item);
  
  endtask: body
  
  
  
  
  endclass: Test_Sequence3






class Test_Sequence4 extends Base_Sequence;


  `uvm_object_utils(Test_Sequence4)
  
  Seq_Item  item;
  
  
  
  
  function new (string name= "Test_Sequence4");
  
  
       super.new(name);
		 
		 `uvm_info(get_type_name() ," Inside constructor of Test_Sequence4 ",UVM_HIGH)

		 
  endfunction: new
  
  
  
  
  
  
  
  task body();
  
     item = Seq_Item ::type_id::create("item");
	  
	  start_item(item);
     
	  if(!(item.randomize() with {Reset==0; A==8'b1111_1111; B==0;}))
	       
			 `uvm_error(" Test_Sequence4 "," the randomization faild ")
  
     finish_item(item);
  
  endtask: body
  
  
  
  
  endclass: Test_Sequence4










class Test_Sequence5 extends Base_Sequence;


  `uvm_object_utils(Test_Sequence5)
  
  Seq_Item  item;
  
  
  
  
  function new (string name= "Test_Sequence5");
  
  
       super.new(name);
		 
		 `uvm_info(get_type_name() ," Inside constructor of Test_Sequence5 ",UVM_HIGH)

		 
  endfunction: new
  
  
  
  
  
  
  
  task body();
  
     item = Seq_Item ::type_id::create("item");
	  
	  start_item(item);
     
	  if(!(item.randomize() with {Reset==0; A==0; B==8'b1111_1111;}))
	       
			 `uvm_error(" Test_Sequence5 "," the randomization faild ")
  
     finish_item(item);
  
  endtask: body
  
  
  
  
  endclass: Test_Sequence5
