`timescale 1ns/1ps
module top_tb();
reg clock;
wire [7:0] AddressR;
wire [9:0] AddressS1, AddressS2;
reg [7:0] Rmem[255:0];
reg	[7:0] Smem[960:0];
reg [7:0] R, S1, S2;
reg start;

wire [7:0] BestDist;
wire [3:0] motionX, motionY;
wire [127:0] Accumulate;
wire [15:0] S1S2mux,newDist,PEready;
wire [3:0] VectorX, VectorY;
wire CompStart;

    //Switch connect (.clock(clock), .start(start), .BestDist(BestDist), .motionX(motionX), .motionY(motionY),.R(R), .S1(S1), .S2(S2), .AddressR(AddressR), .AddressS1(AddressS1), .AddressS2(AddressS2));
  

initial begin
$dumpfile("PE_dump1.vcd");
$dumpvars;
$readmemh("ref_memory.hex",Rmem);
$readmemh("search_memory.hex",Smem);
clock= 0;
start=0;
#100 start=1;

#(4111*2*10) $finish;
end

always #10 clock = ~clock;



always @(posedge clock) 
 begin
	R <= Rmem[AddressR];
	S1 <= Smem[AddressS1];
	S2 <= Smem[AddressS2];
end

Switch connect_aagu (.clock(clock), .start(start), .BestDist(BestDist), .motionX(motionX), .motionY(motionY),.R(R), .S1(S1), .S2(S2), .AddressR(AddressR), .AddressS1(AddressS1), .AddressS2(AddressS2));

endmodule
 


