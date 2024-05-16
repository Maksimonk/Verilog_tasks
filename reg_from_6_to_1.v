module reg_from_6_to_1(
    input wire [6:1] in_wire_from_1,
    output wire [7:2] out_wire_from_2
);

assign out_wire_from_2[2] = in_wire_from_1[0];


endmodule
