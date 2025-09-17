class scoreboard;
  
  localparam WIDTH=4 ;
  localparam ADDR=2 ;
  
  mailbox mon2scr;
  event main_ev;
  
  bit [WIDTH-1:0] temp [(2**ADDR)-1:0];
  
  function new(mailbox mon2scr);
    
    this.mon2scr = mon2scr;
    
  endfunction
  
  task main();
    
    transaction trans;
    int i;
    trans = new();
    repeat(10)  begin 
      
      
      mon2scr.get(trans);
    
      if( trans.we_a ) begin
          	temp[trans.addr_a] = trans.din_a;
        	trans.display("DATA FROM SCOREBOARD");        
      end
      else begin
        
        if( temp[trans.addr_a] == trans.dout_a ) begin
          $display("*****************************************");
          $display("                PASS");
          $display("*****************************************");
        end
        else begin
          $display("*****************************************");
          $display("                FAIL");
          $display("*****************************************");
        end 
      end 
      
      
      if( trans.we_b ) begin
        temp[trans.addr_b] = trans.din_b;
        	trans.display("DATA FROM SCOREBOARD");        
      end
      else begin
        
        if( temp[trans.addr_b] == trans.dout_b ) begin
          $display("*****************************************");
          $display("                PASS");
          $display("*****************************************");
        end
        else begin
          $display("*****************************************");
          $display("                FAIL");
          $display("*****************************************");
        end 
      end

      
      
      ->main_ev;
    end

  endtask
  
endclass
