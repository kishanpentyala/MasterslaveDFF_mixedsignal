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
```
* d:\esim\esim_workspace\masterslavedff\masterslavedff.cir

.include 3stcmringosci13.sub
.include smttrigger21.sub
.lib "D:\esim\FOSSEE\eSim\library\sky130_fd_pr\models\sky130.lib.spice" tt
.include "D:\esim\FOSSEE\eSim\library\sky130_fd_pr\models\sky130_fd_pr__model__pnp.model.spice"
.include "D:\esim\FOSSEE\eSim\library\sky130_fd_pr\models\sky130_fd_pr__model__diode_pd2nw_11v0.model.spice"
.include "D:\esim\FOSSEE\eSim\library\sky130_fd_pr\models\sky130_fd_pr__model__inductors.model.spice"
.include "D:\esim\FOSSEE\eSim\library\sky130_fd_pr\models\sky130_fd_pr__model__r+c.model.spice"
.include "D:\esim\FOSSEE\eSim\library\sky130_fd_pr\models\sky130_fd_pr__model__linear.model.spice"
.include "D:\esim\FOSSEE\eSim\library\sky130_fd_pr\models\sky130_fd_pr__model__diode_pw2nd_11v0.model.spice"
* u1  net-_u1-pad1_ net-_u1-pad2_ net-_u1-pad3_ net-_u1-pad4_ kishan_masterslavedff
v3  d gnd pulse(0 3.3 0 0 0 85n 170n)
v2  rst gnd pulse(0 3.3 0 0 0 50n 450n)
* u2  clk rst d net-_u1-pad1_ net-_u1-pad2_ net-_u1-pad3_ adc_bridge_3
* u3  net-_u1-pad4_ q dac_bridge_1
* u7  q plot_v1
* u4  clk plot_v1
* u5  rst plot_v1
* u6  d plot_v1
* s c m o d e
x1 net-_x1-pad1_ net-_u10-pad~_ net-_u9-pad~_ net-_u8-pad~_ 3stcmringosci13
x2 net-_u10-pad~_ net-_x1-pad1_ clk smttrigger21
v1 net-_x1-pad1_ gnd  dc 3.3
* u10  net-_u10-pad~_ plot_v1
* u9  net-_u9-pad~_ plot_v1
* u8  net-_u8-pad~_ plot_v1
a1 [net-_u1-pad1_ ] [net-_u1-pad2_ ] [net-_u1-pad3_ ] [net-_u1-pad4_ ] u1
a2 [clk rst d ] [net-_u1-pad1_ net-_u1-pad2_ net-_u1-pad3_ ] u2
a3 [net-_u1-pad4_ ] [q ] u3
* Schematic Name:                             kishan_masterslavedff, NgSpice Name: kishan_masterslavedff
.model u1 kishan_masterslavedff(rise_delay=1.0e-9 fall_delay=1.0e-9 input_load=1.0e-12 instance_id=1 ) 
* Schematic Name:                             adc_bridge_3, NgSpice Name: adc_bridge
.model u2 adc_bridge(in_low=1.0 in_high=2.0 rise_delay=1.0e-9 fall_delay=1.0e-9 ) 
* Schematic Name:                             dac_bridge_1, NgSpice Name: dac_bridge
.model u3 dac_bridge(out_low=0.0 out_high=5.0 out_undef=0.5 input_load=1.0e-12 t_rise=1.0e-9 t_fall=1.0e-9 ) 
.tran 10e-09 1000e-09 500e-09

* Control Statements 
.control
run
print allv > plot_data_v.txt
print alli > plot_data_i.txt
plot v(q)
plot v(clk)
plot v(rst)
plot v(d)
plot v(net-_u10-pad~_)
plot v(net-_u9-pad~_)
plot v(net-_u8-pad~_)
.endc
.end
```
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
