`include "C:/Users/ddyam/Desktop/my_repositories/Verilog_tasks/Home assignment/For 07.03.24/log 2/logarithm.v"
`timescale 1ps/1ps

module testbench();

    reg [7:0] Number_test;
    wire [2:0] result;
initial begin
    Number_test = 8'd1;
end
always begin
    #1 Number_test =8'd2;
    #1 Number_test =8'd4;
    #1 Number_test =8'd8;
    #1 Number_test =8'd16;
    #1 Number_test =8'd32;
    #1 Number_test =8'd64;
    #1 Number_test =8'd128;
end
logarithm test_log (
    .number(Number_test),
    .result(result)
);

endmodule