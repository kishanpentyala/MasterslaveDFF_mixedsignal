# Mixed Signal Circuit Design and Simulation Marathon
# MasterslaveDFF_mixedsignal
- [Abstract](#abstract)
- [Reference Circuit Diagram](#reference-circuit-diagram)
- [Reference Waveform](#reference-waveform)
- [Circuit Details](#circuit-details)
- [Software Used](#software-used)
  * [eSim](#esim)
  * [NgSpice](#ngspice)
  * [Makerchip](#makerchip)
  * [Verilator](#verilator)
- [Circuit Diagram in eSim](#circuit-diagram-in-esim)
- [Verilog Code](#verilog-code)
- [Makerchip](#makerchip-1)
- [Makerchip Plots](#makerchip-plots)
- [Netlists](#netlists)
- [NgSpice Plots](#ngspice-plots)
- [Steps to run generate NgVeri Model](#steps-to-run-generate-ngveri-model)
- [Steps to run this project](#steps-to-run-this-project)
- [Acknowlegdements](#acknowlegdements)
- [References](#references)

<small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>
## Abstract
This paper presents design of a Master slave D flipflop which works on a level triggered clock.
Design is done using esim, Makerchip-Ngveri and sky130 pdk.
This design provides stable output irrespective of glitches at input and used as an alternative to negative edge triggered D flipflop
## Reference Circuit Diagram
![seqimg40](https://user-images.githubusercontent.com/57453168/194692323-dd648fa2-824a-492a-83df-dc10e61c9fe2.gif)
## Reference Waveform
![seqimg41](https://user-images.githubusercontent.com/57453168/194692370-03a99ffc-eda0-45e2-8ccf-eac8238ca04a.gif)
## Circuit Details
The Master slave block is a digital block and made using Verilog code in Makerchip-Ngveri tool.
</br>
Here a ring oscillator and a Schmitt trigger circuit is used to generate an analog clock wave and given through ADC to Master slave D Flipflop.
3stcmringosci13 and smttrigger21 are the Analog sky130 IPs from FOSSE eSim-IP-Library
</br>
We can see clk signal has a period around 60ns and it has active high reset. 
The circuit becomes active at negative edge of clock, 
so Master slave flipflop working on level trigger clk act as negative edge triggered D Flipflop
</br>

## Software Used
### eSim
It is an Open Source EDA developed by FOSSEE, IIT Bombay. It is used for electronic circuit simulation. It is made by the combination of two software namely NgSpice and KiCAD.
</br>
For more details refer:
</br>
https://esim.fossee.in/home
### NgSpice
It is an Open Source Software for Spice Simulations. For more details refer:
</br>
http://ngspice.sourceforge.net/docs.html
### Makerchip
It is an Online Web Browser IDE for Verilog/System-verilog/TL-Verilog Simulation. Refer
</br> https://www.makerchip.com/
### Verilator
It is a tool which converts Verilog code to C++ objects. Refer:
https://www.veripool.org/verilator/

## Circuit Diagram in eSim
The following is the schematic in eSim:
![image](https://user-images.githubusercontent.com/57453168/194693124-551d65de-92ad-4e97-9b6d-ec64d49cee84.png)
## Verilog Code
```
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
```
## Makerchip
```
\TLV_version 1d: tl-x.org
\SV
/* verilator lint_off UNUSED*/  /* verilator lint_off DECLFILENAME*/  /* verilator lint_off BLKSEQ*/  /* verilator lint_off WIDTH*/  /* verilator lint_off SELRANGE*/  /* verilator lint_off PINCONNECTEMPTY*/  /* verilator lint_off DEFPARAM*/  /* verilator lint_off IMPLICIT*/  /* verilator lint_off COMBDLY*/  /* verilator lint_off SYNCASYNCNET*/  /* verilator lint_off UNOPTFLAT */  /* verilator lint_off UNSIGNED*/  /* verilator lint_off CASEINCOMPLETE*/  /* verilator lint_off UNDRIVEN*/  /* verilator lint_off VARHIDDEN*/  /* verilator lint_off CASEX*/  /* verilator lint_off CASEOVERLAP*/  /* verilator lint_off PINMISSING*/  /* verilator lint_off BLKANDNBLK*/  /* verilator lint_off MULTIDRIVEN*/  /* verilator lint_off WIDTHCONCAT*/  /* verilator lint_off ASSIGNDLY*/  /* verilator lint_off MODDUP*/  /* verilator lint_off STMTDLY*/  /* verilator lint_off LITENDIAN*/  /* verilator lint_off INITIALDLY*/  

//Your Verilog/System Verilog Code Starts Here:
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

//Top Module Code Starts here:
	module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
		logic  q;//output
		logic  rst;//input
		logic  d;//input
//The $random() can be replaced if user wants to assign values
		assign rst = reset;
		assign d = $random();
		Kishan_masterslaveDFF Kishan_masterslaveDFF(.q(q), .clk(clk), .rst(rst), .d(d));
	
\TLV
//Add \TLV here if desired                                     
\SV
endmodule
```
## Makerchip Plots
![image](https://user-images.githubusercontent.com/57453168/194694036-1a409a31-2999-4669-b271-a68f60db6554.png)
## Netlists
![image](https://user-images.githubusercontent.com/57453168/194695487-edc4c6e0-f1b5-4fae-9aaa-d54136e7ab0b.png)
## NgSpice Plots
![image](https://user-images.githubusercontent.com/57453168/194695112-a518d35c-5f55-4ddb-a546-0f538f56d704.png)
![image](https://user-images.githubusercontent.com/57453168/194695167-dcd02501-a915-4585-9eef-10ab4d25cb54.png)
![image](https://user-images.githubusercontent.com/57453168/194695180-61babb3c-bb6d-4461-807d-67afa1a67f5d.png)
![image](https://user-images.githubusercontent.com/57453168/194695208-9db9e91c-f90d-4690-b515-f92db4a14b09.png)

## Steps to run generate NgVeri Model
1. Open eSim
2. Run NgVeri-Makerchip 
3. Add top level verilog file in Makerchip Tab
4. Click on NgVeri tab
5. Add dependency files
6. Click on Run Verilog to NgSpice Converter
7. Debug if any errors
8. Model created successfully
## Steps to run this project
1. Open a new terminal
2. Clone this project using the following command:</br>
```https://github.com/kishanpentyala/MasterslaveDFF_mixedsignal.git ```</br>
3. Change directory:</br>
```cd masterslaveDFF```</br>
4. Run ngspice:</br>
```ngspice masterslaveDFF.cir.out```</br>
5. To run the project in eSim:

  - Run eSim</br>
  - Load the project</br>
  - Open eeSchema</br>
## Acknowlegdements
1. FOSSEE, IIT Bombay
2. Steve Hoover, Founder, Redwood EDA
3. Kunal Ghosh, Co-founder, VSD Corp. Pvt. Ltd. - kunalpghosh@gmail.com
4. Sumanto Kar, eSim Team, FOSSEE
5. http://iitb.ac.in/
6. https://www.google.co.in/
7. https://fossee.in/
8. https://spoken-tutorial.org/
9. https://www.vlsisystemdesign.com/
10. https://www.c2s.gov.in/

## References
1. Behaviour of Master Slave D Flipflop https://www.youtube.com/watch?v=5ykewHgHYBI
2. Analog Sky130 IPs from FOSSE eSim-IP-Library	https://github.com/FOSSEE/eSim-IP-Library/tree/SKY130-Analog-IPs	 
