module PE_tb();
reg clock;
reg [7:0] R, S1, S2; 
wire [127:0] Accumulate;
reg [15:0] S1S2mux, newDist;

initial begin
$dumpfile("PE_dump.vcd");
$dumpvars;
clock = 1;
R = 8'b00000000;
S1 = 8'b00000000;
S2 = 8'b00000000;
S1S2mux = 16'b00000000;
newDist = 16'b00000000;

#10 R = 8'b00000001;
#25 S1 = 8'b00000000;
#30 S2= 8'b00000000;
#35 S1S2mux = 16'b00000000;
#40 newDist = 16'b00000001;
	#350 $finish;	
end


always begin
#5 clock = ~clock;
end

//connect DUT to testbench
 PEtotal PE_DUT(.clock(clock), .R(R), .S1(S1), 
 .S2(S2),.S1S2mux(S1S2mux), .newDist(newDist), .Accumulate(Accumulate));

endmodule