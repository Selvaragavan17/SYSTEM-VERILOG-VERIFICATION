`timescale 1ns / 1ps
module dp_ram 
#(parameter WIDTH=8,ADDR=4)(
    input clk,
  
    input we_a,
    input [WIDTH-1:0] din_a,
    input [ADDR-1:0] addr_a,
    output reg [WIDTH-1:0] dout_a,
    
    input we_b,
    input [WIDTH-1:0] din_b,
    input [ADDR-1:0] addr_b,
    output reg [WIDTH-1:0] dout_b
    
 );
    reg [WIDTH-1:0] mem [(2**ADDR)-1:0];
    
    always @(posedge clk) begin
        if(we_a)
            mem[addr_a]<=din_a;
        else
            dout_a <= mem[addr_a];
    end
    
    always @(posedge clk) begin
        if(we_b)
            mem[addr_b]<=din_b;
        else
            dout_b <= mem[addr_b];
    end
    
endmodule
