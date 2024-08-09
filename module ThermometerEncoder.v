module ThermometerEncoder(
    input [3:0] select,
    output [3:0] encoded
);

    assign encoded = (({4{select[0]}}) & 4'b0001) |
                     (({3{select[1]}}) & 4'b0011) |
                     (({2{select[2]}}) & 4'b0111) |
                     (({1{select[3]}}) & 4'b1111);

endmodule