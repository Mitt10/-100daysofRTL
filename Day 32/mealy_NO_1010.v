`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2025 11:55:28 PM
// Design Name: 
// Module Name: mealy_NO_1010
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mealy_NO_1010 (
	input clk,rst,x,
	output z
);

parameter A =4'h1, B= 4'h2, C=4'h3, D=4'h4;

reg [3:0] ns, cs;
always@(posedge clk or negedge rst)
begin
	if (!rst)
		cs <= A;
	else
		cs <= ns;
end

always @(cs or x)
begin
	case(cs)
		A: begin
			if (x==0)
				ns = A;
			else
				ns = B;
		end
		B: begin
			if (x==0)
				ns = C;
			else
				ns = B;
			end
		C: begin
			if (x==1)
				ns = D;
			else
				ns = A;
		end
		D: begin
			if (x==0)
				ns = A;
			else
				ns = B;
			end
		default: ns=A;
	endcase
end

assign z = ((cs == D) && (x==0)) ? 1:0;

endmodule