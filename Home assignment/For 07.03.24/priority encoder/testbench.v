`include "C:/Users/ddyam/Desktop/my_repositories/Verilog_tasks/Home assignment/For 07.03.24/priority encoder/encoder.v"
`timescale 1ns/1ns

module testbench();
reg [7:0] test_vector;
wire [2:0] number_test;
always begin
    #10 test_vector = 8'd1;
//    #10 test_vector = 8'd23;
//    #10 test_vector = 8'd34;
//    #10 test_vector = 8'd4;
//    #10 test_vector = 8'd51;
//    #10 test_vector = 8'd62;
//    #10 test_vector = 8'd17;
//    #10 test_vector = 8'd41;
//    #10 test_vector = 8'd39;
    #10 test_vector = 8'd100;
end

encoder test(
    .vectorr(test_vector),
    .numberr(number_test)
);
endmodule