class generator;
  
  mailbox gen2drv;
  event main_ev;
  
  function new(mailbox gen2drv);
    
    this.gen2drv = gen2drv;
    
  endfunction
  
  task main();
    
    transaction trans;
    int i;
     trans = new();
    repeat(10)  begin 
      
      $display("--------------------------------------------");
    
      trans.randomize();
      gen2drv.put(trans);
    
      trans.display("DATA FROM GENERATOR");
      $display(" time = %0t",$time);
      @main_ev;
     
    end
    
  endtask
  
endclass
