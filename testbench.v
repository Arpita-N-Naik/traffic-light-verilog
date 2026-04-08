
module tb;

reg clk;
reg reset;
wire red, yellow, green;

// Instantiate module
traffic_light uut (
    .clk(clk),
    .reset(reset),
    .red(red),
    .yellow(yellow),
    .green(green)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);

    clk = 0;
    reset = 1;

    #10 reset = 0;

    #100 $finish;
end

endmodule