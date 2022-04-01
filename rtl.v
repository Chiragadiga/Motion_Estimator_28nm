
module Switch (clock, start, BestDist, motionX, motionY,R, S1, S2,AddressR, AddressS1, AddressS2);
  input clock;
  input start;
  output [7:0] BestDist;
  output [3:0] motionX, motionY;
  input [7:0] R, S1, S2;
  input [7:0] AddressR;
  input [9:0]AddressS1, AddressS2;
  
  wire clock;
  wire start;
  wire [7:0] BestDist;
  wire [3:0] motionX, motionY;

  wire [7:0] R, S1, S2;
  wire [7:0] AddressR;
  wire [9:0] AddressS1, AddressS2;

  wire [15:0] S1S2mux, newDist, PEready;
  wire CompStart;
  wire [3:0] VectorX, VectorY;
  wire [127:0] Accumulate;
  wire [7:0] Rpipe;

  control ctl_u(clock, start, S1S2mux, newDist, CompStart, PEready, VectorX, VectorY, AddressR, AddressS1, AddressS2);



  PEtotal pe_u(clock, R, S1, S2, S1S2mux, newDist, Accumulate);

  Comparator comp_u(clock, CompStart, Accumulate, PEready, VectorX, VectorY, BestDist, motionX, motionY);
endmodule


/* Module For Processing Element (PE) */
module PE (clock, R, S1, S2, S1S2mux, newDist, Accumulate, Rpipe);
  input clock;
  input [7:0] R, S1, S2; // memory inputs
  input S1S2mux, newDist; // control input
  output [7:0] Accumulate, Rpipe;
  reg [7:0] Accumulate, AccumulateIn, difference, difference_temp, Rpipe;
  reg Carry;

  always @(posedge clock) Rpipe <= R;
  always @(posedge clock) Accumulate <= AccumulateIn;

  always @(R or S1 or S2 or S1S2mux or newDist or Accumulate)
      begin 
    difference = R -(S1S2mux? S1:S2);
    difference_temp = - difference;
    if (difference<0) 
     begin
       difference = difference_temp;  
     end
    {Carry,AccumulateIn} = Accumulate + difference;
    if (Carry == 1) AccumulateIn = 8'hFF; // 'saturated
    if (newDist == 1) AccumulateIn = difference;
      end
endmodule

/* Module For The Last Processing Element (PEend) */
module PEend (clock, R, S1, S2, S1S2mux, newDist, Accumulate);
  input clock;
  input [7:0] R, S1, S2; // memory inputs
  input S1S2mux, newDist; // control input
  output [7:0] Accumulate;
  reg [7:0] Accumulate, AccumulateIn, difference, difference_temp;
  reg Carry;

  always @(posedge clock) Accumulate <= AccumulateIn;

  always @(R or S1 or S2 or S1S2mux or newDist or Accumulate)
      begin 
    difference = R -(S1S2mux? S1:S2);
    difference_temp = - difference;
    if (difference<0) 
     begin
       difference = difference_temp;  
     end
    {Carry,AccumulateIn} = Accumulate + difference;
    if (Carry == 1) AccumulateIn = 8'hFF; // 'saturated
    if (newDist == 1) AccumulateIn = difference;
      end
endmodule

/* Module For Total 16 Processing Elements (PEtotal)*/
module PEtotal (clock, R, S1, S2, S1S2mux, newDist, Accumulate);
  input clock;
  input [7:0] R, S1, S2; // memory inputs
  input [15:0] S1S2mux, newDist; // control input
  output [127:0] Accumulate;

  wire [7:0] Rpipe0, Rpipe1, Rpipe2, Rpipe3, Rpipe4, Rpipe5, Rpipe6, Rpipe7, Rpipe8, Rpipe9, Rpipe10, Rpipe11, Rpipe12, Rpipe13, Rpipe14;

  PE pe0 (clock, R, S1, S2, S1S2mux[0], newDist[0], Accumulate[7:0], Rpipe0);

  PE pe1 (clock, Rpipe0, S1, S2, S1S2mux[1], newDist[1], Accumulate[15:8], Rpipe1);

  PE pe2 (clock, Rpipe1, S1, S2, S1S2mux[2], newDist[2], Accumulate[23:16], Rpipe2);

  PE pe3 (clock, Rpipe2, S1, S2, S1S2mux[3], newDist[3], Accumulate[31:24], Rpipe3);

  PE pe4 (clock, Rpipe3, S1, S2, S1S2mux[4], newDist[4], Accumulate[39:32], Rpipe4);

  PE pe5 (clock, Rpipe4, S1, S2, S1S2mux[5], newDist[5], Accumulate[47:40], Rpipe5);

  PE pe6 (clock, Rpipe5, S1, S2, S1S2mux[6], newDist[6], Accumulate[55:48], Rpipe6);

  PE pe7 (clock, Rpipe6, S1, S2, S1S2mux[7], newDist[7], Accumulate[63:56], Rpipe7);

  PE pe8 (clock, Rpipe7, S1, S2, S1S2mux[8], newDist[8], Accumulate[71:64], Rpipe8);

  PE pe9 (clock, Rpipe8, S1, S2, S1S2mux[9], newDist[9], Accumulate[79:72], Rpipe9);

  PE pe10 (clock, Rpipe9, S1, S2, S1S2mux[10], newDist[10], Accumulate[87:80], Rpipe10);

  PE pe11 (clock, Rpipe10, S1, S2, S1S2mux[11], newDist[11], Accumulate[95:88], Rpipe11);

  PE pe12 (clock, Rpipe11, S1, S2, S1S2mux[12], newDist[12], Accumulate[103:96], Rpipe12);

  PE pe13 (clock, Rpipe12, S1, S2, S1S2mux[13], newDist[13], Accumulate[111:104], Rpipe13);

  PE pe14 (clock, Rpipe13, S1, S2, S1S2mux[14], newDist[14], Accumulate[119:112], Rpipe14);

  PEend pe15 (clock, Rpipe14, S1, S2, S1S2mux[15], newDist[15], Accumulate[127:120]);
endmodule


/* Module For Control Unit */
module control (clock, start, S1S2mux, newDist, CompStart, PEready, VectorX, VectorY, AddressR, AddressS1, AddressS2);
  input clock;
  input start; // = 1 when going
  output [15:0] S1S2mux, newDist, PEready; // select S1 or S2 for each PE, newdist when a PE starts evaluating newDist, when a PE[i] has newdist calculated.
  output CompStart;
  output [3:0] VectorX, VectorY;
  output [7:0] AddressR;
  output [9:0] AddressS1, AddressS2;

  parameter count_complete = 16*(16*16) + 15; //15 cycles extra due to pipeline of R mem data for each PE, 256 overlays of R over S

  reg [15:0] S1S2mux, newDist, PEready;
  reg CompStart;
  reg [3:0] VectorX, VectorY;
  reg [7:0] AddressR;
  reg [9:0] AddressS1, AddressS2;
  reg  [12:0] count;

  reg completed;
  integer i;

 
  always @ (posedge clock)
    begin
      if (start == 0) count <= 12'b0;  // 'counter to generate control signals.
      else if (completed == 0) count <= count + 1'b1;// 'counter loaded with new value every posedge of clk.
    end
    
  always @ (count)
   begin
    
      for (i=0; i<16; i= i+1) // toggle control signals for PE[i].
         begin
          newDist[i] = (count[7:0] == i);	// =1 for first 16 cycles, then after count crosses multiples of 256.
          PEready[i] = (newDist[i] && (count >= 256));	
          S1S2mux[i] = (count[3:0] > i); // after 16 cycles S2 should be 1 for PE[i], then after count crosses multiples of 16.
          CompStart  = (count >= 256); // comparator starts after 256 cycles.
         end

    AddressR = count[7:0]; // generate reference mem address
    AddressS1 = (count[11:8] + count[7:4])*16 + count[3:0]; // row number of register + column number

    
    AddressS2 = (count[11:8] + count[7:4])*16 + count[3:0] + 16;// access the last 16 values in a row of search memory.

    VectorX = count[3:0] - 8; 
    VectorY = 8 - count[7:4];

    completed = (count[12:0] == count_complete); //4111
   end
endmodule

/* Module For Comparator Unit */
module Comparator (clock, CompStart, PEout, PEready, vectorX, vectorY, BestDist, motionX, motionY);
  input clock;
  input CompStart; // goes high when distortion calculation start
  input [8*16-1:0] PEout; // outputs of PEs as one long vector
  input [15:0] PEready; // goes high when that PE has a new distortion
  input [3:0] vectorX, vectorY; // motion vector being evaluated
  output [7:0] BestDist; // best distortion vector so far
  output [3:0] motionX, motionY; // best motion vector so far
  reg [7:0] BestDist, newDist;
  reg [3:0] motionX, motionY;
  reg newBest;
  integer n;

  always @ (posedge clock)
    if (CompStart == 0) BestDist <= 8'hFF; // 'initialize to highest value
    else if (newBest == 1)
      begin
        BestDist <= newDist;
        motionX <= vectorX;
        motionY <= vectorY;
      end

  always @ ( PEout or PEready or CompStart)
    begin
      newDist = 8'hFF; //'
     
      for (n = 0; n <= 15; n = n+1)
    begin
          if (PEready[n] == 1) 
      case (n) 
        4'b0000: newDist = PEout[7:0]; 
        4'b0001: newDist = PEout[15:8]; 
        4'b0010: newDist = PEout[23:16]; 
        4'b0011: newDist = PEout[31:24];
        4'b0100: newDist = PEout[39:32]; 
        4'b0101: newDist = PEout[47:40]; 
        4'b0110: newDist = PEout[55:48]; 
        4'b0111: newDist = PEout[63:56]; 
        4'b1000: newDist = PEout[71:64]; 
        4'b1001: newDist = PEout[79:72]; 
        4'b1010: newDist = PEout[87:80]; 
        4'b1011: newDist = PEout[95:88]; 
        4'b1100: newDist = PEout[103:96]; 
        4'b1101: newDist = PEout[111:104]; 
        4'b1110: newDist = PEout[119:112]; 
        4'b1111: newDist = PEout[127:120];
        default: newDist = 8'hFF;  //'
      endcase
       end

      if ((|PEready == 0) || (CompStart == 0)) newBest = 0; // no PE is ready
      else if (newDist < BestDist) newBest = 1;
      else newBest = 0;
    end
endmodule



