`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  transaction trans;
  generator gen;
  driver dri;
  monitor mon;
  scoreboard scb;
  
  mailbox g2d;
  mailbox m2s;
  
  virtual intf vintf;
  event gn;
  
  function new(virtual intf vintf);
    this.vintf = vintf;
    g2d = new();
    m2s = new();
    gen = new(g2d);
    dri = new(g2d, vintf);
    mon = new(m2s, vintf);
    scb = new(m2s);
    gen.gn = gn;
    scb.gn = gn;
  endfunction
  
  task run();
    fork
      gen.main();
      dri.main();
      mon.main();
      scb.main();
    join
  endtask
endclass
