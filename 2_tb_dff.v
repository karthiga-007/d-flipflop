`timescale 1ns/1ps

module dff_tb;

reg clk;
reg rst;
reg D;
wire Q;

// Instantiate DUT
dff uut (
    .clk(clk),
    .rst(rst),
    .D(D),
    .Q(Q)
);


// Clock generation (10ns period → 100 MHz)
always #5 clk = ~clk;

initial begin
    // Dump file
    $dumpfile("dff.vcd");
    $dumpvars(0, dff_tb);

    // Initialize
    clk = 0;
    rst = 1;
    D = 0;

    #10 rst = 0;   // release reset

    // Apply inputs
    #10 D = 1;
    #10 D = 0;
    #10 D = 1;
    #10 D = 1;
    #10 D = 0;

    // Random testing
    repeat (5) begin
        #10 D = $random % 2;
    end

       // NO $stop
end

endmodule
