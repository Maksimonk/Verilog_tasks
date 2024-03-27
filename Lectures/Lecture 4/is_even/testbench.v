`include "C:/Users/ddyam/Desktop/my_repositories/Verilog_tasks/Lectures/Lecture 4/is_even.v"
`timescale 1ns/1ns

module testbench();

reg [31:0] num_test;
wire result;

always begin
    #1
    num_test = $random();
end

is_even test_even (
    .number(num_test),
    .even(result)
);

wire check;
assign check = (result !=(num_test%2));

endmodule