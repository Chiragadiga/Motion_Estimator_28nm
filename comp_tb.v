`timescale 1ns/1ps
module comp_tb();

reg clock, CompStart;
reg [15:0] PEready;
reg [3:0] VectorX, VectorY;
reg [8*16-1:0] PEout;
wire [7:0] BestDist;
wire [3:0] motionX, motionY;


Comparator comp ( .clock(clock), .PEready(PEready), .CompStart(CompStart), .PEout(PEout), 
                   .vectorX(VectorX), .vectorY(VectorY), .BestDist(BestDist), .motionX(motionX), .motionY(motionY));

always #10 clock = ~clock;

initial begin


$dumpfile("comparator.vcd");
$dumpvars;

clock= 0;
CompStart=0;
PEready=0;
PEout=0;
#100 CompStart=1;
#20 assign PEout = {4{8'haa, 8'h77, 8'h55, 8'hee}};

#100 PEready[8] = 1'b1; //Bestdist should be [ee]
VectorX = 3;
VectorY = 4;


#100 PEready[8] = 1'b0; 
PEready[11] = 1'b1; //BestDist should be [aa]
 VectorX= 5;
 VectorY= 5; 

#100 PEready[11] = 1'b0; 
PEready[14] = 1'b1; //BestDist should be [77]
VectorX = 1; 
VectorY = 0;

#100 PEready[14] = 1'b0;
PEready[2] = 1'b1; //BestDist should be [77]
 VectorX =8;
 VectorY =5;


#100 PEready[2] = 1'b0; 
PEready[1] = 1'b1; //BestDist should be [55]
 VectorX= 7;
 VectorY= 5;



#100 PEready=0; //BestDist doesnt get updated
VectorX = 0;
VectorY = 0; 


#(500) $finish;
end 
endmodule