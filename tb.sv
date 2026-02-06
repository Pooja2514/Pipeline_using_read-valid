module tb;

    logic clk;
    logic rst_n;

    logic [31:0] in_data;
    logic        in_valid;
    logic        in_ready;

    logic [31:0] out_data;
    logic        out_valid;
    logic        out_ready;

    pipeline_reg dut (
        .clk(clk),
        .rst_n(rst_n),
        .in_data(in_data),
        .in_valid(in_valid),
        .in_ready(in_ready),
        .out_data(out_data),
        .out_valid(out_valid),
        .out_ready(out_ready)
    );

    // Clock: 10ns period
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;
        in_valid = 0;
        out_ready = 0;
        in_data = 0;

        #20;
        rst_n = 1;

        // Cycle 1: upstream sends data
        #10;
        in_valid = 1;
        in_data  = 32'hAAAA_0001;
        out_ready = 1;

        // Cycle 2: downstream stalls
        #10;
        out_ready = 0;

        // Cycle 3: downstream ready again
        #10;
        out_ready = 1;

        // Stop sending
        #10;
        in_valid = 0;

        #50;
        $finish;
    end
  initial
    begin
      $dumpfile("dump.vcd"); $dumpvars;
    end

endmodule
