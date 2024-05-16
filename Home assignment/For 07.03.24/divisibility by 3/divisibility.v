

module divisibility (
    input [31:0] input_num,
    output wire num_final
);

wire [4:0] num_1_step;
wire [1:0] num_2_step;
wire [31:0] num;

// assign num = {32{input_num[31]}}^input_num + {{31'b0}, input_num[31]};
assign num = input_num;


wire [4:0] first_16_step_1;
assign first_16_step_1 = num[31] + num[29] + num[27] + num[25] + num[23] + num[21] + num[19] + num[17] +
num[15] + num[13] + num[11] + num[9] + num[7] + num[5] + num[3] + num[1];

wire [4:0] last_16_step_1;

assign last_16_step_1 = -(- num[30] - num[28] - num[26] - num[24] - num[22] - num[20] - num[18] -
num[16] - num[14] - num[12] - num[10] - num[8] - num[6] - num[4] - num[2] - num[0]);


 
assign num_1_step = (first_16_step_1 >= last_16_step_1) ? (first_16_step_1 - last_16_step_1) : (last_16_step_1 - first_16_step_1) ; // no more than 16 = 2^4

assign first_3_step_2 = num_1_step[4] + num_1_step[2] + num_1_step[0];
assign last_3_step_2 = -(- num_1_step[3] - num_1_step[1]);


assign num_2_step = (first_3_step_2 >= last_3_step_2) ? (first_3_step_2 - last_3_step_2) : (first_3_step_2 - last_3_step_2);

assign num_final = ~(num_2_step[1] ^ num_2_step[0]);

endmodule