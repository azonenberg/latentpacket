`timescale 1ns/1ps
`default_nettype none
/***********************************************************************************************************************
*                                                                                                                      *
* LATENTPACKET v0.1                                                                                                    *
*                                                                                                                      *
* Copyright (c) 2023 Andrew D. Zonenberg and contributors                                                              *
* All rights reserved.                                                                                                 *
*                                                                                                                      *
* Redistribution and use in source and binary forms, with or without modification, are permitted provided that the     *
* following conditions are met:                                                                                        *
*                                                                                                                      *
*    * Redistributions of source code must retain the above copyright notice, this list of conditions, and the         *
*      following disclaimer.                                                                                           *
*                                                                                                                      *
*    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the       *
*      following disclaimer in the documentation and/or other materials provided with the distribution.                *
*                                                                                                                      *
*    * Neither the name of the author nor the names of any contributors may be used to endorse or promote products     *
*      derived from this software without specific prior written permission.                                           *
*                                                                                                                      *
* THIS SOFTWARE IS PROVIDED BY THE AUTHORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   *
* TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL *
* THE AUTHORS BE HELD LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES        *
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR       *
* BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT *
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE       *
* POSSIBILITY OF SUCH DAMAGE.                                                                                          *
*                                                                                                                      *
***********************************************************************************************************************/

module PulseStretcher(
	input wire		clk,
	input wire		pulse,
	output logic	stretched = 0
);

	//assume 156.25 MHz clock for now
	//~4 Hz pulse rate so ~125ms between toggles
	//so 19531250 cycles. 2^24 is close enouhh for this purpose and is a nice round number

	logic[23:0] count 			= 0;
	logic		togglePending	= 0;

	always_ff @(posedge clk) begin

		if(pulse) begin

			//Stretched output off? Turn it on and start the timer
			if(!stretched) begin
				stretched		<= 1;
				count			<= 1;
			end

			//It's on, note that we saw another toggle
			else
				togglePending	<= 1;

		end

		if(count) begin
			count <= count + 1;

			//Timer ran out!
			if(count == 24'hffffff) begin
				togglePending	<= 0;

				//If LED was on, turn it off regardless
				if(stretched)
					stretched	<= 0;

				//If off, turn it on if we had another toggle show up during the dead time
				else if(togglePending) begin
					stretched	<= 1;
					count		<= 1;
				end

			end
		end
	end

endmodule
