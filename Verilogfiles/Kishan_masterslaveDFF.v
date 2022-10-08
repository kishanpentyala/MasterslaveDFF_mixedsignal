module dflipflop(q,clk,rst,d);
        output reg q;
        input clk, rst;
        input d;

        always @(clk)
        begin
                if (rst)
                        q <= 0;
                else if (clk)
                        q <= d;
	else   q <= q;
        end
endmodule

module Kishan_masterslaveDFF(q,clk,rst,d);
	output q;
	input clk, rst;
	input d;
	wire iclk, q1;  // inverted clock and intermediate q output of Master

	assign iclk = ~clk;
	
	dflipflop masterff01(q1,clk,rst,d);
	dflipflop slaveff02(q,iclk,rst,q1);

endmodule