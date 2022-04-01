`timescale 1ns/1ps
module ctrl_tb();

reg clock, start;
wire [15:0] S1S2mux, newDist, PEready;
wire [3:0] VectorX, VectorY;
wire [7:0] AddressR;
wire [9:0] AddressS1, AddressS2;
wire CompStart;

control c1 ( .clock(clock), .start(start), .S1S2mux(S1S2mux), .newDist(newDist), .CompStart(CompStart), .PEready(PEready),
                 .VectorX(VectorX), .VectorY(VectorY), .AddressR(AddressR), .AddressS1(AddressS1), .AddressS2(AddressS2));

always #10 clock = ~clock;

initial begin

$dumpfile("counter.vcd");
$dumpvars;

clock= 0;
start=0;
#100 start=1;

$monitor ( " time = %7d ns, S1S2mux = %15b, newDist = %2d, CompStart = %1b, PEready = %2d, VectorX = %2d, VectorY = %2d, AddressR = %3d, AddressS1 = %3d, AddressS2 = %3d", 
	         $time, S1S2mux, newDist, CompStart, PEready, VectorX, VectorY, AddressR, AddressS1, AddressS2);

#(4111*10*2) $finish;

end
endmodule 
