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
	`define slowdown_delays 63
	
	//max number of bits used for i2c messages
	`define bit_pos_max 271

	// i2c slowdown and speedup messages with clocks
	// These i2c messages were compared with logic analyzer when SMC_DBG is asserted and de-asserted
	// And they seem to match well enough except for NAK when bus  is driven low at ACK positions
	// *** Thanks to 15432 for these bits, waay to tedious to re-construct ***
	localparam [271:0] I2C_SDA_SLOW = 272'b10011111111111100000000000000000000111111111111110000000011111111111111111111000000000000000000000011110000000011110000001111000000000000000000000000111100000011110000000000000000000000001111000000111100000000000011110000000011110000000000000000001111000000000000111100001;
	localparam [271:0] I2C_SCL_BITS = 272'b11001100110011001100110011001100110011000011001100110011001100110011001100110000110011001100110011001100110011001100001100110011001100110011001100110011000011001100110011001100110011001100110000110011001100110011001100110011001100001100110011001100110011001100110011000011;
	localparam [271:0] I2C_SDA_FAST = 272'b10011111111111100000000000000000000111111111111110000000011111111111111111111000000000000000000000011110000000011111111111111000000000000000000000000111111111100001111000011111111000000001111000000111100000000000011110000000011110000001111000000000000000000000000111100001;

	// start from MSB
	reg [7:0] bit_pos;

	// msg type that was sent.
	// 1 = slow-down, 0 = speedup
	reg i2c_sent;
	reg [7:0] delay_cnt;
	
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
			
				//if delays are done, send msg
				if (delay_cnt == 0)
					i2c_sent <= i2c_send;
				else
					delay_cnt <= delay_cnt - 1;
				
				//reset bit positon
				bit_pos <= `bit_pos_max;
			end
			else
			begin
				// move to next bit position
				bit_pos <= bit_pos - 1;
			end
			
		end //no message to send
		else
		begin
			if (i2c_sent == 0)
				delay_cnt <= `slowdown_delays;
		end
		
		
	end //end always

endmodule
