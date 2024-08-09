
module OHR_ADDER(A,B,SUM);
input[6:0] A,B;
output [6:0]SUM ;
wire [6:0]AND ,OR ;
wire [21:1]W;
assign AND[0] = A[0] & B[0] ;
assign AND[1] = A[1] & B[1] ;
assign AND[2] = A[2] & B[2] ;
assign AND[3] = A[3] & B[3] ;
assign AND[4] = A[4] & B[4] ;
assign AND[5] = A[5] & B[5] ;
assign AND[6] = A[6] & B[6] ;

assign OR[0] = A[0] | B[0] ;
assign OR[1] = A[1] | B[1] ;
assign OR[2] = A[2] | B[2] ;
assign OR[3] = A[3] | B[3] ;
assign OR[4] = A[4] | B[4] ;
assign OR[5] = A[5] | B[5] ;
assign OR[6] = A[6] | B[6] ;

assign W[1] = OR[1] & OR[5] ;
assign W[2] = OR[2] & OR[4] ;
assign W[3] = OR[0] & OR[6] ;
assign SUM[6] = W[1]|W[2]|W[3]|AND[3] ;

assign W[4] = OR[1] & OR[4] ;
assign W[5] = OR[2] & OR[3] ;
assign W[6] = OR[0] & OR[5] ;
assign SUM[5] = W[4]|W[5]|W[6]|AND[6] ;

assign W[7] = OR[3] & OR[1] ;
assign W[8] = OR[5] & OR[6] ;
assign W[9] = OR[0] & OR[4] ;
assign SUM[4] = W[7]|W[8]|W[9]|AND[2] ;

assign W[10] = OR[2] & OR[1] ;
assign W[11] = OR[4] & OR[6] ;
assign W[12] = OR[0] & OR[3] ;
assign SUM[3] = W[10]|W[11]|W[12]|AND[5] ;

assign W[13] = OR[4] & OR[5] ;
assign W[14] = OR[3] & OR[6] ;
assign W[15] = OR[0] & OR[2] ;
assign SUM[2] = W[13]|W[14]|W[15]|AND[1] ;

assign W[16] = OR[3] & OR[5] ;
assign W[17] = OR[2] & OR[6] ;
assign W[18] = OR[0] & OR[1] ;
assign SUM[1] = W[16]|W[17]|W[18]|AND[4] ;

assign W[19] = OR[3] & OR[4] ;
assign W[20] = OR[2] & OR[5] ;
assign W[21] = OR[6] & OR[1] ;
assign SUM[0] = W[19]|W[20]|W[21]|AND[0] ;

endmodule
