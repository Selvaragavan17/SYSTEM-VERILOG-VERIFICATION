class transaction #(DATA_WIDTH=4);
  bit clk;
  bit rst;
  rand bit write_en;
  rand bit read_en;
  rand bit [DATA_WIDTH-1:0] data_in;
  bit [DATA_WIDTH-1:0] data_out;
  bit full;
  bit empty;
endclass
