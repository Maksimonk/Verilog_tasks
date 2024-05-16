`timescale 1ps/1ps
`include "C:/Users/ddyam/Desktop/my_repositories/Verilog_tasks/reg_from_6_to_1.v"

module testbench();

wire [6:1] wire1 = 6'd12;
wire [7:2] wire2;


reg_from_6_to_1 test(
    .in_wire_from_1(wire1),
    .out_wire_from_2(wire2)
);

endmodule