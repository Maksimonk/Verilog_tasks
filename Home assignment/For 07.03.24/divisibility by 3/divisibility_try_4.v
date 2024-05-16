module divisibility_try_4 (
    input [7:0] num,
    output wire result
);

wire [2:0] step;
assign step = num[7] - num[6] + num[5] - num[4] + num[3] - num[2] + num[1] - num[0];


endmodule