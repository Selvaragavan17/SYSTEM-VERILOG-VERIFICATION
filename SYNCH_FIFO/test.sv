`include "environment.sv"

program test(intf vintf);
  environment env;
  
  initial begin
    env = new(vintf);
    env.run();
  end
endprogram
  
  
