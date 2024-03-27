`include "C:/Users/ddyam/Desktop/my_repositories/Verilog_tasks/Lectures/Lecture 4/decoder 3 to 8/decoder.v"
`timescale 1ps/1ps

module testbench();

    reg [2:0] N_test;
    wire [7:0] result;
initial begin
    N_test = 3'b000;
end
always begin
    #1 N_test =3'b001;
    #1 N_test =3'b010;
    #1 N_test =3'b011;
    #1 N_test =3'b100;
    #1 N_test =3'b101;
    #1 N_test =3'b110;
    #1 N_test =3'b111;
end
decoder test_decoder (
    .N(N_test),
    .output_vector(result)
);

endmodule