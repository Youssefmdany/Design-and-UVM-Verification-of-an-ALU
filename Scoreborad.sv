

class Scoreborad extends uvm_test;



 `uvm_component_utils(Scoreborad)
 
  
 
  uvm_analysis_imp #( ALU_sequence_item , Scoreborad ) scoreborad_port;
 
 
  ALU_sequence_item  pkt_fifo[$];
 
 
 
 
 
 function new (string name= "Scoreborad", uvm_component parent);
 
 
    super.new(name,parent);
    
	 `uvm_info(get_type_name() ," Inside constructor of Scoreborad class ",UVM_LOW)
 
 endfunction: new
 
 
 
 
 
 
 function void build_phase (uvm_phase phase);
 
 
       super.build_phase(phase);
		 
	   `uvm_info(get_type_name()," Inside build phase of Scoreborad class ",UVM_LOW)
		 
      scoreborad_port=new("scoreborad_port",this);
		
		
 endfunction: build_phase
 
 
 
 
 
 
 function void connect_phase (uvm_phase phase);
 
 
      super.connect_phase(phase);
		
 	 `uvm_info(get_type_name() ," Inside connect phase of Scoreborad class ",UVM_LOW)

 
 endfunction: connect_phase
 
 
 
 
 
 
 
  function void write(ALU_sequence_item item);
 
   
	pkt_fifo.push_back(item);
 
 
 endfunction: write
 
 
 
 
 
 
 task run_phase (uvm_phase phase);
 
 
    super.run_phase(phase);
	 
 	 `uvm_info(get_type_name() ," Inside run phase of Scoreborad class ",UVM_LOW)
	 
	 forever begin 
	 
	      
     ALU_sequence_item curr_item;
	 
	   wait(pkt_fifo.size());
		
		curr_item=pkt_fifo.pop_front();
		
		compare(curr_item);
		
	 
	 
	 end
 
 
 endtask: run_phase
 
 
 
 
 task compare (ALU_sequence_item curr_item);
 
 
     logic[15:0] Temp;
	   logic C_temp,Z_temp;
     //ALU_sequence_item test_item;
	  
	  
	  case(curr_item.op_code)
	  
	   	  3'b000: begin 
	  
	        Temp=curr_item.A + curr_item.B + curr_item.C_in;
			  
	        
			  
			  if(Temp[8]==1)
			  
			       C_temp= 1;
					 
			  else
			  
			       C_temp= 0;
			  
	  
	  end
	  
	  
	  3'b001: begin 
	  
	  
	        Temp = curr_item.A - curr_item.B;


	  end
	  
	  
	  3'b010: begin 
	  
	       Temp = curr_item.A * curr_item.B;
	  

	  end
	  
	  
	  3'b011: begin 
	  
	  
	         Temp = curr_item.A / curr_item.B;
	  
	  
	  end
	  
	  
	  3'b100: begin 
	  
	  
	         Temp = curr_item.A & curr_item.B;
	  

	  end
	  
	  
	  3'b101: begin 
	  
	  
	        Temp = curr_item.A ^ curr_item.B;
	  
	  

	  end

	  
	  default: begin
	  
	  
	  	  	 Temp = 0;

	       C_temp = 0;
			 
	  
	  end

	  
endcase	  
	  
	if(Temp==0)

       	Z_temp= 1;
   else 
	
	    	Z_temp= 0;

			
    
   if(!(Temp==curr_item.Result && Z_temp==curr_item.Z_flag &&
	
	C_temp==curr_item.C_out))	 begin 

		`uvm_error(" Scoreborad class ",$sformatf(" the test failed as the expected value= %d while the actual value= %d ", Temp, curr_item.Result) )
		
				
		end
		
	else 

		`uvm_info(" Scoreborad class ",
		" the test passed ",UVM_HIGH )
    	
		

			
 
 endtask: compare


 
 
 
 endclass: Scoreborad