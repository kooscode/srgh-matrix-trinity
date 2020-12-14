/*
	S-RGH for Trinity
	By: b1ghamm3r [Dec 2020]
	Credits: GliGli, 15432, Octal450, Mena
*/

`timescale 1ns / 1ps

module hana_i2c_clk(
    input clk_48m,
    output reg clk_400k
    );

	//clock divider based on posedge of 48mhz main clock
	localparam clock_div = 7'd120;

	//7 bit counter 
	reg [6:0] clk_counter = 7'b0;
	always @(posedge clk_48m)
	begin	

		// Clock Divider
		if (clk_counter == clock_div)
		begin
			//reset counter
			clk_counter <= 0;	
			// invert clock for next latch.
			clk_400k <= ~clk_400k;
		end
		else
		begin
			//increment counter
			clk_counter <= clk_counter + 1;
		end		
		
	end

endmodule

