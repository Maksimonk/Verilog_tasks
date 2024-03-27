`include "C:/Users/ddyam/Desktop/my_repositories/Verilog_tasks/Lectures/my_and_4.v"
`include "C:/Users/ddyam/Desktop/my_repositories/Verilog_tasks/Lectures/my_and.v"
module testbench();
wire [3:0] data;
wire result;
my_and_4 and_4
(
    .a0(data[0]),
    .a1(data[1]),
    .a2(data[2]),
    .a3(data[3]),
    .z(result)
);
assign data = 4'b1101;
endmodule
