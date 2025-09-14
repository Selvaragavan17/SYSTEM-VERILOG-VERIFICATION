`include "interface.sv"
`include "test.sv"

module testbench;
  logic clk;
  logic rst;
  
  intf vintf(clk, rst);
  test tst(vintf);

  fifo dut(
    .clk(vintf.clk),
    .rst(vintf.rst),
    .write_en(vintf.write_en),
    .read_en(vintf.read_en),
    .data_in(vintf.data_in),
    .data_out(vintf.data_out),
    .full(vintf.full),
    .empty(vintf.empty)
  );
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    rst = 1;
    #10;
    rst = 0;
    #300;
    $finish;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
