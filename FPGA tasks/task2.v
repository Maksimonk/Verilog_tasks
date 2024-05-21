module task2 (
    input clk,
    input reset, // KEY0
    input increment_button, // KEY 1
    input decrement_button, // KEY 2
    output [7:0] LEDS
);

reg [2:0] counter;

reg but_r_inc;
reg but_rr_inc;
reg but_r_dec;
reg but_rr_dec;

assign push_inc = (~but_rr_inc)&(but_r_inc); // push increment button
assign push_dec = (~but_rr_dec)&(but_r_dec); // push decrement button

always @(posedge clk) begin
    but_r_inc <= increment_button;
    but_rr_inc <= but_r_inc;
	 
	 but_r_dec <= decrement_button;
    but_rr_dec <= but_r_dec;

    if (~reset) begin
        counter <= 0;
    end
	 else if (push_inc) begin
		counter <= counter + 1;
    end
	 else if (push_dec) begin
        counter <= counter - 1;
    end
end
// code was edited for additional assignment
/*
assign LEDS =  (counter == 0) ? 8'b00000000 :
               (counter == 1) ? 8'b00000001 :
               (counter == 2) ? 8'b00000011 :
               (counter == 3) ? 8'b00000111 :
               (counter == 4) ? 8'b00001111 :
               (counter == 5) ? 8'b00011111 :
               (counter == 6) ? 8'b00111111 :
               (counter == 7) ? 8'b01111111 : 8'b11111111 ;
*/               
assign LEDS =  (counter == 0) ? 8'b00000000 :
               (counter == 1) ? 8'b00000001 :
               (counter == 2) ? 8'b00000010 :
               (counter == 3) ? 8'b00000100 :
               (counter == 4) ? 8'b00001000 :
               (counter == 5) ? 8'b00010000 :
               (counter == 6) ? 8'b00100000 :
               (counter == 7) ? 8'b01000000 : 8'b10000000 ;

endmodule