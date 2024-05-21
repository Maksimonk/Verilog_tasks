module task3 (
    input clk,
    input reset, // KEY0
    input switch0, // SW0
	 input switch1, // SW1
    input to_left_button, // KEY 1
    input to_right_button, // KEY 2
    output reg [7:0] values
);

reg but_r_left;
reg but_rr_left;
reg but_r_right;
reg but_rr_right;

assign push_right = (~but_rr_right)&(but_r_right); // to right button
assign push_left = (~but_rr_left)&(but_r_left); // to left button

always @(posedge clk) begin
    but_r_left <= to_left_button;
    but_rr_left <= but_r_left;
	 
	but_r_right <= to_right_button;
    but_rr_right <= but_r_right;

    if (~reset) begin
        values <= 0;
    end

	/*
      else if (push_left) begin
		values <= values << 1;
        values [0] <= switch1;
    end
	 else if (push_right) begin
        values <= values >> 1;
        values [7] <= switch0;
    end 
    */

    else if (push_left) begin
		values <= {{values[6:0]}, switch0};
    end
	 else if (push_right) begin
		values <= {switch1, {values[7:1]}};
    end
	 
end
/* 
genvar Gi;
generate for (Gi = 0; Gi < 8; Gi = Gi + 1) begin: loop
    assign LEDS[Gi] = (counter == Gi);
end
endgenerate */

endmodule