class monitor;
  
  virtual intf vif;
  mailbox mon2scr;
  
  function new(virtual intf vif,mailbox mon2scr);
    
    this.vif = vif;
    this.mon2scr = mon2scr;
    
  endfunction
  
  task main();
    
    transaction trans;
    int i;
    trans = new();
    repeat(10) begin 
        
      #3;
      
      trans.we_a = vif.we_a;
      trans.din_a = vif.din_a;
      trans.addr_a = vif.addr_a;
      trans.dout_a = vif.dout_a;
      
      trans.we_b = vif.we_b;
      trans.din_b = vif.din_b;
      trans.addr_b = vif.addr_b;
      trans.dout_b = vif.dout_b;
      
      mon2scr.put(trans);
      
      trans.display("DATA FROM MONITOR");
      $display("time = %0t",$time);
      #1;

    end
    
  endtask
  
endclass
