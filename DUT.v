`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ratnakarvarun@gmail.com 9603632836
// Engineer: ratnakar
// 
// Create Date:    09:45:43 12/29/2017 
// Design Name: 
// Module Name:    DUT 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
///////REVERSIBLE GATES WITH MULTI OPRATIONS///////////// 
module Feynman(a,b,c,p,q,r);

	input a,b,c;
	output reg p,q,r;
	
	always @ (*)
	begin
		p=a;
		q=a^b;
		r=a^c;
	end
endmodule

//////////////////////////////////////////////////////////////////////////////////

module fredkin(a,b,c,p,q,r);

	input a,b,c;
	output reg p,q,r;
	
	always @ (*)
	begin
		p=a;
		q=(~a*b)^(a*c);
		r=(~a*c)^(a*b);
	end
endmodule

//////////////////////////////////////////////////////////////////////////////////
//////REVERSIBLE COMBINATION GATES WITH OPERATION WITH CARRY AND SUM///////////

module fafs(a,b,c,sd,carry,borrow);

	input a,b,c;
	output  sd,carry,borrow;
	
	wire a1,b1,c1,c3;
	assign a1=0;
	assign b1=0;
	assign c1=0;
	assign c3=0;


	
	Feynman GATE1 (b,a,c1,  p1,q1,r1);
	Feynman GATE2 (c,a1,b1, p2,q2,r2);
	Feynman GATE3 (q1,p2,c3,p3,sd,r3);
	fredkin GATE4 (r3,q2,r1,p4,borrow,carry);

endmodule
////////////////////////////////////////////////////////////
///////////////////////////COMBINATED GATES WITH CARRY WITH ONE HOT OPERATION PROCESS SUM//////////////////////////////////
module csa_adder(a,b,cin,add); 

	input   [7:0]a,b;
	input cin;
	output  [8:0]add;
	wire [6:0] c;
	fafs f1(a[0],b[0], cin,add[0],c[0],borrow0);
	fafs f2(a[1],b[1],c[0],add[1],c[1],borrow1);
	fafs f3(a[2],b[2],c[1],add[2],c[2],borrow2);
	fafs f4(a[3],b[3],c[2],add[3],c[3],borrow3);
	fafs f5(a[4],b[4],c[3],add[4],c[4],borrow4);
	fafs f6(a[5],b[5],c[4],add[5],c[5],borrow5);
	fafs f7(a[6],b[6],c[5],add[6],c[6],borrow6);
	fafs f8(a[7],b[7],c[6],add[7],add[8],borrow7);
endmodule
