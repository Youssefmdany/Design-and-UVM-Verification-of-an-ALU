

class Coverage_Collector extends uvm_subscriber #(Seq_Item);

`uvm_component_utils(Coverage_Collector)


uvm_analysis_imp #(Seq_Item,Coverage_Collector) Coverage_Collector_port;

Seq_Item  item;


uvm_analysis_port #(Seq_Item) monitor_port;





covergroup ALU_signals;

option.per_instance=1;


Reset_cov:coverpoint item.Reset;


Carry_in_cov:coverpoint item.C_in;

Operation_cov:coverpoint item.op_code
                             {

                                   bins ADD ={3'b000};

                                   bins SUB={3'b001};

                                   bins MULT ={3'b010};

                                   bins DIV ={3'b011};

                                   bins XOR ={3'b101};


                                       }


Data_A_cov: coverpoint item.A 
                             {

                                   bins all_ones={8'b11111111};

                                   bins all_zeros={8'b0};

                                   bins other_data=default;



                                       }



Data_B_cov: coverpoint item.B 
                             {

                                   bins all_ones={8'b11111111};

                                   bins all_zeros={8'b0};

                                   bins other_data=default;



                                       }





Data_AxBxop:cross Data_A_cov,Data_B_cov,Operation_cov
                                     {


                                         bins add_corner_case1 = binsof( Data_A_cov.all_ones ) &&  binsof( Data_B_cov.all_ones ) &&  binsof( Operation_cov.ADD );
                                         bins add_corner_case2 = binsof(  Data_A_cov.all_zeros ) && binsof( Data_B_cov.all_zeros)  &&  binsof( Operation_cov.ADD );

                                         bins sub_corner_case1 = binsof(  Data_A_cov.all_ones ) &&  binsof( Data_B_cov.all_ones )  && binsof( Operation_cov.SUB );
                                         bins sub_corner_case2 = binsof(  Data_A_cov.all_zeros ) && binsof( Data_B_cov.all_zeros ) && binsof( Operation_cov.SUB );

                                         bins mult_corner_case1 = binsof(  Data_A_cov.all_ones) && binsof( Data_B_cov.all_ones ) && binsof( Operation_cov.MULT );
                                         bins mult_corner_case2 = binsof(  Data_A_cov.all_zeros ) &&  binsof( Data_B_cov.all_zeros ) && binsof(  Operation_cov.MULT );

                                         bins div_corner_case1 = binsof(  Data_A_cov.all_ones ) && binsof( Data_B_cov.all_ones ) && binsof( Operation_cov.DIV );
                                         bins div_corner_case2 = binsof(  Data_A_cov.all_zeros ) && binsof( Data_B_cov.all_zeros ) && binsof( Operation_cov.DIV   );

                                         bins xor_corner_case1 = binsof(  Data_A_cov.all_ones ) && binsof( Data_B_cov.all_ones) && binsof( Operation_cov.XOR   );
                                         bins xor_corner_case2 = binsof(  Data_A_cov.all_zeros ) && binsof( Data_B_cov.all_zeros ) && binsof( Operation_cov.XOR   );



                                           }








endgroup




function new(string name ="Coverage_Collector" , uvm_component parent);

  super.new(name,parent);
  `uvm_info(get_type_name(),"inside constructor Monitor class",UVM_LOW)
  
  Coverage_Collector_port= new("cov_port",this);

  ALU_signals = new();
   
endfunction







function void build_phase(uvm_phase phase);

   super.build_phase(phase);

  `uvm_info(get_type_name(),"inside build phase of Coverage_Collector class",UVM_LOW)
  
  
endfunction






function void connect_phase(uvm_phase phase);

super.connect_phase(phase);

`uvm_info(get_type_name(),"inside connect phase of Coverage_Collector class",UVM_LOW)


endfunction



task run_phase(uvm_phase phase);

super.run_phase(phase);

`uvm_info(get_type_name(),"inside run phase of Coverage_Collector class",UVM_LOW)



endtask



function void write(Seq_Item  t);



item= Seq_Item::type_id::create("item");


$cast(item,t);


ALU_signals.sample();



endfunction





endclass




