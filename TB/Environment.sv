

class Environment extends uvm_env;

`uvm_component_utils(Environment)

Agent agent;

Scoreboard scoreboard;


Coverage_Collector coverage_collector;

 

function new(string name ="Environment" , uvm_component parent);

  super.new(name,parent);
  `uvm_info(get_type_name(),"inside constructor Environment class",UVM_LOW)

endfunction



function void build_phase(uvm_phase phase);

   super.build_phase(phase);

  `uvm_info(get_type_name(),"inside build phase of Environment class",UVM_LOW)

   agent = Agent::type_id::create("Agent",this);

   scoreboard = Scoreboard::type_id::create("Scoreboard",this);

   coverage_collector = Coverage_Collector::type_id::create("Coverage_Collector",this);




endfunction



function void connect_phase(uvm_phase phase);

super.connect_phase(phase);

`uvm_info(get_type_name(),"inside connect phase of Environment class",UVM_LOW)


agent.monitor.monitor_port.connect(scoreboard.SB_port);

agent.monitor.monitor_port.connect(coverage_collector.Coverage_Collector_port);



endfunction



task run_phase(uvm_phase phase);

super.run_phase(phase);

`uvm_info(get_type_name(),"inside run phase of Environment class",UVM_LOW)

endtask





endclass
