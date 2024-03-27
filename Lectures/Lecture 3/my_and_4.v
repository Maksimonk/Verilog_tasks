module my_and_4 (
    input wire a0, a1, a2, a3,
    output wire z
);
wire a0a1_and, a2a3_and;
my_and
    and_01(
        .a(a0),
        .b(a1),
        .c(a0a1_and)
    );
my_and
    and_23(
        .a(a2),
        .b(a3),
        .c(a2a3_and)
    );
my_and
    and_0123(
        .a(a0a1_and),
        .b(a2a3_and),
        .c(z)
    );
endmodule