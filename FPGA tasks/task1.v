module task1 (
    input clk,
    input reset, // KEY0
    input count_button, // KEY1
    output [6:0] seven_segment
);

reg [3:0] hex;
reg but_r;
reg but_rr;
assign push = but_rr&(~but_r); // нажатие кнопки




always @(posedge clk) begin
    but_r <= count_button;
    but_rr <= but_r;

    if (reset == 0) begin
        hex <= 1'h0;
    end

    if (push == 1) begin
        hex <= hex + 1;
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