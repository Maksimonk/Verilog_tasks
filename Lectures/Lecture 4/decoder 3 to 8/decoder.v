// Create a module "decoder 3->8":
// a) at the input is a 3-bit number N;
// b) at the output is a vector in which 1 is set in digit N, 
// the remaining digits are zero

module decoder(
    input reg [2:0] N,
    output [7:0] output_vector
);
assign output_vector = 8'b1 << N;

endmodule