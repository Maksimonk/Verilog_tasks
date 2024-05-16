`include "C:/Users/ddyam/Desktop/my_repositories/Verilog_tasks/Home assignment/For 07.03.24/divisibility by 3/divisibility_new.v"
`timescale 1ps/1ps

module testbench();

reg [31:0] num_test;
wire result;
reg [31:0] num_test_max_zero;

always begin
    #1
    num_test = $random();
    num_test_max_zero = {{1'b0}, {num_test[30:0]}};

    

end
// wire [31:0] num_test_abs = {32{num_test[31]}}^num_test + {{31'b0}, num_test[31]}; // abs


divisibility_new test_divisibility(
    .num(num_test_max_zero),
    .num_final(result)
);

wire check;
assign check = (num_test_max_zero % 3 == 0);


endmodule
