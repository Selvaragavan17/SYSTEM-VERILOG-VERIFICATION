class scoreboard;
  transaction trans;
  mailbox m2s;
  event gn;
  bit [3:0] out;
  bit f;
  bit e;
  logic [3:0] queue[0:31];
  logic [4:0] w_p, r_p;
  
  function new(mailbox m2s);
    this.m2s = m2s;
  endfunction
  
  function bit is_f();
    return (w_p[4] != r_p[4]) && (w_p[3:0] == r_p[3:0]);
  endfunction
  
  function bit is_e();
    return (w_p == r_p);
  endfunction
  
  task main();
    forever begin
      m2s.get(trans);
      $display("  SCOREBOARD  ");
      
      if (trans.rst) begin
        out  = 0;
        w_p  = 0;
        r_p  = 0;
      end 
      else begin
        if (trans.write_en && !f) begin
          queue[w_p] = trans.data_in;
          w_p = w_p + 1'b1;
        end
        if (trans.read_en && !e) begin
          out = queue[r_p];
          r_p = r_p + 1'b1;
        end
      end
      
      f = is_f();
      e = is_e();
      
      $display("time=%0t, rst=%0b, we=%0b, re=%0b, data_in=%h, data_out=%h, full=%0b, empty=%0b",
               $time, trans.rst, trans.write_en, trans.read_en, trans.data_in, trans.data_out, trans.full, trans.empty);
      $display("expected out=%h, full=%0b, empty=%0b", out, f, e);
      
      if ((out == trans.data_out) && (f == trans.full) && (e == trans.empty))
        $display("PASS");
      else
        $display("FAIL");
      $display("-----------------------------------------------");
      
      ->gn;
    end
  endtask
endclass
