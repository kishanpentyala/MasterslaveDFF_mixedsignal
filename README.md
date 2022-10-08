# Mixed Signal Circuit Design and Simulation Marathon
# MasterslaveDFF_mixedsignal
- [Abstract](#abstract)
- [Reference Circuit Diagram](#reference-circuit-diagram)
- [Reference Waveform](#reference-waveform)
- [Circuit Details](#circuit-details)
- [Truth Table](#truth-table)
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
- [GAW Plots](#gaw-plots)
- [Steps to run generate NgVeri Model](#steps-to-run-generate-ngveri-model)
- [Steps to run this project](#steps-to-run-this-project)
- [Acknowlegdements](#acknowlegdements)
- [References](#references)

<small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>


## Abstract
With the increasing technology, the size of the transistors is
reducing. The reducing size leads to the tradeoff between
power, efficiency and switching time. Because of which
there is requirement to design low power transistor with less
area and lesser number of gates. The design should use
lesser power as well. Thus, making it more and more
efficient.
## Reference Circuit Diagram
![seqimg40](https://user-images.githubusercontent.com/57453168/194692323-dd648fa2-824a-492a-83df-dc10e61c9fe2.gif)
## Reference Waveform
![seqimg41](https://user-images.githubusercontent.com/57453168/194692370-03a99ffc-eda0-45e2-8ccf-eac8238ca04a.gif)
## Circuit Details
As shown in the figure we have two cross coupled
circuits of PMOS logic and NMOS logic.
</br>
On the PMOS logic we are getting the output as XOR
while in the NMOS block we get the output as XNOR.
</br>
The transistors M4 and M3 behave as a pass transistor
and pass the output of M1, M2 and M5, M6
respectively.
</br>

The advantage of the above circuit is that it uses only
6 transistors and gives both outputs of XOR and
XNOR while the general circuit uses 8 transistors with
only one output either XOR or XNOR.
</br>
This way it consumes less space and less power and is
efficient in many ways.
</br>
## Truth Table

| Input D  | Input CLK | Output Q |
| ------------- | ------------- | ------------- |
| ?  | 0 | No change |
| 0  | 1 | 0 |
| 1  | 1 | 1 |
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
		assign rst = reset();
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
![image](https://user-images.githubusercontent.com/58599984/156440985-0a983124-b5ad-4b60-b83f-7adf0e7c36fb.png)
## NgSpice Plots
![image](https://user-images.githubusercontent.com/58599984/156440036-188911e0-9bb2-4d9f-b53d-878f5792d1c6.png)
![image](https://user-images.githubusercontent.com/58599984/156440082-c3f319ef-3224-4595-85e9-38bae135350f.png)

![image](https://user-images.githubusercontent.com/58599984/156439624-353c14ac-4216-4aa7-8207-64f4c287b2b7.png)
![image](https://user-images.githubusercontent.com/58599984/156439590-9371c62f-384b-42f8-9403-9704429d752d.png)
## GAW Plots
![image](https://user-images.githubusercontent.com/58599984/156439535-edb78fc7-a6e6-4178-864a-7cea5ea37e23.png)
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
```git clone https://github.com/Eyantra698Sumanto/XOR-XNOR-Gate.git ```</br>
3. Change directory:</br>
```cd eSim_project_files/xor_xnor```</br>
4. Run ngspice:</br>
```ngspice xor_xnor.cir.out```</br>
5. To run the project in eSim:

  - Run eSim</br>
  - Load the project</br>
  - Open eeSchema</br>
## Acknowlegdements
1. FOSSEE, IIT Bombay
2. Steve Hoover, Founder, Redwood EDA
3. Kunal Ghosh, Co-founder, VSD Corp. Pvt. Ltd. - kunalpghosh@gmail.com
4. Sumanto Kar, eSim Team, FOSSEE

## References
1. Ahmad, Nabihah & Hasan, Rezaul. (2011). A new design of XOR-XNOR gates for low power application. 10.1109/ICEDSA.2011.5959039. 
