
class transaction;
  
  localparam WIDTH=8 ;
  localparam ADDR=4 ;
  
  rand bit we_a;
  rand bit [WIDTH-1:0]din_a;
  rand bit [ADDR-1:0]addr_a;
  bit [WIDTH-1:0]dout_a;
  
  rand bit we_b;
  rand bit [WIDTH-1:0]din_b;
  rand bit [ADDR-1:0]addr_b;
  bit [WIDTH-1:0]dout_b;

  function void display(string name);
    $display("%s", name);
    $display("time = %0t\nen_a=%0b, din_a=%0d, addr_a=%0d, dout_a=%0d \nen_b=%0b, din_b=%0d, addr_b=%0d, dout_b=%0d  ",$time, we_a, din_a, addr_a, dout_a, we_b, din_b, addr_b, dout_b);
    
  endfunction
  
endclass

