/*
	S-RGH for Trinity
	By: b1ghamm3r [Dec 2020]
	Credits: GliGli, 15432, Octal450, Mena
*/

`timescale 1ns / 1ps

module hana_i2c(
			 input clk_400k,
			 input i2c_send,
			 output i2c_sda_io,
			 output i2c_scl_io
			 );
			 
	// Slowdown can be delayed by 1ms intervals
	// i.e. 30 = 30ms delay before slowdown is injected.
	`define slowdown_delays 31
	
	//max number of bits used for i2c messages
	`define bit_pos_max 255

	// i2c slowdown and speedup messages with clocks
	// These i2c messages were compared with logic analyzer when SMC_DBG is asserted and de-asserted
	// And they seem to match well enough except for NAK when bus  is driven low at ACK positions
	// *** Thanks to 15432 for these bits, waay to tedious to re-construct ***
	localparam [255:0] I2C_SDA_SLOW = 256'b1001111111110000000000000001111111111111111100000011111100011111111111111000000000000000111000000111111111110001110000001111111110001111111111100000000000011100000000011111111111111000000000000000000000111111111110000000000000000001111111111111111100101111;
	localparam [255:0] I2C_SCL_BITS = 256'b1100100100100100100100100100001111100001001001001001001001001000011111000010010010010010010010010000111110000100100100100100100100100001111100001001001001001001001001000011111000010010010010010010010010000111110000100100100100100100100100001111100001111111;
	localparam [255:0] I2C_SDA_FAST = 256'b1001111111110000000000000001111111111111111100000011111100011111111111111000000000000000111000000111111111110001110000001111111110001111111111111100000000000000000000011111111111000000000000111111000000111111111110000000000000000001110001111111111100101111;

	// start from MSB
	reg [7:0] bit_pos;

	// msg type that was sent.
	// 1 = slow-down, 0 = speedup
	reg i2c_sent;
	reg [4:0] delay_cnt;
	
	//i2c output buffers
	reg i2c_sda;
	reg i2c_scl;
	
	//initialization 
	initial
	begin
		//initialize i2c for high impedence
		bit_pos = `bit_pos_max;
		i2c_sda = 1;
		i2c_scl = 1;
		i2c_sent = 0;
		delay_cnt <= 0;
	end

	// hookup tristate outputs
	assign i2c_sda_io = (i2c_sda == 1'b1) ? 1'bZ : 1'b0;
	assign i2c_scl_io = (i2c_scl == 1'b1) ? 1'bZ : 1'b0;

	// process I2C message transfer
	always @(posedge clk_400k)
	begin	
	
		//requested message not sent, send it.
		if (i2c_send != i2c_sent)
		begin	
			
			//specific delay for slowdown
			if (delay_cnt == 0)
			begin
				//set SDA bits
				if (i2c_send == 1)
					i2c_sda <= I2C_SDA_SLOW[bit_pos]; //slowdown
				else
					i2c_sda <= I2C_SDA_FAST[bit_pos]; //speedup
					
				// send CLK bits
				i2c_scl <= I2C_SCL_BITS[bit_pos];
			end
			
			// msg sent
			if (bit_pos == 0)
			begin
				
				if (delay_cnt == 0)
					i2c_sent <= i2c_send;
				else
					delay_cnt <= delay_cnt - 1;
			end

			// move to next bit or overflow to start
			bit_pos <= bit_pos - 1;
			
		end //no message to send
		else
		begin
			if (i2c_sent == 0)
				delay_cnt <= `slowdown_delays;
		end
		
		
	end //end always

endmodule
