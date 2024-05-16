`timescale 1ns/1ps

module task10;
reg[7:0] a = 0, b=0, c=0, d=0;

always
    #1 a = a + 1;
always @(posedge a[0] or a[2] ) begin
    b <= b + 1;
end

always @(negedge a[0]) begin
    c <= c + 1;
end

always @* begin
    d <= b + c;
end

endmodule