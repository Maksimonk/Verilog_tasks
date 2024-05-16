module task11 (
    input clk,
    input reset, // KEY0
    input increment_button, // KEY1
    input decrement_button, // KEY 2
    output [6:0] seven_segment
);

reg [3:0] hex;
reg but_r_inc;
reg but_rr_inc;
reg but_r_dec;
reg but_rr_dec;
assign push_inc = (~but_rr_inc)&(but_r_inc); // нажатие кнопки увеличения
assign push_dec = (~but_rr_dec)&(but_r_dec); // нажатие кнопки уменьшения

always @(posedge clk) begin
    but_r_inc <= increment_button;
    but_rr_inc <= but_r_inc;
	 
	 but_r_dec <= decrement_button;
    but_rr_dec <= but_r_dec;

    if (reset == 0) begin
        hex <= 0;
    end
	 else begin

    if (push_inc == 1) begin
		if (hex < 4'd9) begin
				hex <= hex + 1;
		end
		else   hex <= 0;
    end
	 
	 if (push_dec == 1) begin
        hex <= hex - 1;
    end
	 end
end

assign seven_segment =  {7{hex == 0}} & ~7'b0111111 |
                        {7{hex == 1}} & ~7'b0000110 |
                        {7{hex == 2}} & ~7'b1011011 |
                        {7{hex == 3}} & ~7'b1001111 |
                        {7{hex == 4}} & ~7'b1100110 |
                        {7{hex == 5}} & ~7'b1101101 |
                        {7{hex == 6}} & ~7'b1111101 |
                        {7{hex == 7}} & ~7'b0000111 |
                        {7{hex == 8}} & ~7'b1111111 |
                        {7{hex == 9}} & ~7'b1101111 |
                        {7{hex == 4'ha}} & ~7'b1110111 |
                        {7{hex == 4'hb}} & ~7'b1111100 |
                        {7{hex == 4'hc}} & ~7'b0111001 |
                        {7{hex == 4'hd}} & ~7'b1011110 |
                        {7{hex == 4'he}} & ~7'b1111001 |
                        {7{hex == 4'hf}} & ~7'b1110001;
endmodule