`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ratnakarvarun@gmail.com 9603632836
// Engineer: ratnakar
// 
// Create Date:    11:08:27 12/29/2017 
// Design Name: 
// Module Name:    top 
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
module top( );

	reg  [7:0]a,b;
	reg cin;
	//wire p,q,r;
   wire [8:0]add;
	
   csa_adder DUT(a,b,cin,add);

	initial
	begin
	a=10;
	b=20;
cin=0;
	#10;
	
	a=22;
	b=11;
cin=1;
	#10;	
	
	a=23;
	b=13;
cin=0;

	
	#10
	a=33;
        b=17;
    cin=1;
    
        
        #10
        a=43;
                b=27;
            cin=1;
            
                
                #10
                  a=33;
                              b=17;
                          cin=1;
                          
                              
                              #10
$finish;	
	end

endmodule
