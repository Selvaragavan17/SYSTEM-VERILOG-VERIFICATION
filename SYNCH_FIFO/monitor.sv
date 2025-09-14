class monitor;
  transaction trans;
  mailbox m2s;
  virtual intf vintf;
  
  function new(mailbox m2s, virtual intf vintf);
    this.m2s = m2s;
    this.vintf = vintf;
  endfunction
  
  task main();
    trans = new();
    forever begin
      @(posedge vintf.clk) begin      
        trans.clk      = vintf.clk;
        trans.rst      = vintf.rst;
        trans.write_en = vintf.write_en;
        trans.read_en  = vintf.read_en;
        trans.data_in  = vintf.data_in;
        #1;
        trans.data_out = vintf.data_out;
        trans.full     = vintf.full;
        trans.empty    = vintf.empty;
        
        m2s.put(trans);
        $display("  MONITOR  ");
        $display("time=%0t, clk=%0b, rst=%0b, write_en=%0b, read_en=%0b, data_in=%h, data_out=%h, full=%0b, empty=%0b",
                 $time, trans.clk, trans.rst, trans.write_en, trans.read_en, trans.data_in, trans.data_out, trans.full, trans.empty);
      end
    end
  endtask
endclass
