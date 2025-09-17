class driver;
  
  mailbox gen2drv;
  virtual intf vif;
  
  function new(virtual intf vif ,mailbox gen2drv);
    
    this.vif = vif;
    this.gen2drv = gen2drv;
    
  endfunction
  
  task main();
    
    transaction trans;
    int i;
    trans = new(); 
    repeat(10)  begin 
      

      gen2drv.get(trans);
      
      vif.we_a <= trans.we_a ;
      vif.din_a <= trans.din_a;
      vif.addr_a <= trans.addr_a;
      
      vif.we_b <= trans.we_b ;
      vif.din_b <= trans.din_b;
      vif.addr_b <= trans.addr_b;
      
      trans.display("DATA FROM DRIVER");
      $display("time = %0t",$time);

    end
    
  endtask
  
  
endclass
