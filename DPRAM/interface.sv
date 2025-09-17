interface intf #(parameter WIDTH=8,ADDR=4) ;
  
  logic clk;
  
  logic we_a;
  logic [WIDTH-1:0]din_a;
  logic [ADDR-1:0]addr_a;
  logic [WIDTH-1:0]dout_a;
  
  logic we_b;
  logic [WIDTH-1:0]din_b;
  logic [ADDR-1:0]addr_b;
  logic [WIDTH-1:0]dout_b;
   
endinterface
