`include "C:/Users/ddyam/Desktop/my_repositories/Verilog_tasks/FPGA tasks/hex2seven_seg.v"

module task4 (
    input clk,
    input reset, // KEY0
    input SW0, // SW0
    input SW1, // SW1
    input SW2, // SW2
    input SW3, // SW3
    input SW4, // SW4
    input SW5, // SW5
    input SW6, // SW6
    input SW7, // SW7
	 input SW17, // SW17
    input record_button, // KEY 1
	 input transfer_button, // KEY 2
	 input transfer_one_by_one_button, //KEY 3
    output reg [7:0] LEDS_R,
    output reg [7:0] LEDS_G,
    output [6:0] hex1,
    output [6:0] hex2
);

wire [7:0] switches;
assign switches = {SW7, SW6, SW5, SW4, SW3, SW2, SW1, SW0};


reg but_r_record;
reg but_rr_record;
assign push_record = (~but_rr_record)&(but_r_record); // push record button


reg but_r_transfer;
reg but_rr_transfer;
assign push_transfer = (~but_rr_transfer)&(but_r_transfer); // push transfer button

reg but_r_transfer_one_by_one;
reg but_rr_transfer_one_by_one;
assign push_transfer_one_by_one = (~but_rr_transfer_one_by_one)&(but_r_transfer_one_by_one); // push transfer one by one button

always @(posedge clk) begin
    but_r_record <= record_button;
    but_rr_record <= but_r_record;
	 but_r_transfer <= transfer_button;
    but_rr_transfer <= but_r_transfer;
	 but_r_transfer_one_by_one <= transfer_one_by_one_button;
    but_rr_transfer_one_by_one <= but_r_transfer_one_by_one;	 
	 
    if (~reset) begin
        LEDS_R <= 0;
		  LEDS_G <= 0;
    end
	else if (push_record) begin
        LEDS_R <= switches;
   end
	else if (push_transfer) begin
		  LEDS_G <= LEDS_R;
		  LEDS_R <= 0;
	end
	else if (push_transfer_one_by_one) begin
		  LEDS_G <= {{LEDS_R}, {LEDS_G[7:1]}};
		  LEDS_R <= {SW17, {LEDS_R[7:1]}};
	end
end

hex2seven_seg hex1m (
    .hex(LEDS_R[3:0]),
	 .seven_segment(hex1)
);


hex2seven_seg hex2m (
    .hex(LEDS_R[7:4]),
	 .seven_segment(hex2)
);



endmodule