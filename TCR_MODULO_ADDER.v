/////////////////////////////////////////////////
module TCR_MODULO_ADDER(A,B,SUM);
input [6:1]A,B;
output [6:1]SUM;
wire [6:1]L,Z,R,SUM0,SUM1;
wire T0,sel,T1,T2,T3,T4,T5;

wire [5:1]A1;
wire [4:1]A2;
wire [3:1]A3;
wire [2:1]A4;

assign L[1] = A[6] & B[1] ;
assign L[2] = A[5] & B[2] ;
assign L[3] = A[4] & B[3] ;
assign L[4] = A[3] & B[4] ;
assign L[5] = A[2] & B[5] ;
assign L[6] = A[1] & B[6] ;

assign Z[1] = !(A[6] | B[1]) ;
assign Z[2] = !(A[5] | B[2]) ;
assign Z[3] = !(A[4] | B[3]) ;
assign Z[4] = !(A[3] | B[4]) ;
assign Z[5] = !(A[2] | B[5]) ;
assign Z[6] = !(A[1] | B[6]) ;

assign T0 = !(Z[1]|Z[2]|Z[3]|Z[4]|Z[5]|Z[6]) ;
assign sel= !(L[1]|L[2]|L[3]|L[4]|L[5]|L[6]) ;

assign R[1] = L[1] | Z[1] ;
assign R[2] = L[2] | Z[2] ;
assign R[3] = L[3] | Z[3] ;
assign R[4] = L[4] | Z[4] ;
assign R[5] = L[5] | Z[5] ;
assign R[6] = L[6] | Z[6] ;

assign A1[1] = R[1] & R[2] ;
assign A1[2] = R[2] & R[3] ;
assign A1[3] = R[3] & R[4] ;
assign A1[4] = R[4] & R[5] ;
assign A1[5] = R[5] & R[6] ;
assign T1 = !(A1[1]|A1[2]|A1[3]|A1[4]|A1[3]) ;

assign A2[1] = A1[1] & A1[2] ;
assign A2[2] = A1[2] & A1[3] ;
assign A2[3] = A1[3] & A1[4] ;
assign A2[4] = A1[4] & A1[5] ;
assign T2 = !(A2[1]|A2[2]|A2[3]|A2[4]) ;

assign A3[1] = A2[1] & A2[2] ;
assign A3[2] = A2[2] & A2[3] ;
assign A3[3] = A2[3] & A2[4] ;
assign T3 = !(A3[1]|A3[2]|A3[3]) ;

assign A4[1] = A3[1] & A3[2] ;
assign A4[2] = A3[2] & A3[3] ;
assign T4 = !(A4[1]|A4[2]) ;

assign T5 = !(A4[1]&A4[2]) ;

assign SUM0 = {T0,T1,T2,T3,T4,T5} ;
assign SUM1 = {0,!T5,!T4,!T3,!T2,!T1} ;

assign SUM[6] = T0 & sel ;
assign  SUM[5:1] = sel? SUM0[5:1] : SUM1[5:1] ;

endmodule
