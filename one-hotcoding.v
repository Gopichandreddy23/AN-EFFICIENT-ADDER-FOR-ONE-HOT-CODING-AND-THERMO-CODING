module OneHotEncoder(
    input [3:0] select,
    output [3:0] encoded
);

    always @(*) begin
        case(select)
             4'b0001: encoded = 4'b0001;
            4'b0010: encoded = 4'b0010;
            4'b0100: encoded = 4'b0100;
            4'b1000: encoded = 4'b1000;
            default: encoded = 4'b0000;
        endcase
    end

endmodule