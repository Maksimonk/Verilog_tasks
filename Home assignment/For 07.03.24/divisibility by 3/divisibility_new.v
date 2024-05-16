module divisibility_new(
    input [31:0] num,
    output wire num_final
);
wire [4:0] first_step;

reg [4:0] registr = 5'd0;
reg [4:0] registr1 = 5'd0;
reg [4:0] registr2 = 5'd0;

/*
always begin
    registr = registr + (num[31] + num[29] + num[27] + num[25] + num[23] + num[21] + num[19] + num[17] + num[15] + num[13] + num[11] + num[9] + num[7] + num[5] + num[3] + num[1]);
registr1 = registr1 + ((num[30] + num[28] + num[26] + num[24] + num[22] + num[20] + num[18] + num[16] + num[14] + num[12] + num[10] + num[8] + num[6] + num[4] + num[2] + num[0]));

registr2 = (registr > registr1) ? registr - registr1: registr1 - registr ;

end

*/

assign first_step = 

((num[31] + num[29] + num[27] + num[25] + num[23] + num[21] + num[19] + num[17] + num[15] + num[13] + num[11] + num[9] + num[7] + num[5] + num[3] + num[1])
> (num[30] + num[28] + num[26] + num[24] + num[22] + num[20] + num[18] + num[16] + num[14] + num[12] + num[10] + num[8] + num[6] + num[4] + num[2] + num[0]))

? ((num[31] + num[29] + num[27] + num[25] + num[23] + num[21] + num[19] + num[17] + num[15] + num[13] + num[11] + num[9] + num[7] + num[5] + num[3] + num[1]) 
- (num[30] + num[28] + num[26] + num[24] + num[22] + num[20] + num[18] + num[16] + num[14] + num[12] + num[10] + num[8] + num[6] + num[4] + num[2] + num[0])) 

: -((num[31] + num[29] + num[27] + num[25] + num[23] + num[21] + num[19] + num[17] + num[15] + num[13] + num[11] + num[9] + num[7] + num[5] + num[3] + num[1]) 
- (num[30] + num[28] + num[26] + num[24] + num[22] + num[20] + num[18] + num[16] + num[14] + num[12] + num[10] + num[8] + num[6] + num[4] + num[2] + num[0])) ; // no more than 16 = 2^4


wire [1:0] second_step;

assign second_step = ((first_step[4] + first_step[2] + first_step[0]) > (first_step[3] + first_step[1]))
? ((first_step[4] + first_step[2] + first_step[0]) - (first_step[3] + first_step[1])) 
: -((first_step[4] + first_step[2] + first_step[0]) - (first_step[3] + first_step[1]));

assign num_final = (second_step[1] == second_step[0]);
// assign num_final = (second_step[1] & second_step[0]);

endmodule