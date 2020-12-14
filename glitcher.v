/*
	S-RGH for Trinity
	By: b1ghamm3r [Dec 2020]
	Credits: GliGli, 15432, Octal450, Mena
*/

`timescale 1ns / 1ps

module glitcher(
    input clk_96m,
    input glitch,
    inout cpu_reset
    );

	// Ticks to wait into post DA to before starting Glitch 
	// Note - NumberOfTicks * (1/ClockSpeed) = Delay time before Glitch
	`define Glitch_Start 34720

	// Glitch Cycles - i.e. how long hold CPU RESET low during Glitch
	// Start with increment of 1 and work your way up to ~4 ticks
	// Each tick is ~5.2ns in duration with a 192Mhz Dual Edgle clock
	`define Glitch_Cycles 1

	reg [15:0] tick_cnt;
	reg cpu_glitch;
	
	initial begin
		tick_cnt[15:0] = 0;
		cpu_glitch = 1; //CPU RESET is default high impedence
	end

	//tristate register 1 = High-Z, 0 = Low
	assign cpu_reset = cpu_glitch;//(cpu_glitch == 1'b1) ? 1'bZ : 1'b0;

	// processing 96mhz clock on both rising and falling edge
	// will process at 192mhz = 5.208333ns period
	always @(posedge clk_96m or negedge clk_96m)
	begin
			// Post Counter requesting a Glitch!
			// After a Specfic delay pull CPU RESET low 
			// for X amount of clock cycles
			if(glitch)
			begin
				// Glitch Start time was reached, pull CPU RESET low
				if (tick_cnt[15:0] == `Glitch_Start)
					cpu_glitch <= 1'b0;
					
				// Glitch is done, restore CPU RESET to high impedence
				if(tick_cnt[15:0] >= `Glitch_Start + `Glitch_Cycles)
					cpu_glitch <= 1'b1;
				else 
					// Waiting for Glitch to complete, keep counting..
					// But stop counting after glitch so we glitch just once.
					tick_cnt <= tick_cnt + 1;
			end
			else
			begin
				// Glitch not requested, reset..
				cpu_glitch <= 1'bZ;
				tick_cnt <= 0;
			end
	end
endmodule
