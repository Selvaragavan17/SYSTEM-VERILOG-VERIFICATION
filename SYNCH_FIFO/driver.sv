class driver;
  transaction trans;
  mailbox g2d;
  virtual intf vintf;
  
  function new(mailbox g2d, virtual intf vintf);
    this.g2d   = g2d;
    this.vintf = vintf;
  endfunction
  
  task main();
    forever begin 
      trans = new();
      g2d.get(trans);
      vintf.write_en = trans.write_en;
      vintf.read_en  = trans.read_en;
      vintf.data_in  = trans.data_in;
      
      $display("  DRIVER  ");
      $display("time=%0t, clk=%0b, write_en=%0b, read_en=%0b, data_in=%h, rst=%0b",
               $time, vintf.clk, trans.write_en, trans.read_en, trans.data_in, vintf.rst);
    end
  endtask
endclass
