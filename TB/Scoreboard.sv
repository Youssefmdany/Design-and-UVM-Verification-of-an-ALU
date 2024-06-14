
class Scoreboard extends uvm_scoreboard;
  
  
  `uvm_component_utils(Scoreboard)
  
  
  
uvm_analysis_imp#(Seq_Item ,Scoreboard) SB_port;

Seq_Item items_Q[$];

Seq_Item item_t;



function new(string name = "Scoreboard" , uvm_component parent);

  super.new(name , parent);

`uvm_info(get_type_name(),"inside constructor Scoreboard class",UVM_LOW)


endfunction






function void build_phase(uvm_phase phase);

 super.build_phase(phase);
`uvm_info(get_type_name(),"inside build_phase of Scoreboard class",UVM_LOW)

 SB_port = new("SB_port ",this);

endfunction







task run_phase(uvm_phase phase);

  super.run_phase(phase);

`uvm_info(get_type_name(),"inside run_phase of Scoreboard class",UVM_LOW)



forever begin
  
  
 item_t = Seq_Item::type_id::create("item");
 
 wait(items_Q.size);

 item_t =  items_Q.pop_front();
 
 
 compare(item_t);
  
  
end




endtask 
 





 
  
function void write(Seq_Item item);

items_Q.push_back(item);




endfunction  





function void compare(Seq_Item item_i);
  
 
 
logic[16:0] Result_t;

logic C_out_t, Z_flag_t;
 


   if(item_i.op_code==3'b000)
  
        Result_t=item_i.A + item_i.B +item_i.C_in;  
        
  else if(item_i.op_code==3'b001)
  
        Result_t=item_i.A - item_i.B ;
        
  else if(item_i.op_code==3'b001)
  
        Result_t=item_i.A - item_i.B ;
        
        
  else if(item_i.op_code==3'b010)
  
        Result_t=item_i.A * item_i.B ;        
        
        
  else if(item_i.op_code==3'b011)
  
        if(item_i.B==0)
              
              `uvm_error(get_type_name(),$sformatf("Divison on Zero"))
       
        else
              Result_t=item_i.A / item_i.B ;        
        
        
  else if(item_i.op_code==3'b100)
  
        Result_t=item_i.A & item_i.B ; 
        
  else if(item_i.op_code==3'b101)
  
        Result_t=item_i.A ^ item_i.B ;    
        
        
        
  if(!Result_t)
    
    Z_flag_t=1;
    
    
  if(Result_t[16])  
    C_out_t=1;
    
    
    
    
    
 if(!(Result_t[15:0]==item_i.Result && item_i.Z_flag==Z_flag_t && item_i.Z_flag==Z_flag_t))
   `uvm_error(get_type_name(), $sformatf("failure!! the actual result= %d while the expected reuslt= %d",item_i.Result,Result_t[15:0]))  
          


  
endfunction



  
  
endclass
