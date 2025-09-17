`include "interface.sv"
`include "test.sv"

module testbench;
  
  intf intff();
  
  test tst(intff);
  
  
  initial begin
    
    intff.clk = 0;
    forever #2 intff.clk = ~intff.clk;
    
  end
  
  dp_ram uut (
    .clk(intff.clk),
    
    .we_a(we_a),
    .din_a(din_a),
    .addr_a(addr_a),
    .dout_a(dout_a),
    
    .we_b(we_b),
    .din_b(din_b),
    .addr_b(addr_b),
    .dout_b(dout_b)
    
  );

  
endmodule
