`timescale 1ns/1ps

module dff (
    input clk,
    input rst,     // synchronous reset
    input D,
    output reg Q
);

always @(posedge clk) begin
    if (rst)
        Q <= 0;
    else
        Q <= D;
end

endmodule