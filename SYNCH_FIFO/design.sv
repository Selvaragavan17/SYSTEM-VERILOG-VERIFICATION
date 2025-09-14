module fifo
  #(
    parameter DATA_WIDTH = 4,
    parameter DEPTH      = 16
  )
  (
    input                      clk,
    input                      rst,
    input                      write_en,
    input                      read_en,
    input  [DATA_WIDTH-1:0]    data_in,
    output reg [DATA_WIDTH-1:0] data_out,
    output                     full,
    output                     empty
  );

  reg [DATA_WIDTH-1:0] fifo[0:DEPTH-1];

  localparam DEPTH_LOG = $clog2(DEPTH);
  reg [DEPTH_LOG:0] w_ptr, r_ptr;

  // sequential logic
  always @(posedge clk) begin
    if (rst) begin
      data_out <= 0;
      w_ptr    <= 0;
      r_ptr    <= 0;
    end
    else begin
      // Write
      if (write_en && !full) begin
        fifo[w_ptr[DEPTH_LOG-1:0]] <= data_in;
        w_ptr <= w_ptr + 1'b1;
      end

      // Read
      if (read_en && !empty) begin
        data_out <= fifo[r_ptr[DEPTH_LOG-1:0]];
        r_ptr    <= r_ptr + 1'b1;
      end
    end
  end

  // status flags
  assign full  = (w_ptr[DEPTH_LOG] ^ r_ptr[DEPTH_LOG]) &&
                 (w_ptr[DEPTH_LOG-1:0] == r_ptr[DEPTH_LOG-1:0]);

  assign empty = (w_ptr == r_ptr);

endmodule
