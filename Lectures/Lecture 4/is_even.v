// Create a module that determines whether an 
// even number is submitted to the input

module is_even(
    input [31:0] number,
    output even
);

assign even = ~number[0];

endmodule