class generator;
  transaction trans;
  mailbox g2d;
  event gn;
  
  function new(mailbox g2d);
    this.g2d = g2d;
  endfunction
  
  task main();
    trans = new();
    forever begin
      void'(trans.randomize());
      g2d.put(trans);
      $display("  GENERATOR  ");
      $display("time=%0t, write_en=%0b, read_en=%0b, data_in=%h",
               $time, trans.write_en, trans.read_en, trans.data_in);
      @gn;
    end
  endtask
endclass
