// Create the module "Priority encoder 8->3".
// It defines the number of the highest unit in the 8-bit sector

module encoder(
    input wire [7:0] vectorr,
    output wire [2:0] numberr
);
assign numberr = vectorr[7] ? 3'h7 : 
vectorr[6] ? 3'h6 : 
vectorr[5] ? 3'h5 : 
vectorr[4] ? 3'h4 : 
vectorr[3] ? 3'h3 : 
vectorr[2] ? 3'h2 : 
vectorr[1] ? 3'h1 : 3'h0;
endmodule