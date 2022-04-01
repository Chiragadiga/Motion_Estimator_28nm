// IC Compiler II Version S-2021.06-SP1 Verilog Writer
// Generated on 12/20/2021 at 22:25:1
// Library Name: estimator
// Block Name: estimator
// User Label: 
// Write Command: write_verilog -top_module_first ./outputs/lame_final.v
module Switch ( clock , start , BestDist , motionX , motionY , R , S1 , S2 , 
    AddressR , AddressS1 , AddressS2 ) ;
input  clock ;
input  start ;
output [7:0] BestDist ;
output [3:0] motionX ;
output [3:0] motionY ;
input  [7:0] R ;
input  [7:0] S1 ;
input  [7:0] S2 ;
input  [7:0] AddressR ;
input  [9:0] AddressS1 ;
input  [9:0] AddressS2 ;

wire [15:0] S1S2mux ;
wire [15:0] newDist ;
wire [15:0] PEready ;
wire [3:0] VectorX ;
wire [3:0] VectorY ;
wire [127:0] Accumulate ;

control ctl_u ( .clock ( clock ) , .start ( start ) ,
    .S1S2mux ( { SYNOPSYS_UNCONNECTED__0 , S1S2mux[14] , S1S2mux[13] , 
        S1S2mux[12] , S1S2mux[11] , S1S2mux[10] , S1S2mux[9] , S1S2mux[8] , 
        S1S2mux[7] , S1S2mux[6] , S1S2mux[5] , S1S2mux[4] , S1S2mux[3] , 
        S1S2mux[2] , S1S2mux[1] , S1S2mux[0] } ) ,
    .newDist ( newDist ) , .CompStart ( CompStart ) , .PEready ( PEready ) , 
    .VectorX ( VectorX ) , .VectorY ( VectorY ) ) ;
PEtotal pe_u ( .clock ( clock ) , .R ( R ) , .S1 ( S1 ) , .S2 ( S2 ) ,
    .S1S2mux ( { 1'b0 , S1S2mux[14] , S1S2mux[13] , S1S2mux[12] , 
        S1S2mux[11] , S1S2mux[10] , S1S2mux[9] , S1S2mux[8] , S1S2mux[7] , 
        S1S2mux[6] , S1S2mux[5] , S1S2mux[4] , S1S2mux[3] , S1S2mux[2] , 
        S1S2mux[1] , S1S2mux[0] } ) ,
    .newDist ( newDist ) , .Accumulate ( Accumulate ) ) ;
Comparator comp_u ( .clock ( clock ) , .CompStart ( CompStart ) , 
    .PEout ( Accumulate ) , .PEready ( PEready ) , .vectorX ( VectorX ) , 
    .vectorY ( VectorY ) , .BestDist ( BestDist ) , .motionX ( motionX ) , 
    .motionY ( motionY ) ) ;
endmodule


module control ( clock , start , S1S2mux , newDist , CompStart , PEready , 
    VectorX , VectorY , AddressR , AddressS1 , AddressS2 ) ;
input  clock ;
input  start ;
output [15:0] S1S2mux ;
output [15:0] newDist ;
output CompStart ;
output [15:0] PEready ;
output [3:0] VectorX ;
output [3:0] VectorY ;
output [7:0] AddressR ;
output [9:0] AddressS1 ;
output [9:0] AddressS2 ;

wire N63 ;
wire N71 ;
wire N79 ;
wire N87 ;
wire N95 ;
wire N103 ;
wire N111 ;
wire N119 ;
wire N127 ;
wire N135 ;
wire N143 ;
wire N151 ;
wire N159 ;
wire N167 ;
wire N175 ;
wire N183 ;
wire [12:8] count ;

assign AddressR[3] = S1S2mux[7] ;
assign AddressR[2] = VectorX[2] ;
assign AddressR[1] = VectorX[1] ;
assign AddressR[4] = VectorY[0] ;
assign VectorX[0] = AddressS2[0] ;
assign AddressS1[0] = AddressS2[0] ;
assign AddressR[0] = AddressS2[0] ;
assign N63 = newDist[15] ;
assign N71 = newDist[14] ;
assign N79 = newDist[13] ;
assign N87 = newDist[12] ;
assign N95 = newDist[11] ;
assign N103 = newDist[10] ;
assign N111 = newDist[9] ;
assign N119 = newDist[8] ;
assign N127 = newDist[7] ;
assign N135 = newDist[6] ;
assign N143 = newDist[5] ;
assign N151 = newDist[4] ;
assign N159 = newDist[3] ;
assign N167 = newDist[2] ;
assign N175 = newDist[1] ;
assign N183 = newDist[0] ;
assign S1S2mux[15] = 1'b0 ;
assign AddressS1[9] = 1'b0 ;

control_DW01_inc_0 add_156_S2 (
    .A ( { count[12] , count[11] , count[10] , count[9] , count[8] , 
        AddressR[7] , AddressR[6] , AddressR[5] , VectorY[0] , S1S2mux[7] , 
        VectorX[2] , VectorX[1] , AddressS2[0] } ) ,
    .SUM ( { N16 , N15 , N14 , N13 , N12 , N11 , N10 , N9 , N8 , N7 , N6 , 
        N5 , N4 } ) ) ;
DFFSSRX1_LVT \count_reg[11] ( .D ( N15 ) , .SETB ( 1'b1 ) , .RSTB ( n38 ) , 
    .CLK ( clock ) , .Q ( count[11] ) , .QN ( n37 ) ) ;
DFFSSRX1_LVT \count_reg[10] ( .D ( N14 ) , .SETB ( 1'b1 ) , .RSTB ( n38 ) , 
    .CLK ( clock ) , .Q ( count[10] ) , .QN ( n36 ) ) ;
DFFSSRX1_LVT \count_reg[9] ( .D ( N13 ) , .SETB ( 1'b1 ) , .RSTB ( n38 ) , 
    .CLK ( clock ) , .Q ( count[9] ) , .QN ( n35 ) ) ;
DFFSSRX1_LVT \count_reg[8] ( .D ( N12 ) , .SETB ( 1'b1 ) , .RSTB ( n38 ) , 
    .CLK ( clock ) , .Q ( count[8] ) , .QN ( n34 ) ) ;
DFFSSRX1_LVT \count_reg[5] ( .D ( N9 ) , .SETB ( 1'b1 ) , .RSTB ( n38 ) , 
    .CLK ( clock ) , .Q ( AddressR[5] ) , .QN ( n32 ) ) ;
DFFSSRX1_LVT \count_reg[4] ( .D ( N8 ) , .SETB ( 1'b1 ) , .RSTB ( n38 ) , 
    .CLK ( clock ) , .Q ( VectorY[0] ) , .QN ( n33 ) ) ;
DFFSSRX1_LVT \count_reg[12] ( .D ( N16 ) , .SETB ( n75 ) , .RSTB ( start ) , 
    .CLK ( clock ) , .Q ( count[12] ) , .QN ( n93 ) ) ;
DFFSSRX1_LVT \count_reg[6] ( .D ( N10 ) , .SETB ( 1'b1 ) , .RSTB ( n38 ) , 
    .CLK ( clock ) , .Q ( AddressR[6] ) , .QN ( n31 ) ) ;
DFFSSRX1_LVT \count_reg[2] ( .D ( N6 ) , .SETB ( n75 ) , .RSTB ( start ) , 
    .CLK ( clock ) , .Q ( VectorX[2] ) , .QN ( n91 ) ) ;
DFFSSRX1_LVT \count_reg[3] ( .D ( N7 ) , .SETB ( n75 ) , .RSTB ( start ) , 
    .CLK ( clock ) , .Q ( S1S2mux[7] ) , .QN ( VectorX[3] ) ) ;
DFFSSRX1_LVT \count_reg[1] ( .D ( N5 ) , .SETB ( n75 ) , .RSTB ( start ) , 
    .CLK ( clock ) , .Q ( VectorX[1] ) , .QN ( n89 ) ) ;
DFFSSRX1_LVT \count_reg[0] ( .D ( N4 ) , .SETB ( n75 ) , .RSTB ( start ) , 
    .CLK ( clock ) , .Q ( AddressS2[0] ) , .QN ( n86 ) ) ;
DFFSSRX1_HVT \count_reg[7] ( .D ( N11 ) , .SETB ( 1'b1 ) , .RSTB ( n38 ) , 
    .CLK ( clock ) , .Q ( AddressR[7] ) , .QN ( n30 ) ) ;
INVX1_LVT U11 ( .A ( n24 ) , .Y ( n8 ) ) ;
AND2X1_LVT U12 ( .A1 ( S1S2mux[11] ) , .A2 ( n8 ) , .Y ( S1S2mux[14] ) ) ;
AND2X1_LVT U13 ( .A1 ( newDist[3] ) , .A2 ( CompStart ) , .Y ( PEready[3] ) ) ;
AND2X1_LVT U14 ( .A1 ( newDist[11] ) , .A2 ( CompStart ) , 
    .Y ( PEready[11] ) ) ;
AND2X1_LVT U15 ( .A1 ( newDist[7] ) , .A2 ( CompStart ) , .Y ( PEready[7] ) ) ;
AND2X1_LVT U16 ( .A1 ( newDist[13] ) , .A2 ( n7 ) , .Y ( PEready[13] ) ) ;
AND2X1_LVT U17 ( .A1 ( newDist[15] ) , .A2 ( n7 ) , .Y ( PEready[15] ) ) ;
AND2X1_LVT U18 ( .A1 ( newDist[6] ) , .A2 ( n7 ) , .Y ( PEready[6] ) ) ;
AND2X1_LVT U19 ( .A1 ( newDist[1] ) , .A2 ( CompStart ) , .Y ( PEready[1] ) ) ;
AND2X1_LVT U20 ( .A1 ( newDist[2] ) , .A2 ( n7 ) , .Y ( PEready[2] ) ) ;
AND2X1_LVT U21 ( .A1 ( newDist[12] ) , .A2 ( CompStart ) , 
    .Y ( PEready[12] ) ) ;
AND2X1_LVT U22 ( .A1 ( newDist[5] ) , .A2 ( CompStart ) , .Y ( PEready[5] ) ) ;
AND2X1_LVT U23 ( .A1 ( newDist[9] ) , .A2 ( CompStart ) , .Y ( PEready[9] ) ) ;
AND2X1_LVT U24 ( .A1 ( newDist[8] ) , .A2 ( n7 ) , .Y ( PEready[8] ) ) ;
AND2X1_LVT U25 ( .A1 ( newDist[10] ) , .A2 ( CompStart ) , 
    .Y ( PEready[10] ) ) ;
AND2X1_LVT U26 ( .A1 ( newDist[4] ) , .A2 ( n7 ) , .Y ( PEready[4] ) ) ;
AND2X1_LVT U27 ( .A1 ( newDist[0] ) , .A2 ( CompStart ) , .Y ( PEready[0] ) ) ;
NAND2X0_LVT U28 ( .A1 ( n24 ) , .A2 ( n11 ) , .Y ( S1S2mux[2] ) ) ;
AND2X1_LVT U29 ( .A1 ( n12 ) , .A2 ( VectorX[2] ) , .Y ( S1S2mux[11] ) ) ;
AND3X1_LVT U30 ( .A1 ( n8 ) , .A2 ( n11 ) , .A3 ( n22 ) , .Y ( newDist[3] ) ) ;
AND2X1_LVT U31 ( .A1 ( n25 ) , .A2 ( n8 ) , .Y ( newDist[11] ) ) ;
AND2X1_LVT U32 ( .A1 ( n29 ) , .A2 ( n8 ) , .Y ( newDist[7] ) ) ;
AND3X1_LVT U33 ( .A1 ( n10 ) , .A2 ( AddressS2[0] ) , .A3 ( n22 ) , 
    .Y ( newDist[1] ) ) ;
AND3X1_LVT U34 ( .A1 ( n22 ) , .A2 ( S1S2mux[11] ) , .A3 ( n27 ) , 
    .Y ( newDist[13] ) ) ;
AND3X1_LVT U35 ( .A1 ( n22 ) , .A2 ( S1S2mux[11] ) , .A3 ( n26 ) , 
    .Y ( newDist[12] ) ) ;
AND3X1_LVT U36 ( .A1 ( n22 ) , .A2 ( n11 ) , .A3 ( n28 ) , .Y ( newDist[2] ) ) ;
AND2X1_LVT U37 ( .A1 ( n28 ) , .A2 ( n25 ) , .Y ( newDist[10] ) ) ;
AND2X1_LVT U38 ( .A1 ( n26 ) , .A2 ( n25 ) , .Y ( newDist[8] ) ) ;
INVX1_LVT U39 ( .A ( S1S2mux[3] ) , .Y ( n11 ) ) ;
AND2X1_LVT U40 ( .A1 ( n25 ) , .A2 ( n27 ) , .Y ( newDist[9] ) ) ;
AND2X1_LVT U41 ( .A1 ( S1S2mux[14] ) , .A2 ( n22 ) , .Y ( newDist[15] ) ) ;
AND2X1_LVT U42 ( .A1 ( n29 ) , .A2 ( n27 ) , .Y ( newDist[5] ) ) ;
AND2X1_LVT U43 ( .A1 ( n29 ) , .A2 ( n26 ) , .Y ( newDist[4] ) ) ;
AND2X1_LVT U44 ( .A1 ( n28 ) , .A2 ( n29 ) , .Y ( newDist[6] ) ) ;
NAND2X0_LVT U45 ( .A1 ( VectorX[1] ) , .A2 ( AddressS2[0] ) , .Y ( n24 ) ) ;
INVX1_LVT U46 ( .A ( n5 ) , .Y ( CompStart ) ) ;
INVX1_LVT U47 ( .A ( n5 ) , .Y ( n7 ) ) ;
INVX1_LVT U48 ( .A ( S1S2mux[1] ) , .Y ( n10 ) ) ;
AND2X1_LVT U49 ( .A1 ( n22 ) , .A2 ( n9 ) , .Y ( newDist[0] ) ) ;
INVX1_LVT U50 ( .A ( S1S2mux[0] ) , .Y ( n9 ) ) ;
AO21X1_LVT U51 ( .A1 ( VectorX[1] ) , .A2 ( VectorX[2] ) , .A3 ( n12 ) , 
    .Y ( S1S2mux[5] ) ) ;
AO21X1_LVT U52 ( .A1 ( n8 ) , .A2 ( n12 ) , .A3 ( S1S2mux[11] ) , 
    .Y ( S1S2mux[10] ) ) ;
AO21X1_LVT U53 ( .A1 ( n8 ) , .A2 ( VectorX[2] ) , .A3 ( n12 ) , 
    .Y ( S1S2mux[6] ) ) ;
AO21X1_LVT U54 ( .A1 ( n12 ) , .A2 ( VectorX[1] ) , .A3 ( S1S2mux[11] ) , 
    .Y ( S1S2mux[9] ) ) ;
AO21X1_LVT U55 ( .A1 ( n12 ) , .A2 ( AddressS2[0] ) , .A3 ( S1S2mux[9] ) , 
    .Y ( S1S2mux[8] ) ) ;
AO21X1_LVT U56 ( .A1 ( S1S2mux[11] ) , .A2 ( AddressS2[0] ) , 
    .A3 ( S1S2mux[13] ) , .Y ( S1S2mux[12] ) ) ;
AO21X1_LVT U57 ( .A1 ( AddressS2[0] ) , .A2 ( VectorX[2] ) , 
    .A3 ( S1S2mux[5] ) , .Y ( S1S2mux[4] ) ) ;
AND2X1_LVT U58 ( .A1 ( S1S2mux[11] ) , .A2 ( VectorX[1] ) , 
    .Y ( S1S2mux[13] ) ) ;
AND2X1_LVT U59 ( .A1 ( newDist[14] ) , .A2 ( CompStart ) , 
    .Y ( PEready[14] ) ) ;
XOR2X1_LVT U60 ( .A1 ( n32 ) , .A2 ( n33 ) , .Y ( VectorY[1] ) ) ;
XOR2X1_LVT U61 ( .A1 ( n31 ) , .A2 ( n23 ) , .Y ( VectorY[2] ) ) ;
AO21X1_LVT U62 ( .A1 ( n21 ) , .A2 ( AddressR[7] ) , .A3 ( n22 ) , 
    .Y ( VectorY[3] ) ) ;
NAND2X0_LVT U63 ( .A1 ( n31 ) , .A2 ( n23 ) , .Y ( n21 ) ) ;
INVX1_LVT U64 ( .A ( VectorX[3] ) , .Y ( n12 ) ) ;
AND3X1_LVT U65 ( .A1 ( n22 ) , .A2 ( n12 ) , .A3 ( n91 ) , .Y ( n25 ) ) ;
AND2X1_LVT U66 ( .A1 ( n89 ) , .A2 ( AddressS2[0] ) , .Y ( n27 ) ) ;
AND3X1_LVT U67 ( .A1 ( n22 ) , .A2 ( VectorX[2] ) , .A3 ( VectorX[3] ) , 
    .Y ( n29 ) ) ;
AND2X1_LVT U68 ( .A1 ( n86 ) , .A2 ( VectorX[1] ) , .Y ( n28 ) ) ;
AND3X1_LVT U69 ( .A1 ( n31 ) , .A2 ( n23 ) , .A3 ( n30 ) , .Y ( n22 ) ) ;
AND2X1_LVT U70 ( .A1 ( n86 ) , .A2 ( n89 ) , .Y ( n26 ) ) ;
AND2X1_LVT U71 ( .A1 ( n32 ) , .A2 ( n33 ) , .Y ( n23 ) ) ;
AND2X1_LVT U72 ( .A1 ( n93 ) , .A2 ( n20 ) , .Y ( n5 ) ) ;
NAND2X0_LVT U73 ( .A1 ( n89 ) , .A2 ( n11 ) , .Y ( S1S2mux[1] ) ) ;
NAND2X0_LVT U74 ( .A1 ( n86 ) , .A2 ( n10 ) , .Y ( S1S2mux[0] ) ) ;
NAND2X0_LVT U75 ( .A1 ( n91 ) , .A2 ( VectorX[3] ) , .Y ( S1S2mux[3] ) ) ;
AND4X1_LVT U76 ( .A1 ( n34 ) , .A2 ( n35 ) , .A3 ( n36 ) , .A4 ( n37 ) , 
    .Y ( n20 ) ) ;
AND3X1_LVT U77 ( .A1 ( n86 ) , .A2 ( n22 ) , .A3 ( S1S2mux[13] ) , 
    .Y ( newDist[14] ) ) ;
AND2X1_LVT U80 ( .A1 ( start ) , .A2 ( n75 ) , .Y ( n38 ) ) ;
NAND3X0_LVT U81 ( .A1 ( n20 ) , .A2 ( count[12] ) , .A3 ( newDist[15] ) , 
    .Y ( n75 ) ) ;
endmodule


module control_DW01_inc_0 ( A , SUM ) ;
input  [12:0] A ;
output [12:0] SUM ;

wire [12:2] carry ;

HADDX1_LVT U1_1_8 ( .A0 ( A[8] ) , .B0 ( carry[8] ) , .C1 ( carry[9] ) , 
    .SO ( SUM[8] ) ) ;
HADDX1_LVT U1_1_9 ( .A0 ( A[9] ) , .B0 ( carry[9] ) , .C1 ( carry[10] ) , 
    .SO ( SUM[9] ) ) ;
HADDX1_LVT U1_1_10 ( .A0 ( A[10] ) , .B0 ( carry[10] ) , .C1 ( carry[11] ) , 
    .SO ( SUM[10] ) ) ;
HADDX1_LVT U1_1_7 ( .A0 ( A[7] ) , .B0 ( carry[7] ) , .C1 ( carry[8] ) , 
    .SO ( SUM[7] ) ) ;
HADDX1_LVT U1_1_6 ( .A0 ( A[6] ) , .B0 ( carry[6] ) , .C1 ( carry[7] ) , 
    .SO ( SUM[6] ) ) ;
HADDX1_LVT U1_1_5 ( .A0 ( A[5] ) , .B0 ( carry[5] ) , .C1 ( carry[6] ) , 
    .SO ( SUM[5] ) ) ;
HADDX1_LVT U1_1_2 ( .A0 ( A[2] ) , .B0 ( carry[2] ) , .C1 ( carry[3] ) , 
    .SO ( SUM[2] ) ) ;
HADDX1_LVT U1_1_4 ( .A0 ( A[4] ) , .B0 ( carry[4] ) , .C1 ( carry[5] ) , 
    .SO ( SUM[4] ) ) ;
HADDX1_LVT U1_1_1 ( .A0 ( A[1] ) , .B0 ( A[0] ) , .C1 ( carry[2] ) , 
    .SO ( SUM[1] ) ) ;
HADDX1_LVT U1_1_11 ( .A0 ( A[11] ) , .B0 ( carry[11] ) , .C1 ( carry[12] ) , 
    .SO ( SUM[11] ) ) ;
HADDX1_LVT U1_1_3 ( .A0 ( A[3] ) , .B0 ( carry[3] ) , .C1 ( carry[4] ) , 
    .SO ( SUM[3] ) ) ;
XOR2X1_LVT U1 ( .A1 ( carry[12] ) , .A2 ( A[12] ) , .Y ( SUM[12] ) ) ;
INVX1_LVT U2 ( .A ( A[0] ) , .Y ( SUM[0] ) ) ;
endmodule


module PEtotal ( clock , R , S1 , S2 , S1S2mux , newDist , Accumulate ) ;
input  clock ;
input  [7:0] R ;
input  [7:0] S1 ;
input  [7:0] S2 ;
input  [15:0] S1S2mux ;
input  [15:0] newDist ;
output [127:0] Accumulate ;

wire [7:0] Rpipe0 ;
wire [7:0] Rpipe1 ;
wire [7:0] Rpipe2 ;
wire [7:0] Rpipe3 ;
wire [7:0] Rpipe4 ;
wire [7:0] Rpipe5 ;
wire [7:0] Rpipe6 ;
wire [7:0] Rpipe7 ;
wire [7:0] Rpipe8 ;
wire [7:0] Rpipe9 ;
wire [7:0] Rpipe10 ;
wire [7:0] Rpipe11 ;
wire [7:0] Rpipe12 ;
wire [7:0] Rpipe13 ;
wire [7:0] Rpipe14 ;

PE_0 pe0 ( .clock ( clock ) , .R ( R ) , .S1 ( S1 ) , .S2 ( S2 ) , 
    .S1S2mux ( S1S2mux[0] ) , .newDist ( newDist[0] ) , 
    .Accumulate ( Accumulate[7:0] ) , .Rpipe ( Rpipe0 ) ) ;
PE_14 pe1 ( .clock ( clock ) , .R ( Rpipe0 ) , .S1 ( S1 ) , .S2 ( S2 ) , 
    .S1S2mux ( S1S2mux[1] ) , .newDist ( newDist[1] ) , 
    .Accumulate ( Accumulate[15:8] ) , .Rpipe ( Rpipe1 ) ) ;
PE_13 pe2 ( .clock ( clock ) , .R ( Rpipe1 ) , .S1 ( S1 ) , .S2 ( S2 ) , 
    .S1S2mux ( S1S2mux[2] ) , .newDist ( newDist[2] ) , 
    .Accumulate ( Accumulate[23:16] ) , .Rpipe ( Rpipe2 ) ) ;
PE_12 pe3 ( .clock ( clock ) , .R ( Rpipe2 ) , .S1 ( S1 ) , .S2 ( S2 ) , 
    .S1S2mux ( S1S2mux[3] ) , .newDist ( newDist[3] ) , 
    .Accumulate ( Accumulate[31:24] ) , .Rpipe ( Rpipe3 ) ) ;
PE_11 pe4 ( .clock ( clock ) , .R ( Rpipe3 ) , .S1 ( S1 ) , .S2 ( S2 ) , 
    .S1S2mux ( S1S2mux[4] ) , .newDist ( newDist[4] ) , 
    .Accumulate ( Accumulate[39:32] ) , .Rpipe ( Rpipe4 ) ) ;
PE_10 pe5 ( .clock ( clock ) , .R ( Rpipe4 ) , .S1 ( S1 ) , .S2 ( S2 ) , 
    .S1S2mux ( S1S2mux[5] ) , .newDist ( newDist[5] ) , 
    .Accumulate ( Accumulate[47:40] ) , .Rpipe ( Rpipe5 ) ) ;
PE_9 pe6 ( .clock ( clock ) , .R ( Rpipe5 ) , .S1 ( S1 ) , .S2 ( S2 ) , 
    .S1S2mux ( S1S2mux[6] ) , .newDist ( newDist[6] ) , 
    .Accumulate ( Accumulate[55:48] ) , .Rpipe ( Rpipe6 ) ) ;
PE_8 pe7 ( .clock ( clock ) , .R ( Rpipe6 ) , .S1 ( S1 ) , .S2 ( S2 ) , 
    .S1S2mux ( S1S2mux[7] ) , .newDist ( newDist[7] ) , 
    .Accumulate ( Accumulate[63:56] ) , .Rpipe ( Rpipe7 ) ) ;
PE_7 pe8 ( .clock ( clock ) , .R ( Rpipe7 ) , .S1 ( S1 ) , .S2 ( S2 ) , 
    .S1S2mux ( S1S2mux[8] ) , .newDist ( newDist[8] ) , 
    .Accumulate ( Accumulate[71:64] ) , .Rpipe ( Rpipe8 ) ) ;
PE_6 pe9 ( .clock ( clock ) , .R ( Rpipe8 ) , .S1 ( S1 ) , .S2 ( S2 ) , 
    .S1S2mux ( S1S2mux[9] ) , .newDist ( newDist[9] ) , 
    .Accumulate ( Accumulate[79:72] ) , .Rpipe ( Rpipe9 ) ) ;
PE_5 pe10 ( .clock ( clock ) , .R ( Rpipe9 ) , .S1 ( S1 ) , .S2 ( S2 ) , 
    .S1S2mux ( S1S2mux[10] ) , .newDist ( newDist[10] ) , 
    .Accumulate ( Accumulate[87:80] ) , .Rpipe ( Rpipe10 ) ) ;
PE_4 pe11 ( .clock ( clock ) , .R ( Rpipe10 ) , .S1 ( S1 ) , .S2 ( S2 ) , 
    .S1S2mux ( S1S2mux[11] ) , .newDist ( newDist[11] ) , 
    .Accumulate ( Accumulate[95:88] ) , .Rpipe ( Rpipe11 ) ) ;
PE_3 pe12 ( .clock ( clock ) , .R ( Rpipe11 ) , .S1 ( S1 ) , .S2 ( S2 ) , 
    .S1S2mux ( S1S2mux[12] ) , .newDist ( newDist[12] ) , 
    .Accumulate ( Accumulate[103:96] ) , .Rpipe ( Rpipe12 ) ) ;
PE_2 pe13 ( .clock ( clock ) , .R ( Rpipe12 ) , .S1 ( S1 ) , .S2 ( S2 ) , 
    .S1S2mux ( S1S2mux[13] ) , .newDist ( newDist[13] ) , 
    .Accumulate ( Accumulate[111:104] ) , .Rpipe ( Rpipe13 ) ) ;
PE_1 pe14 ( .clock ( clock ) , .R ( Rpipe13 ) , .S1 ( S1 ) , .S2 ( S2 ) , 
    .S1S2mux ( S1S2mux[14] ) , .newDist ( newDist[14] ) , 
    .Accumulate ( Accumulate[119:112] ) , .Rpipe ( Rpipe14 ) ) ;
PEend pe15 ( .clock ( clock ) , .R ( Rpipe14 ) , .S1 ( S1 ) , .S2 ( S2 ) , 
    .S1S2mux ( S1S2mux[15] ) , .newDist ( newDist[15] ) , 
    .Accumulate ( Accumulate[127:120] ) ) ;
endmodule


module PE_0 ( clock , R , S1 , S2 , S1S2mux , newDist , Accumulate , Rpipe ) ;
input  clock ;
input  [7:0] R ;
input  [7:0] S1 ;
input  [7:0] S2 ;
input  S1S2mux ;
input  newDist ;
output [7:0] Accumulate ;
output [7:0] Rpipe ;

wire [7:0] AccumulateIn ;
wire [7:0] difference ;

PE_0_DW01_add_0 add_56 (
    .A ( { 1'b0 , Accumulate[7] , Accumulate[6] , Accumulate[5] , 
        Accumulate[4] , Accumulate[3] , Accumulate[2] , Accumulate[1] , 
        Accumulate[0] } ) ,
    .B ( { 1'b0 , difference[7] , difference[6] , difference[5] , 
        difference[4] , difference[3] , difference[2] , difference[1] , 
        difference[0] } ) ,
    .CI ( 1'b0 ) ,
    .SUM ( { Carry , N33 , N32 , N31 , N30 , N29 , N28 , N27 , N26 } ) ) ;
PE_0_DW01_sub_1 sub_50 ( .A ( R ) ,
    .B ( { N15 , N14 , N13 , N12 , N11 , N10 , N9 , N8 } ) ,
    .CI ( 1'b0 ) , .DIFF ( difference ) ) ;
DFFX1_LVT \Accumulate_reg[0] ( .D ( AccumulateIn[0] ) , .CLK ( clock ) , 
    .Q ( Accumulate[0] ) ) ;
DFFX1_LVT \Rpipe_reg[7] ( .D ( R[7] ) , .CLK ( clock ) , .Q ( Rpipe[7] ) ) ;
DFFX1_LVT \Rpipe_reg[6] ( .D ( R[6] ) , .CLK ( clock ) , .Q ( Rpipe[6] ) ) ;
DFFX1_LVT \Rpipe_reg[5] ( .D ( R[5] ) , .CLK ( clock ) , .Q ( Rpipe[5] ) ) ;
DFFX1_LVT \Rpipe_reg[4] ( .D ( R[4] ) , .CLK ( clock ) , .Q ( Rpipe[4] ) ) ;
DFFX1_LVT \Rpipe_reg[3] ( .D ( R[3] ) , .CLK ( clock ) , .Q ( Rpipe[3] ) ) ;
DFFX1_LVT \Rpipe_reg[2] ( .D ( R[2] ) , .CLK ( clock ) , .Q ( Rpipe[2] ) ) ;
DFFX1_LVT \Rpipe_reg[1] ( .D ( R[1] ) , .CLK ( clock ) , .Q ( Rpipe[1] ) ) ;
DFFX1_LVT \Accumulate_reg[7] ( .D ( AccumulateIn[7] ) , .CLK ( clock ) , 
    .Q ( Accumulate[7] ) ) ;
DFFX1_LVT \Accumulate_reg[6] ( .D ( AccumulateIn[6] ) , .CLK ( clock ) , 
    .Q ( Accumulate[6] ) ) ;
DFFX1_LVT \Accumulate_reg[5] ( .D ( AccumulateIn[5] ) , .CLK ( clock ) , 
    .Q ( Accumulate[5] ) ) ;
DFFX1_LVT \Accumulate_reg[4] ( .D ( AccumulateIn[4] ) , .CLK ( clock ) , 
    .Q ( Accumulate[4] ) ) ;
DFFX1_LVT \Accumulate_reg[3] ( .D ( AccumulateIn[3] ) , .CLK ( clock ) , 
    .Q ( Accumulate[3] ) ) ;
DFFX1_LVT \Accumulate_reg[2] ( .D ( AccumulateIn[2] ) , .CLK ( clock ) , 
    .Q ( Accumulate[2] ) ) ;
DFFX1_LVT \Accumulate_reg[1] ( .D ( AccumulateIn[1] ) , .CLK ( clock ) , 
    .Q ( Accumulate[1] ) ) ;
DFFX1_LVT \Rpipe_reg[0] ( .D ( R[0] ) , .CLK ( clock ) , .Q ( Rpipe[0] ) ) ;
INVX1_LVT U5 ( .A ( newDist ) , .Y ( n1 ) ) ;
INVX1_LVT U6 ( .A ( S1S2mux ) , .Y ( n4 ) ) ;
AO221X1_LVT U7 ( .A1 ( N27 ) , .A2 ( n1 ) , .A3 ( difference[1] ) , 
    .A4 ( newDist ) , .A5 ( n15 ) , .Y ( AccumulateIn[1] ) ) ;
AO221X1_LVT U8 ( .A1 ( N28 ) , .A2 ( n1 ) , .A3 ( difference[2] ) , 
    .A4 ( newDist ) , .A5 ( n15 ) , .Y ( AccumulateIn[2] ) ) ;
AO221X1_LVT U9 ( .A1 ( N29 ) , .A2 ( n1 ) , .A3 ( difference[3] ) , 
    .A4 ( newDist ) , .A5 ( n15 ) , .Y ( AccumulateIn[3] ) ) ;
AO221X1_LVT U10 ( .A1 ( N30 ) , .A2 ( n1 ) , .A3 ( difference[4] ) , 
    .A4 ( newDist ) , .A5 ( n15 ) , .Y ( AccumulateIn[4] ) ) ;
AO221X1_LVT U11 ( .A1 ( N31 ) , .A2 ( n1 ) , .A3 ( difference[5] ) , 
    .A4 ( newDist ) , .A5 ( n15 ) , .Y ( AccumulateIn[5] ) ) ;
AO221X1_LVT U12 ( .A1 ( N32 ) , .A2 ( n1 ) , .A3 ( difference[6] ) , 
    .A4 ( newDist ) , .A5 ( n15 ) , .Y ( AccumulateIn[6] ) ) ;
AO221X1_LVT U13 ( .A1 ( N33 ) , .A2 ( n1 ) , .A3 ( newDist ) , 
    .A4 ( difference[7] ) , .A5 ( n15 ) , .Y ( AccumulateIn[7] ) ) ;
AND2X1_LVT U14 ( .A1 ( Carry ) , .A2 ( n1 ) , .Y ( n15 ) ) ;
AO22X1_LVT U15 ( .A1 ( S1[0] ) , .A2 ( S1S2mux ) , .A3 ( S2[0] ) , 
    .A4 ( n4 ) , .Y ( N8 ) ) ;
AO22X1_LVT U16 ( .A1 ( S1[1] ) , .A2 ( S1S2mux ) , .A3 ( S2[1] ) , 
    .A4 ( n4 ) , .Y ( N9 ) ) ;
AO22X1_LVT U17 ( .A1 ( S1[2] ) , .A2 ( S1S2mux ) , .A3 ( S2[2] ) , 
    .A4 ( n4 ) , .Y ( N10 ) ) ;
AO22X1_LVT U18 ( .A1 ( S1[3] ) , .A2 ( S1S2mux ) , .A3 ( S2[3] ) , 
    .A4 ( n4 ) , .Y ( N11 ) ) ;
AO22X1_LVT U19 ( .A1 ( S1[4] ) , .A2 ( S1S2mux ) , .A3 ( S2[4] ) , 
    .A4 ( n4 ) , .Y ( N12 ) ) ;
AO22X1_LVT U20 ( .A1 ( S1[5] ) , .A2 ( S1S2mux ) , .A3 ( S2[5] ) , 
    .A4 ( n4 ) , .Y ( N13 ) ) ;
AO22X1_LVT U21 ( .A1 ( S1[6] ) , .A2 ( S1S2mux ) , .A3 ( S2[6] ) , 
    .A4 ( n4 ) , .Y ( N14 ) ) ;
AO22X1_LVT U22 ( .A1 ( S1[7] ) , .A2 ( S1S2mux ) , .A3 ( S2[7] ) , 
    .A4 ( n4 ) , .Y ( N15 ) ) ;
AO221X1_LVT U23 ( .A1 ( N26 ) , .A2 ( n1 ) , .A3 ( difference[0] ) , 
    .A4 ( newDist ) , .A5 ( n15 ) , .Y ( AccumulateIn[0] ) ) ;
endmodule


module PE_0_DW01_add_0 ( A , B , CI , SUM , CO ) ;
input  [8:0] A ;
input  [8:0] B ;
input  CI ;
output [8:0] SUM ;
output CO ;

wire [8:1] carry ;

FADDX1_LVT U1_3 ( .A ( A[3] ) , .B ( B[3] ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( SUM[3] ) ) ;
FADDX1_LVT U1_2 ( .A ( A[2] ) , .B ( B[2] ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( SUM[2] ) ) ;
FADDX1_LVT U1_1 ( .A ( A[1] ) , .B ( B[1] ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( SUM[1] ) ) ;
FADDX1_LVT U1_7 ( .A ( A[7] ) , .B ( B[7] ) , .CI ( carry[7] ) , 
    .CO ( SUM[8] ) , .S ( SUM[7] ) ) ;
FADDX1_LVT U1_6 ( .A ( A[6] ) , .B ( B[6] ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( SUM[6] ) ) ;
FADDX1_LVT U1_5 ( .A ( A[5] ) , .B ( B[5] ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( SUM[5] ) ) ;
FADDX1_LVT U1_4 ( .A ( A[4] ) , .B ( B[4] ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( SUM[4] ) ) ;
XOR2X1_LVT U1 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( SUM[0] ) ) ;
AND2X1_LVT U2 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( carry[1] ) ) ;
endmodule


module PE_0_DW01_sub_1 ( A , B , CI , DIFF , CO ) ;
input  [7:0] A ;
input  [7:0] B ;
input  CI ;
output [7:0] DIFF ;
output CO ;

wire [8:0] carry ;

FADDX1_LVT U2_7 ( .A ( A[7] ) , .B ( n3 ) , .CI ( carry[7] ) , 
    .S ( DIFF[7] ) ) ;
FADDX1_LVT U2_6 ( .A ( A[6] ) , .B ( n4 ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( DIFF[6] ) ) ;
FADDX1_LVT U2_5 ( .A ( A[5] ) , .B ( n5 ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( DIFF[5] ) ) ;
FADDX1_LVT U2_4 ( .A ( A[4] ) , .B ( n6 ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( DIFF[4] ) ) ;
FADDX1_LVT U2_3 ( .A ( A[3] ) , .B ( n7 ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( DIFF[3] ) ) ;
FADDX1_LVT U2_2 ( .A ( A[2] ) , .B ( n8 ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( DIFF[2] ) ) ;
FADDX1_LVT U2_1 ( .A ( A[1] ) , .B ( n1 ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( DIFF[1] ) ) ;
INVX1_LVT U1 ( .A ( B[0] ) , .Y ( n2 ) ) ;
INVX1_LVT U2 ( .A ( B[1] ) , .Y ( n1 ) ) ;
OR2X1_LVT U3 ( .A1 ( n2 ) , .A2 ( A[0] ) , .Y ( carry[1] ) ) ;
INVX1_LVT U4 ( .A ( B[2] ) , .Y ( n8 ) ) ;
INVX1_LVT U5 ( .A ( B[3] ) , .Y ( n7 ) ) ;
INVX1_LVT U6 ( .A ( B[4] ) , .Y ( n6 ) ) ;
INVX1_LVT U7 ( .A ( B[5] ) , .Y ( n5 ) ) ;
INVX1_LVT U8 ( .A ( B[6] ) , .Y ( n4 ) ) ;
INVX1_LVT U9 ( .A ( B[7] ) , .Y ( n3 ) ) ;
XNOR2X1_LVT U10 ( .A1 ( A[0] ) , .A2 ( n2 ) , .Y ( DIFF[0] ) ) ;
endmodule


module PE_14 ( clock , R , S1 , S2 , S1S2mux , newDist , Accumulate , Rpipe ) ;
input  clock ;
input  [7:0] R ;
input  [7:0] S1 ;
input  [7:0] S2 ;
input  S1S2mux ;
input  newDist ;
output [7:0] Accumulate ;
output [7:0] Rpipe ;

wire [7:0] AccumulateIn ;
wire [7:0] difference ;

PE_14_DW01_add_0 add_56 (
    .A ( { 1'b0 , Accumulate[7] , Accumulate[6] , Accumulate[5] , 
        Accumulate[4] , Accumulate[3] , Accumulate[2] , Accumulate[1] , 
        Accumulate[0] } ) ,
    .B ( { 1'b0 , difference[7] , difference[6] , difference[5] , 
        difference[4] , difference[3] , difference[2] , difference[1] , 
        difference[0] } ) ,
    .CI ( 1'b0 ) ,
    .SUM ( { Carry , N33 , N32 , N31 , N30 , N29 , N28 , N27 , N26 } ) ) ;
PE_14_DW01_sub_1 sub_50 ( .A ( R ) ,
    .B ( { N15 , N14 , N13 , N12 , N11 , N10 , N9 , N8 } ) ,
    .CI ( 1'b0 ) , .DIFF ( difference ) ) ;
DFFX1_LVT \Accumulate_reg[0] ( .D ( AccumulateIn[0] ) , .CLK ( clock ) , 
    .Q ( Accumulate[0] ) ) ;
DFFX1_LVT \Rpipe_reg[7] ( .D ( R[7] ) , .CLK ( clock ) , .Q ( Rpipe[7] ) ) ;
DFFX1_LVT \Rpipe_reg[6] ( .D ( R[6] ) , .CLK ( clock ) , .Q ( Rpipe[6] ) ) ;
DFFX1_LVT \Rpipe_reg[5] ( .D ( R[5] ) , .CLK ( clock ) , .Q ( Rpipe[5] ) ) ;
DFFX1_LVT \Rpipe_reg[4] ( .D ( R[4] ) , .CLK ( clock ) , .Q ( Rpipe[4] ) ) ;
DFFX1_LVT \Rpipe_reg[3] ( .D ( R[3] ) , .CLK ( clock ) , .Q ( Rpipe[3] ) ) ;
DFFX1_LVT \Rpipe_reg[2] ( .D ( R[2] ) , .CLK ( clock ) , .Q ( Rpipe[2] ) ) ;
DFFX1_LVT \Rpipe_reg[1] ( .D ( R[1] ) , .CLK ( clock ) , .Q ( Rpipe[1] ) ) ;
DFFX1_LVT \Accumulate_reg[7] ( .D ( AccumulateIn[7] ) , .CLK ( clock ) , 
    .Q ( Accumulate[7] ) ) ;
DFFX1_LVT \Accumulate_reg[6] ( .D ( AccumulateIn[6] ) , .CLK ( clock ) , 
    .Q ( Accumulate[6] ) ) ;
DFFX1_LVT \Accumulate_reg[5] ( .D ( AccumulateIn[5] ) , .CLK ( clock ) , 
    .Q ( Accumulate[5] ) ) ;
DFFX1_LVT \Accumulate_reg[4] ( .D ( AccumulateIn[4] ) , .CLK ( clock ) , 
    .Q ( Accumulate[4] ) ) ;
DFFX1_LVT \Accumulate_reg[3] ( .D ( AccumulateIn[3] ) , .CLK ( clock ) , 
    .Q ( Accumulate[3] ) ) ;
DFFX1_LVT \Accumulate_reg[2] ( .D ( AccumulateIn[2] ) , .CLK ( clock ) , 
    .Q ( Accumulate[2] ) ) ;
DFFX1_LVT \Accumulate_reg[1] ( .D ( AccumulateIn[1] ) , .CLK ( clock ) , 
    .Q ( Accumulate[1] ) ) ;
DFFX1_LVT \Rpipe_reg[0] ( .D ( R[0] ) , .CLK ( clock ) , .Q ( Rpipe[0] ) ) ;
INVX1_LVT U5 ( .A ( newDist ) , .Y ( n8 ) ) ;
INVX1_LVT U6 ( .A ( S1S2mux ) , .Y ( n9 ) ) ;
AO221X1_LVT U7 ( .A1 ( N27 ) , .A2 ( n8 ) , .A3 ( difference[1] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[1] ) ) ;
AO221X1_LVT U8 ( .A1 ( N28 ) , .A2 ( n8 ) , .A3 ( difference[2] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[2] ) ) ;
AO221X1_LVT U9 ( .A1 ( N29 ) , .A2 ( n8 ) , .A3 ( difference[3] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[3] ) ) ;
AO221X1_LVT U10 ( .A1 ( N30 ) , .A2 ( n8 ) , .A3 ( difference[4] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[4] ) ) ;
AO221X1_LVT U11 ( .A1 ( N31 ) , .A2 ( n8 ) , .A3 ( difference[5] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[5] ) ) ;
AO221X1_LVT U12 ( .A1 ( N32 ) , .A2 ( n8 ) , .A3 ( difference[6] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[6] ) ) ;
AO221X1_LVT U13 ( .A1 ( N33 ) , .A2 ( n8 ) , .A3 ( newDist ) , 
    .A4 ( difference[7] ) , .A5 ( n23 ) , .Y ( AccumulateIn[7] ) ) ;
AND2X1_LVT U14 ( .A1 ( Carry ) , .A2 ( n8 ) , .Y ( n23 ) ) ;
AO22X1_LVT U15 ( .A1 ( S1[0] ) , .A2 ( S1S2mux ) , .A3 ( S2[0] ) , 
    .A4 ( n9 ) , .Y ( N8 ) ) ;
AO22X1_LVT U16 ( .A1 ( S1[1] ) , .A2 ( S1S2mux ) , .A3 ( S2[1] ) , 
    .A4 ( n9 ) , .Y ( N9 ) ) ;
AO22X1_LVT U17 ( .A1 ( S1[2] ) , .A2 ( S1S2mux ) , .A3 ( S2[2] ) , 
    .A4 ( n9 ) , .Y ( N10 ) ) ;
AO22X1_LVT U18 ( .A1 ( S1[3] ) , .A2 ( S1S2mux ) , .A3 ( S2[3] ) , 
    .A4 ( n9 ) , .Y ( N11 ) ) ;
AO22X1_LVT U19 ( .A1 ( S1[4] ) , .A2 ( S1S2mux ) , .A3 ( S2[4] ) , 
    .A4 ( n9 ) , .Y ( N12 ) ) ;
AO22X1_LVT U20 ( .A1 ( S1[5] ) , .A2 ( S1S2mux ) , .A3 ( S2[5] ) , 
    .A4 ( n9 ) , .Y ( N13 ) ) ;
AO22X1_LVT U21 ( .A1 ( S1[6] ) , .A2 ( S1S2mux ) , .A3 ( S2[6] ) , 
    .A4 ( n9 ) , .Y ( N14 ) ) ;
AO22X1_LVT U22 ( .A1 ( S1[7] ) , .A2 ( S1S2mux ) , .A3 ( S2[7] ) , 
    .A4 ( n9 ) , .Y ( N15 ) ) ;
AO221X1_LVT U23 ( .A1 ( N26 ) , .A2 ( n8 ) , .A3 ( difference[0] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[0] ) ) ;
endmodule


module PE_14_DW01_add_0 ( A , B , CI , SUM , CO ) ;
input  [8:0] A ;
input  [8:0] B ;
input  CI ;
output [8:0] SUM ;
output CO ;

wire [8:1] carry ;

FADDX1_LVT U1_5 ( .A ( A[5] ) , .B ( B[5] ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( SUM[5] ) ) ;
FADDX1_LVT U1_4 ( .A ( A[4] ) , .B ( B[4] ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( SUM[4] ) ) ;
FADDX1_LVT U1_3 ( .A ( A[3] ) , .B ( B[3] ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( SUM[3] ) ) ;
FADDX1_LVT U1_2 ( .A ( A[2] ) , .B ( B[2] ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( SUM[2] ) ) ;
FADDX1_LVT U1_1 ( .A ( A[1] ) , .B ( B[1] ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( SUM[1] ) ) ;
FADDX1_LVT U1_7 ( .A ( A[7] ) , .B ( B[7] ) , .CI ( carry[7] ) , 
    .CO ( SUM[8] ) , .S ( SUM[7] ) ) ;
FADDX1_LVT U1_6 ( .A ( A[6] ) , .B ( B[6] ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( SUM[6] ) ) ;
XOR2X1_LVT U1 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( SUM[0] ) ) ;
AND2X1_LVT U2 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( carry[1] ) ) ;
endmodule


module PE_14_DW01_sub_1 ( A , B , CI , DIFF , CO ) ;
input  [7:0] A ;
input  [7:0] B ;
input  CI ;
output [7:0] DIFF ;
output CO ;

wire [8:0] carry ;

FADDX1_LVT U2_7 ( .A ( A[7] ) , .B ( n3 ) , .CI ( carry[7] ) , 
    .S ( DIFF[7] ) ) ;
FADDX1_LVT U2_6 ( .A ( A[6] ) , .B ( n4 ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( DIFF[6] ) ) ;
FADDX1_LVT U2_5 ( .A ( A[5] ) , .B ( n5 ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( DIFF[5] ) ) ;
FADDX1_LVT U2_4 ( .A ( A[4] ) , .B ( n6 ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( DIFF[4] ) ) ;
FADDX1_LVT U2_3 ( .A ( A[3] ) , .B ( n7 ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( DIFF[3] ) ) ;
FADDX1_LVT U2_2 ( .A ( A[2] ) , .B ( n8 ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( DIFF[2] ) ) ;
FADDX1_LVT U2_1 ( .A ( A[1] ) , .B ( n1 ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( DIFF[1] ) ) ;
INVX1_LVT U1 ( .A ( B[0] ) , .Y ( n2 ) ) ;
INVX1_LVT U2 ( .A ( B[1] ) , .Y ( n1 ) ) ;
OR2X1_LVT U3 ( .A1 ( n2 ) , .A2 ( A[0] ) , .Y ( carry[1] ) ) ;
INVX1_LVT U4 ( .A ( B[2] ) , .Y ( n8 ) ) ;
INVX1_LVT U5 ( .A ( B[3] ) , .Y ( n7 ) ) ;
INVX1_LVT U6 ( .A ( B[4] ) , .Y ( n6 ) ) ;
INVX1_LVT U7 ( .A ( B[5] ) , .Y ( n5 ) ) ;
INVX1_LVT U8 ( .A ( B[6] ) , .Y ( n4 ) ) ;
INVX1_LVT U9 ( .A ( B[7] ) , .Y ( n3 ) ) ;
XNOR2X1_LVT U10 ( .A1 ( A[0] ) , .A2 ( n2 ) , .Y ( DIFF[0] ) ) ;
endmodule


module PE_13 ( clock , R , S1 , S2 , S1S2mux , newDist , Accumulate , Rpipe ) ;
input  clock ;
input  [7:0] R ;
input  [7:0] S1 ;
input  [7:0] S2 ;
input  S1S2mux ;
input  newDist ;
output [7:0] Accumulate ;
output [7:0] Rpipe ;

wire [7:0] AccumulateIn ;
wire [7:0] difference ;

PE_13_DW01_add_0 add_56 (
    .A ( { 1'b0 , Accumulate[7] , Accumulate[6] , Accumulate[5] , 
        Accumulate[4] , Accumulate[3] , Accumulate[2] , Accumulate[1] , 
        Accumulate[0] } ) ,
    .B ( { 1'b0 , difference[7] , difference[6] , difference[5] , 
        difference[4] , difference[3] , difference[2] , difference[1] , 
        difference[0] } ) ,
    .CI ( 1'b0 ) ,
    .SUM ( { Carry , N33 , N32 , N31 , N30 , N29 , N28 , N27 , N26 } ) ) ;
PE_13_DW01_sub_1 sub_50 ( .A ( R ) ,
    .B ( { N15 , N14 , N13 , N12 , N11 , N10 , N9 , N8 } ) ,
    .CI ( 1'b0 ) , .DIFF ( difference ) ) ;
DFFX1_LVT \Accumulate_reg[0] ( .D ( AccumulateIn[0] ) , .CLK ( clock ) , 
    .Q ( Accumulate[0] ) ) ;
DFFX1_LVT \Accumulate_reg[7] ( .D ( AccumulateIn[7] ) , .CLK ( clock ) , 
    .Q ( Accumulate[7] ) ) ;
DFFX1_LVT \Accumulate_reg[6] ( .D ( AccumulateIn[6] ) , .CLK ( clock ) , 
    .Q ( Accumulate[6] ) ) ;
DFFX1_LVT \Accumulate_reg[5] ( .D ( AccumulateIn[5] ) , .CLK ( clock ) , 
    .Q ( Accumulate[5] ) ) ;
DFFX1_LVT \Accumulate_reg[4] ( .D ( AccumulateIn[4] ) , .CLK ( clock ) , 
    .Q ( Accumulate[4] ) ) ;
DFFX1_LVT \Accumulate_reg[3] ( .D ( AccumulateIn[3] ) , .CLK ( clock ) , 
    .Q ( Accumulate[3] ) ) ;
DFFX1_LVT \Accumulate_reg[2] ( .D ( AccumulateIn[2] ) , .CLK ( clock ) , 
    .Q ( Accumulate[2] ) ) ;
DFFX1_LVT \Accumulate_reg[1] ( .D ( AccumulateIn[1] ) , .CLK ( clock ) , 
    .Q ( Accumulate[1] ) ) ;
DFFX1_LVT \Rpipe_reg[7] ( .D ( R[7] ) , .CLK ( clock ) , .Q ( Rpipe[7] ) ) ;
DFFX1_LVT \Rpipe_reg[6] ( .D ( R[6] ) , .CLK ( clock ) , .Q ( Rpipe[6] ) ) ;
DFFX1_LVT \Rpipe_reg[5] ( .D ( R[5] ) , .CLK ( clock ) , .Q ( Rpipe[5] ) ) ;
DFFX1_LVT \Rpipe_reg[4] ( .D ( R[4] ) , .CLK ( clock ) , .Q ( Rpipe[4] ) ) ;
DFFX1_LVT \Rpipe_reg[3] ( .D ( R[3] ) , .CLK ( clock ) , .Q ( Rpipe[3] ) ) ;
DFFX1_LVT \Rpipe_reg[2] ( .D ( R[2] ) , .CLK ( clock ) , .Q ( Rpipe[2] ) ) ;
DFFX1_LVT \Rpipe_reg[1] ( .D ( R[1] ) , .CLK ( clock ) , .Q ( Rpipe[1] ) ) ;
DFFX1_LVT \Rpipe_reg[0] ( .D ( R[0] ) , .CLK ( clock ) , .Q ( Rpipe[0] ) ) ;
INVX1_LVT U5 ( .A ( S1S2mux ) , .Y ( n9 ) ) ;
INVX1_LVT U6 ( .A ( newDist ) , .Y ( n8 ) ) ;
AO221X1_LVT U7 ( .A1 ( N27 ) , .A2 ( n8 ) , .A3 ( difference[1] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[1] ) ) ;
AO221X1_LVT U8 ( .A1 ( N28 ) , .A2 ( n8 ) , .A3 ( difference[2] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[2] ) ) ;
AO221X1_LVT U9 ( .A1 ( N29 ) , .A2 ( n8 ) , .A3 ( difference[3] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[3] ) ) ;
AO221X1_LVT U10 ( .A1 ( N30 ) , .A2 ( n8 ) , .A3 ( difference[4] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[4] ) ) ;
AO221X1_LVT U11 ( .A1 ( N31 ) , .A2 ( n8 ) , .A3 ( difference[5] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[5] ) ) ;
AO221X1_LVT U12 ( .A1 ( N32 ) , .A2 ( n8 ) , .A3 ( difference[6] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[6] ) ) ;
AO221X1_LVT U13 ( .A1 ( N33 ) , .A2 ( n8 ) , .A3 ( newDist ) , 
    .A4 ( difference[7] ) , .A5 ( n23 ) , .Y ( AccumulateIn[7] ) ) ;
AND2X1_LVT U14 ( .A1 ( Carry ) , .A2 ( n8 ) , .Y ( n23 ) ) ;
AO22X1_LVT U15 ( .A1 ( S1[0] ) , .A2 ( S1S2mux ) , .A3 ( S2[0] ) , 
    .A4 ( n9 ) , .Y ( N8 ) ) ;
AO22X1_LVT U16 ( .A1 ( S1[1] ) , .A2 ( S1S2mux ) , .A3 ( S2[1] ) , 
    .A4 ( n9 ) , .Y ( N9 ) ) ;
AO22X1_LVT U17 ( .A1 ( S1[2] ) , .A2 ( S1S2mux ) , .A3 ( S2[2] ) , 
    .A4 ( n9 ) , .Y ( N10 ) ) ;
AO22X1_LVT U18 ( .A1 ( S1[3] ) , .A2 ( S1S2mux ) , .A3 ( S2[3] ) , 
    .A4 ( n9 ) , .Y ( N11 ) ) ;
AO22X1_LVT U19 ( .A1 ( S1[4] ) , .A2 ( S1S2mux ) , .A3 ( S2[4] ) , 
    .A4 ( n9 ) , .Y ( N12 ) ) ;
AO22X1_LVT U20 ( .A1 ( S1[5] ) , .A2 ( S1S2mux ) , .A3 ( S2[5] ) , 
    .A4 ( n9 ) , .Y ( N13 ) ) ;
AO22X1_LVT U21 ( .A1 ( S1[6] ) , .A2 ( S1S2mux ) , .A3 ( S2[6] ) , 
    .A4 ( n9 ) , .Y ( N14 ) ) ;
AO22X1_LVT U22 ( .A1 ( S1[7] ) , .A2 ( S1S2mux ) , .A3 ( S2[7] ) , 
    .A4 ( n9 ) , .Y ( N15 ) ) ;
AO221X1_LVT U23 ( .A1 ( N26 ) , .A2 ( n8 ) , .A3 ( difference[0] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[0] ) ) ;
endmodule


module PE_13_DW01_add_0 ( A , B , CI , SUM , CO ) ;
input  [8:0] A ;
input  [8:0] B ;
input  CI ;
output [8:0] SUM ;
output CO ;

wire [8:1] carry ;

FADDX1_LVT U1_4 ( .A ( A[4] ) , .B ( B[4] ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( SUM[4] ) ) ;
FADDX1_LVT U1_3 ( .A ( A[3] ) , .B ( B[3] ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( SUM[3] ) ) ;
FADDX1_LVT U1_2 ( .A ( A[2] ) , .B ( B[2] ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( SUM[2] ) ) ;
FADDX1_LVT U1_1 ( .A ( A[1] ) , .B ( B[1] ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( SUM[1] ) ) ;
FADDX1_LVT U1_7 ( .A ( A[7] ) , .B ( B[7] ) , .CI ( carry[7] ) , 
    .CO ( SUM[8] ) , .S ( SUM[7] ) ) ;
FADDX1_LVT U1_6 ( .A ( A[6] ) , .B ( B[6] ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( SUM[6] ) ) ;
FADDX1_LVT U1_5 ( .A ( A[5] ) , .B ( B[5] ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( SUM[5] ) ) ;
XOR2X1_LVT U1 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( SUM[0] ) ) ;
AND2X1_LVT U2 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( carry[1] ) ) ;
endmodule


module PE_13_DW01_sub_1 ( A , B , CI , DIFF , CO ) ;
input  [7:0] A ;
input  [7:0] B ;
input  CI ;
output [7:0] DIFF ;
output CO ;

wire [8:0] carry ;

FADDX1_LVT U2_7 ( .A ( A[7] ) , .B ( n3 ) , .CI ( carry[7] ) , 
    .S ( DIFF[7] ) ) ;
FADDX1_LVT U2_6 ( .A ( A[6] ) , .B ( n4 ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( DIFF[6] ) ) ;
FADDX1_LVT U2_5 ( .A ( A[5] ) , .B ( n5 ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( DIFF[5] ) ) ;
FADDX1_LVT U2_4 ( .A ( A[4] ) , .B ( n6 ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( DIFF[4] ) ) ;
FADDX1_LVT U2_3 ( .A ( A[3] ) , .B ( n7 ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( DIFF[3] ) ) ;
FADDX1_LVT U2_2 ( .A ( A[2] ) , .B ( n8 ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( DIFF[2] ) ) ;
FADDX1_LVT U2_1 ( .A ( A[1] ) , .B ( n1 ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( DIFF[1] ) ) ;
INVX1_LVT U1 ( .A ( B[0] ) , .Y ( n2 ) ) ;
INVX1_LVT U2 ( .A ( B[1] ) , .Y ( n1 ) ) ;
OR2X1_LVT U3 ( .A1 ( n2 ) , .A2 ( A[0] ) , .Y ( carry[1] ) ) ;
INVX1_LVT U4 ( .A ( B[2] ) , .Y ( n8 ) ) ;
INVX1_LVT U5 ( .A ( B[3] ) , .Y ( n7 ) ) ;
INVX1_LVT U6 ( .A ( B[4] ) , .Y ( n6 ) ) ;
INVX1_LVT U7 ( .A ( B[5] ) , .Y ( n5 ) ) ;
INVX1_LVT U8 ( .A ( B[6] ) , .Y ( n4 ) ) ;
INVX1_LVT U9 ( .A ( B[7] ) , .Y ( n3 ) ) ;
XNOR2X1_LVT U10 ( .A1 ( A[0] ) , .A2 ( n2 ) , .Y ( DIFF[0] ) ) ;
endmodule


module PE_12 ( clock , R , S1 , S2 , S1S2mux , newDist , Accumulate , Rpipe ) ;
input  clock ;
input  [7:0] R ;
input  [7:0] S1 ;
input  [7:0] S2 ;
input  S1S2mux ;
input  newDist ;
output [7:0] Accumulate ;
output [7:0] Rpipe ;

wire [7:0] AccumulateIn ;
wire [7:0] difference ;

PE_12_DW01_add_0 add_56 (
    .A ( { 1'b0 , Accumulate[7] , Accumulate[6] , Accumulate[5] , 
        Accumulate[4] , Accumulate[3] , Accumulate[2] , Accumulate[1] , 
        Accumulate[0] } ) ,
    .B ( { 1'b0 , difference[7] , difference[6] , difference[5] , 
        difference[4] , difference[3] , difference[2] , difference[1] , 
        difference[0] } ) ,
    .CI ( 1'b0 ) ,
    .SUM ( { Carry , N33 , N32 , N31 , N30 , N29 , N28 , N27 , N26 } ) ) ;
PE_12_DW01_sub_1 sub_50 ( .A ( R ) ,
    .B ( { N15 , N14 , N13 , N12 , N11 , N10 , N9 , N8 } ) ,
    .CI ( 1'b0 ) , .DIFF ( difference ) ) ;
DFFX1_LVT \Accumulate_reg[0] ( .D ( AccumulateIn[0] ) , .CLK ( clock ) , 
    .Q ( Accumulate[0] ) ) ;
DFFX1_LVT \Rpipe_reg[7] ( .D ( R[7] ) , .CLK ( clock ) , .Q ( Rpipe[7] ) ) ;
DFFX1_LVT \Rpipe_reg[6] ( .D ( R[6] ) , .CLK ( clock ) , .Q ( Rpipe[6] ) ) ;
DFFX1_LVT \Rpipe_reg[5] ( .D ( R[5] ) , .CLK ( clock ) , .Q ( Rpipe[5] ) ) ;
DFFX1_LVT \Rpipe_reg[4] ( .D ( R[4] ) , .CLK ( clock ) , .Q ( Rpipe[4] ) ) ;
DFFX1_LVT \Rpipe_reg[3] ( .D ( R[3] ) , .CLK ( clock ) , .Q ( Rpipe[3] ) ) ;
DFFX1_LVT \Rpipe_reg[2] ( .D ( R[2] ) , .CLK ( clock ) , .Q ( Rpipe[2] ) ) ;
DFFX1_LVT \Rpipe_reg[1] ( .D ( R[1] ) , .CLK ( clock ) , .Q ( Rpipe[1] ) ) ;
DFFX1_LVT \Accumulate_reg[7] ( .D ( AccumulateIn[7] ) , .CLK ( clock ) , 
    .Q ( Accumulate[7] ) ) ;
DFFX1_LVT \Accumulate_reg[6] ( .D ( AccumulateIn[6] ) , .CLK ( clock ) , 
    .Q ( Accumulate[6] ) ) ;
DFFX1_LVT \Accumulate_reg[5] ( .D ( AccumulateIn[5] ) , .CLK ( clock ) , 
    .Q ( Accumulate[5] ) ) ;
DFFX1_LVT \Accumulate_reg[4] ( .D ( AccumulateIn[4] ) , .CLK ( clock ) , 
    .Q ( Accumulate[4] ) ) ;
DFFX1_LVT \Accumulate_reg[3] ( .D ( AccumulateIn[3] ) , .CLK ( clock ) , 
    .Q ( Accumulate[3] ) ) ;
DFFX1_LVT \Accumulate_reg[2] ( .D ( AccumulateIn[2] ) , .CLK ( clock ) , 
    .Q ( Accumulate[2] ) ) ;
DFFX1_LVT \Accumulate_reg[1] ( .D ( AccumulateIn[1] ) , .CLK ( clock ) , 
    .Q ( Accumulate[1] ) ) ;
DFFX1_LVT \Rpipe_reg[0] ( .D ( R[0] ) , .CLK ( clock ) , .Q ( Rpipe[0] ) ) ;
INVX1_LVT U5 ( .A ( newDist ) , .Y ( n8 ) ) ;
INVX1_LVT U6 ( .A ( S1S2mux ) , .Y ( n9 ) ) ;
AO221X1_LVT U7 ( .A1 ( N33 ) , .A2 ( n8 ) , .A3 ( newDist ) , 
    .A4 ( difference[7] ) , .A5 ( n23 ) , .Y ( AccumulateIn[7] ) ) ;
AND2X1_LVT U8 ( .A1 ( Carry ) , .A2 ( n8 ) , .Y ( n23 ) ) ;
AO221X1_LVT U9 ( .A1 ( N27 ) , .A2 ( n8 ) , .A3 ( difference[1] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[1] ) ) ;
AO221X1_LVT U10 ( .A1 ( N28 ) , .A2 ( n8 ) , .A3 ( difference[2] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[2] ) ) ;
AO221X1_LVT U11 ( .A1 ( N29 ) , .A2 ( n8 ) , .A3 ( difference[3] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[3] ) ) ;
AO221X1_LVT U12 ( .A1 ( N30 ) , .A2 ( n8 ) , .A3 ( difference[4] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[4] ) ) ;
AO221X1_LVT U13 ( .A1 ( N31 ) , .A2 ( n8 ) , .A3 ( difference[5] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[5] ) ) ;
AO221X1_LVT U14 ( .A1 ( N32 ) , .A2 ( n8 ) , .A3 ( difference[6] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[6] ) ) ;
AO22X1_LVT U15 ( .A1 ( S1[0] ) , .A2 ( S1S2mux ) , .A3 ( S2[0] ) , 
    .A4 ( n9 ) , .Y ( N8 ) ) ;
AO22X1_LVT U16 ( .A1 ( S1[1] ) , .A2 ( S1S2mux ) , .A3 ( S2[1] ) , 
    .A4 ( n9 ) , .Y ( N9 ) ) ;
AO22X1_LVT U17 ( .A1 ( S1[2] ) , .A2 ( S1S2mux ) , .A3 ( S2[2] ) , 
    .A4 ( n9 ) , .Y ( N10 ) ) ;
AO22X1_LVT U18 ( .A1 ( S1[3] ) , .A2 ( S1S2mux ) , .A3 ( S2[3] ) , 
    .A4 ( n9 ) , .Y ( N11 ) ) ;
AO22X1_LVT U19 ( .A1 ( S1[4] ) , .A2 ( S1S2mux ) , .A3 ( S2[4] ) , 
    .A4 ( n9 ) , .Y ( N12 ) ) ;
AO22X1_LVT U20 ( .A1 ( S1[5] ) , .A2 ( S1S2mux ) , .A3 ( S2[5] ) , 
    .A4 ( n9 ) , .Y ( N13 ) ) ;
AO22X1_LVT U21 ( .A1 ( S1[6] ) , .A2 ( S1S2mux ) , .A3 ( S2[6] ) , 
    .A4 ( n9 ) , .Y ( N14 ) ) ;
AO22X1_LVT U22 ( .A1 ( S1[7] ) , .A2 ( S1S2mux ) , .A3 ( S2[7] ) , 
    .A4 ( n9 ) , .Y ( N15 ) ) ;
AO221X1_LVT U23 ( .A1 ( N26 ) , .A2 ( n8 ) , .A3 ( difference[0] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[0] ) ) ;
endmodule


module PE_12_DW01_add_0 ( A , B , CI , SUM , CO ) ;
input  [8:0] A ;
input  [8:0] B ;
input  CI ;
output [8:0] SUM ;
output CO ;

wire [8:1] carry ;

FADDX1_LVT U1_6 ( .A ( A[6] ) , .B ( B[6] ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( SUM[6] ) ) ;
FADDX1_LVT U1_5 ( .A ( A[5] ) , .B ( B[5] ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( SUM[5] ) ) ;
FADDX1_LVT U1_4 ( .A ( A[4] ) , .B ( B[4] ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( SUM[4] ) ) ;
FADDX1_LVT U1_3 ( .A ( A[3] ) , .B ( B[3] ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( SUM[3] ) ) ;
FADDX1_LVT U1_2 ( .A ( A[2] ) , .B ( B[2] ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( SUM[2] ) ) ;
FADDX1_LVT U1_1 ( .A ( A[1] ) , .B ( B[1] ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( SUM[1] ) ) ;
FADDX1_LVT U1_7 ( .A ( A[7] ) , .B ( B[7] ) , .CI ( carry[7] ) , 
    .CO ( SUM[8] ) , .S ( SUM[7] ) ) ;
AND2X1_LVT U1 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( carry[1] ) ) ;
XOR2X1_LVT U2 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( SUM[0] ) ) ;
endmodule


module PE_12_DW01_sub_1 ( A , B , CI , DIFF , CO ) ;
input  [7:0] A ;
input  [7:0] B ;
input  CI ;
output [7:0] DIFF ;
output CO ;

wire [8:0] carry ;

FADDX1_LVT U2_7 ( .A ( A[7] ) , .B ( n3 ) , .CI ( carry[7] ) , 
    .S ( DIFF[7] ) ) ;
FADDX1_LVT U2_6 ( .A ( A[6] ) , .B ( n4 ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( DIFF[6] ) ) ;
FADDX1_LVT U2_5 ( .A ( A[5] ) , .B ( n5 ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( DIFF[5] ) ) ;
FADDX1_LVT U2_4 ( .A ( A[4] ) , .B ( n6 ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( DIFF[4] ) ) ;
FADDX1_LVT U2_3 ( .A ( A[3] ) , .B ( n7 ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( DIFF[3] ) ) ;
FADDX1_LVT U2_2 ( .A ( A[2] ) , .B ( n8 ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( DIFF[2] ) ) ;
FADDX1_LVT U2_1 ( .A ( A[1] ) , .B ( n1 ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( DIFF[1] ) ) ;
INVX1_LVT U1 ( .A ( B[0] ) , .Y ( n2 ) ) ;
INVX1_LVT U2 ( .A ( B[1] ) , .Y ( n1 ) ) ;
OR2X1_LVT U3 ( .A1 ( n2 ) , .A2 ( A[0] ) , .Y ( carry[1] ) ) ;
INVX1_LVT U4 ( .A ( B[2] ) , .Y ( n8 ) ) ;
INVX1_LVT U5 ( .A ( B[3] ) , .Y ( n7 ) ) ;
INVX1_LVT U6 ( .A ( B[4] ) , .Y ( n6 ) ) ;
INVX1_LVT U7 ( .A ( B[5] ) , .Y ( n5 ) ) ;
INVX1_LVT U8 ( .A ( B[6] ) , .Y ( n4 ) ) ;
INVX1_LVT U9 ( .A ( B[7] ) , .Y ( n3 ) ) ;
XNOR2X1_LVT U10 ( .A1 ( A[0] ) , .A2 ( n2 ) , .Y ( DIFF[0] ) ) ;
endmodule


module PE_11 ( clock , R , S1 , S2 , S1S2mux , newDist , Accumulate , Rpipe ) ;
input  clock ;
input  [7:0] R ;
input  [7:0] S1 ;
input  [7:0] S2 ;
input  S1S2mux ;
input  newDist ;
output [7:0] Accumulate ;
output [7:0] Rpipe ;

wire [7:0] AccumulateIn ;
wire [7:0] difference ;

PE_11_DW01_add_0 add_56 (
    .A ( { 1'b0 , Accumulate[7] , Accumulate[6] , Accumulate[5] , 
        Accumulate[4] , Accumulate[3] , Accumulate[2] , Accumulate[1] , 
        Accumulate[0] } ) ,
    .B ( { 1'b0 , difference[7] , difference[6] , difference[5] , 
        difference[4] , difference[3] , difference[2] , difference[1] , 
        difference[0] } ) ,
    .CI ( 1'b0 ) ,
    .SUM ( { Carry , N33 , N32 , N31 , N30 , N29 , N28 , N27 , N26 } ) ) ;
PE_11_DW01_sub_1 sub_50 ( .A ( R ) ,
    .B ( { N15 , N14 , N13 , N12 , N11 , N10 , N9 , N8 } ) ,
    .CI ( 1'b0 ) , .DIFF ( difference ) ) ;
DFFX1_LVT \Accumulate_reg[0] ( .D ( AccumulateIn[0] ) , .CLK ( clock ) , 
    .Q ( Accumulate[0] ) ) ;
DFFX1_LVT \Accumulate_reg[7] ( .D ( AccumulateIn[7] ) , .CLK ( clock ) , 
    .Q ( Accumulate[7] ) ) ;
DFFX1_LVT \Accumulate_reg[6] ( .D ( AccumulateIn[6] ) , .CLK ( clock ) , 
    .Q ( Accumulate[6] ) ) ;
DFFX1_LVT \Accumulate_reg[5] ( .D ( AccumulateIn[5] ) , .CLK ( clock ) , 
    .Q ( Accumulate[5] ) ) ;
DFFX1_LVT \Accumulate_reg[4] ( .D ( AccumulateIn[4] ) , .CLK ( clock ) , 
    .Q ( Accumulate[4] ) ) ;
DFFX1_LVT \Accumulate_reg[3] ( .D ( AccumulateIn[3] ) , .CLK ( clock ) , 
    .Q ( Accumulate[3] ) ) ;
DFFX1_LVT \Accumulate_reg[2] ( .D ( AccumulateIn[2] ) , .CLK ( clock ) , 
    .Q ( Accumulate[2] ) ) ;
DFFX1_LVT \Accumulate_reg[1] ( .D ( AccumulateIn[1] ) , .CLK ( clock ) , 
    .Q ( Accumulate[1] ) ) ;
DFFX1_LVT \Rpipe_reg[7] ( .D ( R[7] ) , .CLK ( clock ) , .Q ( Rpipe[7] ) ) ;
DFFX1_LVT \Rpipe_reg[6] ( .D ( R[6] ) , .CLK ( clock ) , .Q ( Rpipe[6] ) ) ;
DFFX1_LVT \Rpipe_reg[5] ( .D ( R[5] ) , .CLK ( clock ) , .Q ( Rpipe[5] ) ) ;
DFFX1_LVT \Rpipe_reg[4] ( .D ( R[4] ) , .CLK ( clock ) , .Q ( Rpipe[4] ) ) ;
DFFX1_LVT \Rpipe_reg[3] ( .D ( R[3] ) , .CLK ( clock ) , .Q ( Rpipe[3] ) ) ;
DFFX1_LVT \Rpipe_reg[2] ( .D ( R[2] ) , .CLK ( clock ) , .Q ( Rpipe[2] ) ) ;
DFFX1_LVT \Rpipe_reg[1] ( .D ( R[1] ) , .CLK ( clock ) , .Q ( Rpipe[1] ) ) ;
DFFX1_LVT \Rpipe_reg[0] ( .D ( R[0] ) , .CLK ( clock ) , .Q ( Rpipe[0] ) ) ;
INVX1_LVT U5 ( .A ( newDist ) , .Y ( n8 ) ) ;
INVX1_LVT U6 ( .A ( S1S2mux ) , .Y ( n9 ) ) ;
AND2X1_LVT U7 ( .A1 ( Carry ) , .A2 ( n8 ) , .Y ( n23 ) ) ;
AO221X1_LVT U8 ( .A1 ( N27 ) , .A2 ( n8 ) , .A3 ( difference[1] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[1] ) ) ;
AO221X1_LVT U9 ( .A1 ( N28 ) , .A2 ( n8 ) , .A3 ( difference[2] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[2] ) ) ;
AO221X1_LVT U10 ( .A1 ( N29 ) , .A2 ( n8 ) , .A3 ( difference[3] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[3] ) ) ;
AO221X1_LVT U11 ( .A1 ( N30 ) , .A2 ( n8 ) , .A3 ( difference[4] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[4] ) ) ;
AO221X1_LVT U12 ( .A1 ( N31 ) , .A2 ( n8 ) , .A3 ( difference[5] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[5] ) ) ;
AO221X1_LVT U13 ( .A1 ( N32 ) , .A2 ( n8 ) , .A3 ( difference[6] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[6] ) ) ;
AO221X1_LVT U14 ( .A1 ( N33 ) , .A2 ( n8 ) , .A3 ( newDist ) , 
    .A4 ( difference[7] ) , .A5 ( n23 ) , .Y ( AccumulateIn[7] ) ) ;
AO221X1_LVT U15 ( .A1 ( N26 ) , .A2 ( n8 ) , .A3 ( difference[0] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[0] ) ) ;
AO22X1_LVT U16 ( .A1 ( S1[7] ) , .A2 ( S1S2mux ) , .A3 ( S2[7] ) , 
    .A4 ( n9 ) , .Y ( N15 ) ) ;
AO22X1_LVT U17 ( .A1 ( S1[1] ) , .A2 ( S1S2mux ) , .A3 ( S2[1] ) , 
    .A4 ( n9 ) , .Y ( N9 ) ) ;
AO22X1_LVT U18 ( .A1 ( S1[2] ) , .A2 ( S1S2mux ) , .A3 ( S2[2] ) , 
    .A4 ( n9 ) , .Y ( N10 ) ) ;
AO22X1_LVT U19 ( .A1 ( S1[3] ) , .A2 ( S1S2mux ) , .A3 ( S2[3] ) , 
    .A4 ( n9 ) , .Y ( N11 ) ) ;
AO22X1_LVT U20 ( .A1 ( S1[4] ) , .A2 ( S1S2mux ) , .A3 ( S2[4] ) , 
    .A4 ( n9 ) , .Y ( N12 ) ) ;
AO22X1_LVT U21 ( .A1 ( S1[5] ) , .A2 ( S1S2mux ) , .A3 ( S2[5] ) , 
    .A4 ( n9 ) , .Y ( N13 ) ) ;
AO22X1_LVT U22 ( .A1 ( S1[6] ) , .A2 ( S1S2mux ) , .A3 ( S2[6] ) , 
    .A4 ( n9 ) , .Y ( N14 ) ) ;
AO22X1_LVT U23 ( .A1 ( S1[0] ) , .A2 ( S1S2mux ) , .A3 ( S2[0] ) , 
    .A4 ( n9 ) , .Y ( N8 ) ) ;
endmodule


module PE_11_DW01_add_0 ( A , B , CI , SUM , CO ) ;
input  [8:0] A ;
input  [8:0] B ;
input  CI ;
output [8:0] SUM ;
output CO ;

wire [8:1] carry ;

FADDX1_LVT U1_7 ( .A ( A[7] ) , .B ( B[7] ) , .CI ( carry[7] ) , 
    .CO ( SUM[8] ) , .S ( SUM[7] ) ) ;
FADDX1_LVT U1_6 ( .A ( A[6] ) , .B ( B[6] ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( SUM[6] ) ) ;
FADDX1_LVT U1_5 ( .A ( A[5] ) , .B ( B[5] ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( SUM[5] ) ) ;
FADDX1_LVT U1_4 ( .A ( A[4] ) , .B ( B[4] ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( SUM[4] ) ) ;
FADDX1_LVT U1_3 ( .A ( A[3] ) , .B ( B[3] ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( SUM[3] ) ) ;
FADDX1_LVT U1_2 ( .A ( A[2] ) , .B ( B[2] ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( SUM[2] ) ) ;
FADDX1_LVT U1_1 ( .A ( A[1] ) , .B ( B[1] ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( SUM[1] ) ) ;
XOR2X1_LVT U1 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( SUM[0] ) ) ;
AND2X1_LVT U2 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( carry[1] ) ) ;
endmodule


module PE_11_DW01_sub_1 ( A , B , CI , DIFF , CO ) ;
input  [7:0] A ;
input  [7:0] B ;
input  CI ;
output [7:0] DIFF ;
output CO ;

wire [8:0] carry ;

FADDX1_LVT U2_6 ( .A ( A[6] ) , .B ( n4 ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( DIFF[6] ) ) ;
FADDX1_LVT U2_5 ( .A ( A[5] ) , .B ( n5 ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( DIFF[5] ) ) ;
FADDX1_LVT U2_4 ( .A ( A[4] ) , .B ( n6 ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( DIFF[4] ) ) ;
FADDX1_LVT U2_3 ( .A ( A[3] ) , .B ( n7 ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( DIFF[3] ) ) ;
FADDX1_LVT U2_2 ( .A ( A[2] ) , .B ( n8 ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( DIFF[2] ) ) ;
FADDX1_LVT U2_1 ( .A ( A[1] ) , .B ( n1 ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( DIFF[1] ) ) ;
FADDX1_LVT U2_7 ( .A ( A[7] ) , .B ( n3 ) , .CI ( carry[7] ) , 
    .S ( DIFF[7] ) ) ;
INVX1_LVT U1 ( .A ( B[7] ) , .Y ( n3 ) ) ;
INVX1_LVT U2 ( .A ( B[1] ) , .Y ( n1 ) ) ;
OR2X1_LVT U3 ( .A1 ( n2 ) , .A2 ( A[0] ) , .Y ( carry[1] ) ) ;
INVX1_LVT U4 ( .A ( B[2] ) , .Y ( n8 ) ) ;
INVX1_LVT U5 ( .A ( B[3] ) , .Y ( n7 ) ) ;
INVX1_LVT U6 ( .A ( B[4] ) , .Y ( n6 ) ) ;
INVX1_LVT U7 ( .A ( B[5] ) , .Y ( n5 ) ) ;
INVX1_LVT U8 ( .A ( B[6] ) , .Y ( n4 ) ) ;
INVX1_LVT U9 ( .A ( B[0] ) , .Y ( n2 ) ) ;
XNOR2X1_LVT U10 ( .A1 ( A[0] ) , .A2 ( n2 ) , .Y ( DIFF[0] ) ) ;
endmodule


module PE_10 ( clock , R , S1 , S2 , S1S2mux , newDist , Accumulate , Rpipe ) ;
input  clock ;
input  [7:0] R ;
input  [7:0] S1 ;
input  [7:0] S2 ;
input  S1S2mux ;
input  newDist ;
output [7:0] Accumulate ;
output [7:0] Rpipe ;

wire [7:0] AccumulateIn ;
wire [7:0] difference ;

PE_10_DW01_add_0 add_56 (
    .A ( { 1'b0 , Accumulate[7] , Accumulate[6] , Accumulate[5] , 
        Accumulate[4] , Accumulate[3] , Accumulate[2] , Accumulate[1] , 
        Accumulate[0] } ) ,
    .B ( { 1'b0 , difference[7] , difference[6] , difference[5] , 
        difference[4] , difference[3] , difference[2] , difference[1] , 
        difference[0] } ) ,
    .CI ( 1'b0 ) ,
    .SUM ( { Carry , N33 , N32 , N31 , N30 , N29 , N28 , N27 , N26 } ) ) ;
PE_10_DW01_sub_1 sub_50 ( .A ( R ) ,
    .B ( { N15 , N14 , N13 , N12 , N11 , N10 , N9 , N8 } ) ,
    .CI ( 1'b0 ) , .DIFF ( difference ) ) ;
DFFX1_LVT \Accumulate_reg[0] ( .D ( AccumulateIn[0] ) , .CLK ( clock ) , 
    .Q ( Accumulate[0] ) ) ;
DFFX1_LVT \Rpipe_reg[7] ( .D ( R[7] ) , .CLK ( clock ) , .Q ( Rpipe[7] ) ) ;
DFFX1_LVT \Rpipe_reg[6] ( .D ( R[6] ) , .CLK ( clock ) , .Q ( Rpipe[6] ) ) ;
DFFX1_LVT \Rpipe_reg[5] ( .D ( R[5] ) , .CLK ( clock ) , .Q ( Rpipe[5] ) ) ;
DFFX1_LVT \Rpipe_reg[4] ( .D ( R[4] ) , .CLK ( clock ) , .Q ( Rpipe[4] ) ) ;
DFFX1_LVT \Rpipe_reg[3] ( .D ( R[3] ) , .CLK ( clock ) , .Q ( Rpipe[3] ) ) ;
DFFX1_LVT \Rpipe_reg[2] ( .D ( R[2] ) , .CLK ( clock ) , .Q ( Rpipe[2] ) ) ;
DFFX1_LVT \Rpipe_reg[1] ( .D ( R[1] ) , .CLK ( clock ) , .Q ( Rpipe[1] ) ) ;
DFFX1_LVT \Accumulate_reg[7] ( .D ( AccumulateIn[7] ) , .CLK ( clock ) , 
    .Q ( Accumulate[7] ) ) ;
DFFX1_LVT \Accumulate_reg[6] ( .D ( AccumulateIn[6] ) , .CLK ( clock ) , 
    .Q ( Accumulate[6] ) ) ;
DFFX1_LVT \Accumulate_reg[5] ( .D ( AccumulateIn[5] ) , .CLK ( clock ) , 
    .Q ( Accumulate[5] ) ) ;
DFFX1_LVT \Accumulate_reg[4] ( .D ( AccumulateIn[4] ) , .CLK ( clock ) , 
    .Q ( Accumulate[4] ) ) ;
DFFX1_LVT \Accumulate_reg[3] ( .D ( AccumulateIn[3] ) , .CLK ( clock ) , 
    .Q ( Accumulate[3] ) ) ;
DFFX1_LVT \Accumulate_reg[2] ( .D ( AccumulateIn[2] ) , .CLK ( clock ) , 
    .Q ( Accumulate[2] ) ) ;
DFFX1_LVT \Accumulate_reg[1] ( .D ( AccumulateIn[1] ) , .CLK ( clock ) , 
    .Q ( Accumulate[1] ) ) ;
DFFX1_LVT \Rpipe_reg[0] ( .D ( R[0] ) , .CLK ( clock ) , .Q ( Rpipe[0] ) ) ;
INVX1_LVT U5 ( .A ( newDist ) , .Y ( n8 ) ) ;
INVX1_LVT U6 ( .A ( S1S2mux ) , .Y ( n9 ) ) ;
AND2X1_LVT U7 ( .A1 ( Carry ) , .A2 ( n8 ) , .Y ( n23 ) ) ;
AO221X1_LVT U8 ( .A1 ( N27 ) , .A2 ( n8 ) , .A3 ( difference[1] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[1] ) ) ;
AO221X1_LVT U9 ( .A1 ( N28 ) , .A2 ( n8 ) , .A3 ( difference[2] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[2] ) ) ;
AO221X1_LVT U10 ( .A1 ( N29 ) , .A2 ( n8 ) , .A3 ( difference[3] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[3] ) ) ;
AO221X1_LVT U11 ( .A1 ( N30 ) , .A2 ( n8 ) , .A3 ( difference[4] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[4] ) ) ;
AO221X1_LVT U12 ( .A1 ( N31 ) , .A2 ( n8 ) , .A3 ( difference[5] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[5] ) ) ;
AO221X1_LVT U13 ( .A1 ( N32 ) , .A2 ( n8 ) , .A3 ( difference[6] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[6] ) ) ;
AO221X1_LVT U14 ( .A1 ( N33 ) , .A2 ( n8 ) , .A3 ( newDist ) , 
    .A4 ( difference[7] ) , .A5 ( n23 ) , .Y ( AccumulateIn[7] ) ) ;
AO221X1_LVT U15 ( .A1 ( N26 ) , .A2 ( n8 ) , .A3 ( difference[0] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[0] ) ) ;
AO22X1_LVT U16 ( .A1 ( S1[7] ) , .A2 ( S1S2mux ) , .A3 ( S2[7] ) , 
    .A4 ( n9 ) , .Y ( N15 ) ) ;
AO22X1_LVT U17 ( .A1 ( S1[1] ) , .A2 ( S1S2mux ) , .A3 ( S2[1] ) , 
    .A4 ( n9 ) , .Y ( N9 ) ) ;
AO22X1_LVT U18 ( .A1 ( S1[2] ) , .A2 ( S1S2mux ) , .A3 ( S2[2] ) , 
    .A4 ( n9 ) , .Y ( N10 ) ) ;
AO22X1_LVT U19 ( .A1 ( S1[3] ) , .A2 ( S1S2mux ) , .A3 ( S2[3] ) , 
    .A4 ( n9 ) , .Y ( N11 ) ) ;
AO22X1_LVT U20 ( .A1 ( S1[4] ) , .A2 ( S1S2mux ) , .A3 ( S2[4] ) , 
    .A4 ( n9 ) , .Y ( N12 ) ) ;
AO22X1_LVT U21 ( .A1 ( S1[5] ) , .A2 ( S1S2mux ) , .A3 ( S2[5] ) , 
    .A4 ( n9 ) , .Y ( N13 ) ) ;
AO22X1_LVT U22 ( .A1 ( S1[6] ) , .A2 ( S1S2mux ) , .A3 ( S2[6] ) , 
    .A4 ( n9 ) , .Y ( N14 ) ) ;
AO22X1_LVT U23 ( .A1 ( S1[0] ) , .A2 ( S1S2mux ) , .A3 ( S2[0] ) , 
    .A4 ( n9 ) , .Y ( N8 ) ) ;
endmodule


module PE_10_DW01_add_0 ( A , B , CI , SUM , CO ) ;
input  [8:0] A ;
input  [8:0] B ;
input  CI ;
output [8:0] SUM ;
output CO ;

wire [8:1] carry ;

FADDX1_LVT U1_7 ( .A ( A[7] ) , .B ( B[7] ) , .CI ( carry[7] ) , 
    .CO ( SUM[8] ) , .S ( SUM[7] ) ) ;
FADDX1_LVT U1_6 ( .A ( A[6] ) , .B ( B[6] ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( SUM[6] ) ) ;
FADDX1_LVT U1_5 ( .A ( A[5] ) , .B ( B[5] ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( SUM[5] ) ) ;
FADDX1_LVT U1_4 ( .A ( A[4] ) , .B ( B[4] ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( SUM[4] ) ) ;
FADDX1_LVT U1_3 ( .A ( A[3] ) , .B ( B[3] ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( SUM[3] ) ) ;
FADDX1_LVT U1_2 ( .A ( A[2] ) , .B ( B[2] ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( SUM[2] ) ) ;
FADDX1_LVT U1_1 ( .A ( A[1] ) , .B ( B[1] ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( SUM[1] ) ) ;
XOR2X1_LVT U1 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( SUM[0] ) ) ;
AND2X1_LVT U2 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( carry[1] ) ) ;
endmodule


module PE_10_DW01_sub_1 ( A , B , CI , DIFF , CO ) ;
input  [7:0] A ;
input  [7:0] B ;
input  CI ;
output [7:0] DIFF ;
output CO ;

wire [8:0] carry ;

FADDX1_LVT U2_6 ( .A ( A[6] ) , .B ( n4 ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( DIFF[6] ) ) ;
FADDX1_LVT U2_5 ( .A ( A[5] ) , .B ( n5 ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( DIFF[5] ) ) ;
FADDX1_LVT U2_4 ( .A ( A[4] ) , .B ( n6 ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( DIFF[4] ) ) ;
FADDX1_LVT U2_3 ( .A ( A[3] ) , .B ( n7 ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( DIFF[3] ) ) ;
FADDX1_LVT U2_2 ( .A ( A[2] ) , .B ( n8 ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( DIFF[2] ) ) ;
FADDX1_LVT U2_1 ( .A ( A[1] ) , .B ( n1 ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( DIFF[1] ) ) ;
FADDX1_LVT U2_7 ( .A ( A[7] ) , .B ( n3 ) , .CI ( carry[7] ) , 
    .S ( DIFF[7] ) ) ;
INVX1_LVT U1 ( .A ( B[7] ) , .Y ( n3 ) ) ;
INVX1_LVT U2 ( .A ( B[1] ) , .Y ( n1 ) ) ;
OR2X1_LVT U3 ( .A1 ( n2 ) , .A2 ( A[0] ) , .Y ( carry[1] ) ) ;
INVX1_LVT U4 ( .A ( B[2] ) , .Y ( n8 ) ) ;
INVX1_LVT U5 ( .A ( B[3] ) , .Y ( n7 ) ) ;
INVX1_LVT U6 ( .A ( B[4] ) , .Y ( n6 ) ) ;
INVX1_LVT U7 ( .A ( B[5] ) , .Y ( n5 ) ) ;
INVX1_LVT U8 ( .A ( B[6] ) , .Y ( n4 ) ) ;
INVX1_LVT U9 ( .A ( B[0] ) , .Y ( n2 ) ) ;
XNOR2X1_LVT U10 ( .A1 ( A[0] ) , .A2 ( n2 ) , .Y ( DIFF[0] ) ) ;
endmodule


module PE_9 ( clock , R , S1 , S2 , S1S2mux , newDist , Accumulate , Rpipe ) ;
input  clock ;
input  [7:0] R ;
input  [7:0] S1 ;
input  [7:0] S2 ;
input  S1S2mux ;
input  newDist ;
output [7:0] Accumulate ;
output [7:0] Rpipe ;

wire [7:0] AccumulateIn ;
wire [7:0] difference ;

PE_9_DW01_add_0 add_56 (
    .A ( { 1'b0 , Accumulate[7] , Accumulate[6] , Accumulate[5] , 
        Accumulate[4] , Accumulate[3] , Accumulate[2] , Accumulate[1] , 
        Accumulate[0] } ) ,
    .B ( { 1'b0 , difference[7] , difference[6] , difference[5] , 
        difference[4] , difference[3] , difference[2] , difference[1] , 
        difference[0] } ) ,
    .CI ( 1'b0 ) ,
    .SUM ( { Carry , N33 , N32 , N31 , N30 , N29 , N28 , N27 , N26 } ) ) ;
PE_9_DW01_sub_1 sub_50 ( .A ( R ) ,
    .B ( { N15 , N14 , N13 , N12 , N11 , N10 , N9 , N8 } ) ,
    .CI ( 1'b0 ) , .DIFF ( difference ) ) ;
DFFX1_LVT \Accumulate_reg[0] ( .D ( AccumulateIn[0] ) , .CLK ( clock ) , 
    .Q ( Accumulate[0] ) ) ;
DFFX1_LVT \Rpipe_reg[7] ( .D ( R[7] ) , .CLK ( clock ) , .Q ( Rpipe[7] ) ) ;
DFFX1_LVT \Rpipe_reg[6] ( .D ( R[6] ) , .CLK ( clock ) , .Q ( Rpipe[6] ) ) ;
DFFX1_LVT \Rpipe_reg[5] ( .D ( R[5] ) , .CLK ( clock ) , .Q ( Rpipe[5] ) ) ;
DFFX1_LVT \Rpipe_reg[4] ( .D ( R[4] ) , .CLK ( clock ) , .Q ( Rpipe[4] ) ) ;
DFFX1_LVT \Rpipe_reg[3] ( .D ( R[3] ) , .CLK ( clock ) , .Q ( Rpipe[3] ) ) ;
DFFX1_LVT \Rpipe_reg[2] ( .D ( R[2] ) , .CLK ( clock ) , .Q ( Rpipe[2] ) ) ;
DFFX1_LVT \Rpipe_reg[1] ( .D ( R[1] ) , .CLK ( clock ) , .Q ( Rpipe[1] ) ) ;
DFFX1_LVT \Accumulate_reg[7] ( .D ( AccumulateIn[7] ) , .CLK ( clock ) , 
    .Q ( Accumulate[7] ) ) ;
DFFX1_LVT \Accumulate_reg[6] ( .D ( AccumulateIn[6] ) , .CLK ( clock ) , 
    .Q ( Accumulate[6] ) ) ;
DFFX1_LVT \Accumulate_reg[5] ( .D ( AccumulateIn[5] ) , .CLK ( clock ) , 
    .Q ( Accumulate[5] ) ) ;
DFFX1_LVT \Accumulate_reg[4] ( .D ( AccumulateIn[4] ) , .CLK ( clock ) , 
    .Q ( Accumulate[4] ) ) ;
DFFX1_LVT \Accumulate_reg[3] ( .D ( AccumulateIn[3] ) , .CLK ( clock ) , 
    .Q ( Accumulate[3] ) ) ;
DFFX1_LVT \Accumulate_reg[2] ( .D ( AccumulateIn[2] ) , .CLK ( clock ) , 
    .Q ( Accumulate[2] ) ) ;
DFFX1_LVT \Accumulate_reg[1] ( .D ( AccumulateIn[1] ) , .CLK ( clock ) , 
    .Q ( Accumulate[1] ) ) ;
DFFX1_LVT \Rpipe_reg[0] ( .D ( R[0] ) , .CLK ( clock ) , .Q ( Rpipe[0] ) ) ;
INVX1_LVT U5 ( .A ( newDist ) , .Y ( n8 ) ) ;
INVX1_LVT U6 ( .A ( S1S2mux ) , .Y ( n9 ) ) ;
AND2X1_LVT U7 ( .A1 ( Carry ) , .A2 ( n8 ) , .Y ( n23 ) ) ;
AO221X1_LVT U8 ( .A1 ( N27 ) , .A2 ( n8 ) , .A3 ( difference[1] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[1] ) ) ;
AO221X1_LVT U9 ( .A1 ( N28 ) , .A2 ( n8 ) , .A3 ( difference[2] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[2] ) ) ;
AO221X1_LVT U10 ( .A1 ( N29 ) , .A2 ( n8 ) , .A3 ( difference[3] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[3] ) ) ;
AO221X1_LVT U11 ( .A1 ( N30 ) , .A2 ( n8 ) , .A3 ( difference[4] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[4] ) ) ;
AO221X1_LVT U12 ( .A1 ( N31 ) , .A2 ( n8 ) , .A3 ( difference[5] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[5] ) ) ;
AO221X1_LVT U13 ( .A1 ( N32 ) , .A2 ( n8 ) , .A3 ( difference[6] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[6] ) ) ;
AO221X1_LVT U14 ( .A1 ( N33 ) , .A2 ( n8 ) , .A3 ( newDist ) , 
    .A4 ( difference[7] ) , .A5 ( n23 ) , .Y ( AccumulateIn[7] ) ) ;
AO221X1_LVT U15 ( .A1 ( N26 ) , .A2 ( n8 ) , .A3 ( difference[0] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[0] ) ) ;
AO22X1_LVT U16 ( .A1 ( S1[7] ) , .A2 ( S1S2mux ) , .A3 ( S2[7] ) , 
    .A4 ( n9 ) , .Y ( N15 ) ) ;
AO22X1_LVT U17 ( .A1 ( S1[1] ) , .A2 ( S1S2mux ) , .A3 ( S2[1] ) , 
    .A4 ( n9 ) , .Y ( N9 ) ) ;
AO22X1_LVT U18 ( .A1 ( S1[2] ) , .A2 ( S1S2mux ) , .A3 ( S2[2] ) , 
    .A4 ( n9 ) , .Y ( N10 ) ) ;
AO22X1_LVT U19 ( .A1 ( S1[3] ) , .A2 ( S1S2mux ) , .A3 ( S2[3] ) , 
    .A4 ( n9 ) , .Y ( N11 ) ) ;
AO22X1_LVT U20 ( .A1 ( S1[4] ) , .A2 ( S1S2mux ) , .A3 ( S2[4] ) , 
    .A4 ( n9 ) , .Y ( N12 ) ) ;
AO22X1_LVT U21 ( .A1 ( S1[5] ) , .A2 ( S1S2mux ) , .A3 ( S2[5] ) , 
    .A4 ( n9 ) , .Y ( N13 ) ) ;
AO22X1_LVT U22 ( .A1 ( S1[6] ) , .A2 ( S1S2mux ) , .A3 ( S2[6] ) , 
    .A4 ( n9 ) , .Y ( N14 ) ) ;
AO22X1_LVT U23 ( .A1 ( S1[0] ) , .A2 ( S1S2mux ) , .A3 ( S2[0] ) , 
    .A4 ( n9 ) , .Y ( N8 ) ) ;
endmodule


module PE_9_DW01_add_0 ( A , B , CI , SUM , CO ) ;
input  [8:0] A ;
input  [8:0] B ;
input  CI ;
output [8:0] SUM ;
output CO ;

wire [8:1] carry ;

FADDX1_LVT U1_7 ( .A ( A[7] ) , .B ( B[7] ) , .CI ( carry[7] ) , 
    .CO ( SUM[8] ) , .S ( SUM[7] ) ) ;
FADDX1_LVT U1_6 ( .A ( A[6] ) , .B ( B[6] ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( SUM[6] ) ) ;
FADDX1_LVT U1_5 ( .A ( A[5] ) , .B ( B[5] ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( SUM[5] ) ) ;
FADDX1_LVT U1_4 ( .A ( A[4] ) , .B ( B[4] ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( SUM[4] ) ) ;
FADDX1_LVT U1_3 ( .A ( A[3] ) , .B ( B[3] ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( SUM[3] ) ) ;
FADDX1_LVT U1_2 ( .A ( A[2] ) , .B ( B[2] ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( SUM[2] ) ) ;
FADDX1_LVT U1_1 ( .A ( A[1] ) , .B ( B[1] ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( SUM[1] ) ) ;
XOR2X1_LVT U1 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( SUM[0] ) ) ;
AND2X1_LVT U2 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( carry[1] ) ) ;
endmodule


module PE_9_DW01_sub_1 ( A , B , CI , DIFF , CO ) ;
input  [7:0] A ;
input  [7:0] B ;
input  CI ;
output [7:0] DIFF ;
output CO ;

wire [8:0] carry ;

FADDX1_LVT U2_6 ( .A ( A[6] ) , .B ( n4 ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( DIFF[6] ) ) ;
FADDX1_LVT U2_5 ( .A ( A[5] ) , .B ( n5 ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( DIFF[5] ) ) ;
FADDX1_LVT U2_4 ( .A ( A[4] ) , .B ( n6 ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( DIFF[4] ) ) ;
FADDX1_LVT U2_3 ( .A ( A[3] ) , .B ( n7 ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( DIFF[3] ) ) ;
FADDX1_LVT U2_2 ( .A ( A[2] ) , .B ( n8 ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( DIFF[2] ) ) ;
FADDX1_LVT U2_1 ( .A ( A[1] ) , .B ( n1 ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( DIFF[1] ) ) ;
FADDX1_LVT U2_7 ( .A ( A[7] ) , .B ( n3 ) , .CI ( carry[7] ) , 
    .S ( DIFF[7] ) ) ;
INVX1_LVT U1 ( .A ( B[7] ) , .Y ( n3 ) ) ;
INVX1_LVT U2 ( .A ( B[1] ) , .Y ( n1 ) ) ;
OR2X1_LVT U3 ( .A1 ( n2 ) , .A2 ( A[0] ) , .Y ( carry[1] ) ) ;
INVX1_LVT U4 ( .A ( B[2] ) , .Y ( n8 ) ) ;
INVX1_LVT U5 ( .A ( B[3] ) , .Y ( n7 ) ) ;
INVX1_LVT U6 ( .A ( B[4] ) , .Y ( n6 ) ) ;
INVX1_LVT U7 ( .A ( B[5] ) , .Y ( n5 ) ) ;
INVX1_LVT U8 ( .A ( B[6] ) , .Y ( n4 ) ) ;
INVX1_LVT U9 ( .A ( B[0] ) , .Y ( n2 ) ) ;
XNOR2X1_LVT U10 ( .A1 ( A[0] ) , .A2 ( n2 ) , .Y ( DIFF[0] ) ) ;
endmodule


module PE_8 ( clock , R , S1 , S2 , S1S2mux , newDist , Accumulate , Rpipe ) ;
input  clock ;
input  [7:0] R ;
input  [7:0] S1 ;
input  [7:0] S2 ;
input  S1S2mux ;
input  newDist ;
output [7:0] Accumulate ;
output [7:0] Rpipe ;

wire [7:0] AccumulateIn ;
wire [7:0] difference ;

PE_8_DW01_add_0 add_56 (
    .A ( { 1'b0 , Accumulate[7] , Accumulate[6] , Accumulate[5] , 
        Accumulate[4] , Accumulate[3] , Accumulate[2] , Accumulate[1] , 
        Accumulate[0] } ) ,
    .B ( { 1'b0 , difference[7] , difference[6] , difference[5] , 
        difference[4] , difference[3] , difference[2] , difference[1] , 
        difference[0] } ) ,
    .CI ( 1'b0 ) ,
    .SUM ( { Carry , N33 , N32 , N31 , N30 , N29 , N28 , N27 , N26 } ) ) ;
PE_8_DW01_sub_1 sub_50 ( .A ( R ) ,
    .B ( { N15 , N14 , N13 , N12 , N11 , N10 , N9 , N8 } ) ,
    .CI ( 1'b0 ) , .DIFF ( difference ) ) ;
DFFX1_LVT \Accumulate_reg[0] ( .D ( AccumulateIn[0] ) , .CLK ( clock ) , 
    .Q ( Accumulate[0] ) ) ;
DFFX1_LVT \Accumulate_reg[7] ( .D ( AccumulateIn[7] ) , .CLK ( clock ) , 
    .Q ( Accumulate[7] ) ) ;
DFFX1_LVT \Accumulate_reg[6] ( .D ( AccumulateIn[6] ) , .CLK ( clock ) , 
    .Q ( Accumulate[6] ) ) ;
DFFX1_LVT \Accumulate_reg[5] ( .D ( AccumulateIn[5] ) , .CLK ( clock ) , 
    .Q ( Accumulate[5] ) ) ;
DFFX1_LVT \Accumulate_reg[4] ( .D ( AccumulateIn[4] ) , .CLK ( clock ) , 
    .Q ( Accumulate[4] ) ) ;
DFFX1_LVT \Accumulate_reg[3] ( .D ( AccumulateIn[3] ) , .CLK ( clock ) , 
    .Q ( Accumulate[3] ) ) ;
DFFX1_LVT \Accumulate_reg[2] ( .D ( AccumulateIn[2] ) , .CLK ( clock ) , 
    .Q ( Accumulate[2] ) ) ;
DFFX1_LVT \Accumulate_reg[1] ( .D ( AccumulateIn[1] ) , .CLK ( clock ) , 
    .Q ( Accumulate[1] ) ) ;
DFFX1_LVT \Rpipe_reg[7] ( .D ( R[7] ) , .CLK ( clock ) , .Q ( Rpipe[7] ) ) ;
DFFX1_LVT \Rpipe_reg[6] ( .D ( R[6] ) , .CLK ( clock ) , .Q ( Rpipe[6] ) ) ;
DFFX1_LVT \Rpipe_reg[5] ( .D ( R[5] ) , .CLK ( clock ) , .Q ( Rpipe[5] ) ) ;
DFFX1_LVT \Rpipe_reg[4] ( .D ( R[4] ) , .CLK ( clock ) , .Q ( Rpipe[4] ) ) ;
DFFX1_LVT \Rpipe_reg[3] ( .D ( R[3] ) , .CLK ( clock ) , .Q ( Rpipe[3] ) ) ;
DFFX1_LVT \Rpipe_reg[2] ( .D ( R[2] ) , .CLK ( clock ) , .Q ( Rpipe[2] ) ) ;
DFFX1_LVT \Rpipe_reg[1] ( .D ( R[1] ) , .CLK ( clock ) , .Q ( Rpipe[1] ) ) ;
DFFX1_LVT \Rpipe_reg[0] ( .D ( R[0] ) , .CLK ( clock ) , .Q ( Rpipe[0] ) ) ;
INVX1_LVT U5 ( .A ( newDist ) , .Y ( n8 ) ) ;
AND2X1_LVT U6 ( .A1 ( Carry ) , .A2 ( n8 ) , .Y ( n23 ) ) ;
AO221X1_LVT U7 ( .A1 ( N27 ) , .A2 ( n8 ) , .A3 ( difference[1] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[1] ) ) ;
AO221X1_LVT U8 ( .A1 ( N28 ) , .A2 ( n8 ) , .A3 ( difference[2] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[2] ) ) ;
AO221X1_LVT U9 ( .A1 ( N29 ) , .A2 ( n8 ) , .A3 ( difference[3] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[3] ) ) ;
AO221X1_LVT U10 ( .A1 ( N30 ) , .A2 ( n8 ) , .A3 ( difference[4] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[4] ) ) ;
AO221X1_LVT U11 ( .A1 ( N31 ) , .A2 ( n8 ) , .A3 ( difference[5] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[5] ) ) ;
AO221X1_LVT U12 ( .A1 ( N32 ) , .A2 ( n8 ) , .A3 ( difference[6] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[6] ) ) ;
AO221X1_LVT U13 ( .A1 ( N33 ) , .A2 ( n8 ) , .A3 ( newDist ) , 
    .A4 ( difference[7] ) , .A5 ( n23 ) , .Y ( AccumulateIn[7] ) ) ;
INVX1_LVT U14 ( .A ( S1S2mux ) , .Y ( n9 ) ) ;
AO221X1_LVT U15 ( .A1 ( N26 ) , .A2 ( n8 ) , .A3 ( difference[0] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[0] ) ) ;
AO22X1_LVT U16 ( .A1 ( S1[7] ) , .A2 ( S1S2mux ) , .A3 ( S2[7] ) , 
    .A4 ( n9 ) , .Y ( N15 ) ) ;
AO22X1_LVT U17 ( .A1 ( S1[2] ) , .A2 ( S1S2mux ) , .A3 ( S2[2] ) , 
    .A4 ( n9 ) , .Y ( N10 ) ) ;
AO22X1_LVT U18 ( .A1 ( S1[3] ) , .A2 ( S1S2mux ) , .A3 ( S2[3] ) , 
    .A4 ( n9 ) , .Y ( N11 ) ) ;
AO22X1_LVT U19 ( .A1 ( S1[4] ) , .A2 ( S1S2mux ) , .A3 ( S2[4] ) , 
    .A4 ( n9 ) , .Y ( N12 ) ) ;
AO22X1_LVT U20 ( .A1 ( S1[5] ) , .A2 ( S1S2mux ) , .A3 ( S2[5] ) , 
    .A4 ( n9 ) , .Y ( N13 ) ) ;
AO22X1_LVT U21 ( .A1 ( S1[6] ) , .A2 ( S1S2mux ) , .A3 ( S2[6] ) , 
    .A4 ( n9 ) , .Y ( N14 ) ) ;
AO22X1_LVT U22 ( .A1 ( S1[0] ) , .A2 ( S1S2mux ) , .A3 ( S2[0] ) , 
    .A4 ( n9 ) , .Y ( N8 ) ) ;
AO22X1_LVT U23 ( .A1 ( S1[1] ) , .A2 ( S1S2mux ) , .A3 ( S2[1] ) , 
    .A4 ( n9 ) , .Y ( N9 ) ) ;
endmodule


module PE_8_DW01_add_0 ( A , B , CI , SUM , CO ) ;
input  [8:0] A ;
input  [8:0] B ;
input  CI ;
output [8:0] SUM ;
output CO ;

wire [8:1] carry ;

FADDX1_LVT U1_7 ( .A ( A[7] ) , .B ( B[7] ) , .CI ( carry[7] ) , 
    .CO ( SUM[8] ) , .S ( SUM[7] ) ) ;
FADDX1_LVT U1_6 ( .A ( A[6] ) , .B ( B[6] ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( SUM[6] ) ) ;
FADDX1_LVT U1_5 ( .A ( A[5] ) , .B ( B[5] ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( SUM[5] ) ) ;
FADDX1_LVT U1_4 ( .A ( A[4] ) , .B ( B[4] ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( SUM[4] ) ) ;
FADDX1_LVT U1_3 ( .A ( A[3] ) , .B ( B[3] ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( SUM[3] ) ) ;
FADDX1_LVT U1_2 ( .A ( A[2] ) , .B ( B[2] ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( SUM[2] ) ) ;
FADDX1_LVT U1_1 ( .A ( A[1] ) , .B ( B[1] ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( SUM[1] ) ) ;
XOR2X1_LVT U1 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( SUM[0] ) ) ;
AND2X1_LVT U2 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( carry[1] ) ) ;
endmodule


module PE_8_DW01_sub_1 ( A , B , CI , DIFF , CO ) ;
input  [7:0] A ;
input  [7:0] B ;
input  CI ;
output [7:0] DIFF ;
output CO ;

wire [8:0] carry ;

FADDX1_LVT U2_1 ( .A ( A[1] ) , .B ( n1 ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( DIFF[1] ) ) ;
FADDX1_LVT U2_6 ( .A ( A[6] ) , .B ( n4 ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( DIFF[6] ) ) ;
FADDX1_LVT U2_5 ( .A ( A[5] ) , .B ( n5 ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( DIFF[5] ) ) ;
FADDX1_LVT U2_4 ( .A ( A[4] ) , .B ( n6 ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( DIFF[4] ) ) ;
FADDX1_LVT U2_3 ( .A ( A[3] ) , .B ( n7 ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( DIFF[3] ) ) ;
FADDX1_LVT U2_2 ( .A ( A[2] ) , .B ( n8 ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( DIFF[2] ) ) ;
FADDX1_LVT U2_7 ( .A ( A[7] ) , .B ( n3 ) , .CI ( carry[7] ) , 
    .S ( DIFF[7] ) ) ;
INVX1_LVT U1 ( .A ( B[7] ) , .Y ( n3 ) ) ;
INVX1_LVT U2 ( .A ( B[2] ) , .Y ( n8 ) ) ;
INVX1_LVT U3 ( .A ( B[3] ) , .Y ( n7 ) ) ;
INVX1_LVT U4 ( .A ( B[4] ) , .Y ( n6 ) ) ;
INVX1_LVT U5 ( .A ( B[5] ) , .Y ( n5 ) ) ;
INVX1_LVT U6 ( .A ( B[6] ) , .Y ( n4 ) ) ;
INVX1_LVT U7 ( .A ( B[0] ) , .Y ( n2 ) ) ;
XNOR2X1_LVT U8 ( .A1 ( A[0] ) , .A2 ( n2 ) , .Y ( DIFF[0] ) ) ;
INVX1_LVT U9 ( .A ( B[1] ) , .Y ( n1 ) ) ;
OR2X1_LVT U10 ( .A1 ( n2 ) , .A2 ( A[0] ) , .Y ( carry[1] ) ) ;
endmodule


module PE_7 ( clock , R , S1 , S2 , S1S2mux , newDist , Accumulate , Rpipe ) ;
input  clock ;
input  [7:0] R ;
input  [7:0] S1 ;
input  [7:0] S2 ;
input  S1S2mux ;
input  newDist ;
output [7:0] Accumulate ;
output [7:0] Rpipe ;

wire [7:0] AccumulateIn ;
wire [7:0] difference ;

PE_7_DW01_add_0 add_56 (
    .A ( { 1'b0 , Accumulate[7] , Accumulate[6] , Accumulate[5] , 
        Accumulate[4] , Accumulate[3] , Accumulate[2] , Accumulate[1] , 
        Accumulate[0] } ) ,
    .B ( { 1'b0 , difference[7] , difference[6] , difference[5] , 
        difference[4] , difference[3] , difference[2] , difference[1] , 
        difference[0] } ) ,
    .CI ( 1'b0 ) ,
    .SUM ( { Carry , N33 , N32 , N31 , N30 , N29 , N28 , N27 , N26 } ) ) ;
PE_7_DW01_sub_1 sub_50 ( .A ( R ) ,
    .B ( { N15 , N14 , N13 , N12 , N11 , N10 , N9 , N8 } ) ,
    .CI ( 1'b0 ) , .DIFF ( difference ) ) ;
DFFX1_LVT \Accumulate_reg[0] ( .D ( AccumulateIn[0] ) , .CLK ( clock ) , 
    .Q ( Accumulate[0] ) ) ;
DFFX1_LVT \Rpipe_reg[7] ( .D ( R[7] ) , .CLK ( clock ) , .Q ( Rpipe[7] ) ) ;
DFFX1_LVT \Rpipe_reg[6] ( .D ( R[6] ) , .CLK ( clock ) , .Q ( Rpipe[6] ) ) ;
DFFX1_LVT \Rpipe_reg[5] ( .D ( R[5] ) , .CLK ( clock ) , .Q ( Rpipe[5] ) ) ;
DFFX1_LVT \Rpipe_reg[4] ( .D ( R[4] ) , .CLK ( clock ) , .Q ( Rpipe[4] ) ) ;
DFFX1_LVT \Rpipe_reg[3] ( .D ( R[3] ) , .CLK ( clock ) , .Q ( Rpipe[3] ) ) ;
DFFX1_LVT \Rpipe_reg[2] ( .D ( R[2] ) , .CLK ( clock ) , .Q ( Rpipe[2] ) ) ;
DFFX1_LVT \Rpipe_reg[1] ( .D ( R[1] ) , .CLK ( clock ) , .Q ( Rpipe[1] ) ) ;
DFFX1_LVT \Accumulate_reg[7] ( .D ( AccumulateIn[7] ) , .CLK ( clock ) , 
    .Q ( Accumulate[7] ) ) ;
DFFX1_LVT \Accumulate_reg[6] ( .D ( AccumulateIn[6] ) , .CLK ( clock ) , 
    .Q ( Accumulate[6] ) ) ;
DFFX1_LVT \Accumulate_reg[5] ( .D ( AccumulateIn[5] ) , .CLK ( clock ) , 
    .Q ( Accumulate[5] ) ) ;
DFFX1_LVT \Accumulate_reg[4] ( .D ( AccumulateIn[4] ) , .CLK ( clock ) , 
    .Q ( Accumulate[4] ) ) ;
DFFX1_LVT \Accumulate_reg[3] ( .D ( AccumulateIn[3] ) , .CLK ( clock ) , 
    .Q ( Accumulate[3] ) ) ;
DFFX1_LVT \Accumulate_reg[2] ( .D ( AccumulateIn[2] ) , .CLK ( clock ) , 
    .Q ( Accumulate[2] ) ) ;
DFFX1_LVT \Accumulate_reg[1] ( .D ( AccumulateIn[1] ) , .CLK ( clock ) , 
    .Q ( Accumulate[1] ) ) ;
DFFX1_LVT \Rpipe_reg[0] ( .D ( R[0] ) , .CLK ( clock ) , .Q ( Rpipe[0] ) ) ;
INVX1_LVT U5 ( .A ( newDist ) , .Y ( n8 ) ) ;
INVX1_LVT U6 ( .A ( S1S2mux ) , .Y ( n9 ) ) ;
AND2X1_LVT U7 ( .A1 ( Carry ) , .A2 ( n8 ) , .Y ( n23 ) ) ;
AO221X1_LVT U8 ( .A1 ( N27 ) , .A2 ( n8 ) , .A3 ( difference[1] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[1] ) ) ;
AO221X1_LVT U9 ( .A1 ( N28 ) , .A2 ( n8 ) , .A3 ( difference[2] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[2] ) ) ;
AO221X1_LVT U10 ( .A1 ( N29 ) , .A2 ( n8 ) , .A3 ( difference[3] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[3] ) ) ;
AO221X1_LVT U11 ( .A1 ( N30 ) , .A2 ( n8 ) , .A3 ( difference[4] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[4] ) ) ;
AO221X1_LVT U12 ( .A1 ( N31 ) , .A2 ( n8 ) , .A3 ( difference[5] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[5] ) ) ;
AO221X1_LVT U13 ( .A1 ( N32 ) , .A2 ( n8 ) , .A3 ( difference[6] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[6] ) ) ;
AO221X1_LVT U14 ( .A1 ( N33 ) , .A2 ( n8 ) , .A3 ( newDist ) , 
    .A4 ( difference[7] ) , .A5 ( n23 ) , .Y ( AccumulateIn[7] ) ) ;
AO221X1_LVT U15 ( .A1 ( N26 ) , .A2 ( n8 ) , .A3 ( difference[0] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[0] ) ) ;
AO22X1_LVT U16 ( .A1 ( S1[7] ) , .A2 ( S1S2mux ) , .A3 ( S2[7] ) , 
    .A4 ( n9 ) , .Y ( N15 ) ) ;
AO22X1_LVT U17 ( .A1 ( S1[1] ) , .A2 ( S1S2mux ) , .A3 ( S2[1] ) , 
    .A4 ( n9 ) , .Y ( N9 ) ) ;
AO22X1_LVT U18 ( .A1 ( S1[2] ) , .A2 ( S1S2mux ) , .A3 ( S2[2] ) , 
    .A4 ( n9 ) , .Y ( N10 ) ) ;
AO22X1_LVT U19 ( .A1 ( S1[3] ) , .A2 ( S1S2mux ) , .A3 ( S2[3] ) , 
    .A4 ( n9 ) , .Y ( N11 ) ) ;
AO22X1_LVT U20 ( .A1 ( S1[4] ) , .A2 ( S1S2mux ) , .A3 ( S2[4] ) , 
    .A4 ( n9 ) , .Y ( N12 ) ) ;
AO22X1_LVT U21 ( .A1 ( S1[5] ) , .A2 ( S1S2mux ) , .A3 ( S2[5] ) , 
    .A4 ( n9 ) , .Y ( N13 ) ) ;
AO22X1_LVT U22 ( .A1 ( S1[6] ) , .A2 ( S1S2mux ) , .A3 ( S2[6] ) , 
    .A4 ( n9 ) , .Y ( N14 ) ) ;
AO22X1_LVT U23 ( .A1 ( S1[0] ) , .A2 ( S1S2mux ) , .A3 ( S2[0] ) , 
    .A4 ( n9 ) , .Y ( N8 ) ) ;
endmodule


module PE_7_DW01_add_0 ( A , B , CI , SUM , CO ) ;
input  [8:0] A ;
input  [8:0] B ;
input  CI ;
output [8:0] SUM ;
output CO ;

wire [8:1] carry ;

FADDX1_LVT U1_7 ( .A ( A[7] ) , .B ( B[7] ) , .CI ( carry[7] ) , 
    .CO ( SUM[8] ) , .S ( SUM[7] ) ) ;
FADDX1_LVT U1_6 ( .A ( A[6] ) , .B ( B[6] ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( SUM[6] ) ) ;
FADDX1_LVT U1_5 ( .A ( A[5] ) , .B ( B[5] ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( SUM[5] ) ) ;
FADDX1_LVT U1_4 ( .A ( A[4] ) , .B ( B[4] ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( SUM[4] ) ) ;
FADDX1_LVT U1_3 ( .A ( A[3] ) , .B ( B[3] ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( SUM[3] ) ) ;
FADDX1_LVT U1_2 ( .A ( A[2] ) , .B ( B[2] ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( SUM[2] ) ) ;
FADDX1_LVT U1_1 ( .A ( A[1] ) , .B ( B[1] ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( SUM[1] ) ) ;
XOR2X1_LVT U1 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( SUM[0] ) ) ;
AND2X1_LVT U2 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( carry[1] ) ) ;
endmodule


module PE_7_DW01_sub_1 ( A , B , CI , DIFF , CO ) ;
input  [7:0] A ;
input  [7:0] B ;
input  CI ;
output [7:0] DIFF ;
output CO ;

wire [8:0] carry ;

FADDX1_LVT U2_6 ( .A ( A[6] ) , .B ( n4 ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( DIFF[6] ) ) ;
FADDX1_LVT U2_5 ( .A ( A[5] ) , .B ( n5 ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( DIFF[5] ) ) ;
FADDX1_LVT U2_4 ( .A ( A[4] ) , .B ( n6 ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( DIFF[4] ) ) ;
FADDX1_LVT U2_3 ( .A ( A[3] ) , .B ( n7 ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( DIFF[3] ) ) ;
FADDX1_LVT U2_2 ( .A ( A[2] ) , .B ( n8 ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( DIFF[2] ) ) ;
FADDX1_LVT U2_1 ( .A ( A[1] ) , .B ( n1 ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( DIFF[1] ) ) ;
FADDX1_LVT U2_7 ( .A ( A[7] ) , .B ( n3 ) , .CI ( carry[7] ) , 
    .S ( DIFF[7] ) ) ;
INVX1_LVT U1 ( .A ( B[7] ) , .Y ( n3 ) ) ;
INVX1_LVT U2 ( .A ( B[1] ) , .Y ( n1 ) ) ;
OR2X1_LVT U3 ( .A1 ( n2 ) , .A2 ( A[0] ) , .Y ( carry[1] ) ) ;
INVX1_LVT U4 ( .A ( B[2] ) , .Y ( n8 ) ) ;
INVX1_LVT U5 ( .A ( B[3] ) , .Y ( n7 ) ) ;
INVX1_LVT U6 ( .A ( B[4] ) , .Y ( n6 ) ) ;
INVX1_LVT U7 ( .A ( B[5] ) , .Y ( n5 ) ) ;
INVX1_LVT U8 ( .A ( B[6] ) , .Y ( n4 ) ) ;
INVX1_LVT U9 ( .A ( B[0] ) , .Y ( n2 ) ) ;
XNOR2X1_LVT U10 ( .A1 ( A[0] ) , .A2 ( n2 ) , .Y ( DIFF[0] ) ) ;
endmodule


module PE_6 ( clock , R , S1 , S2 , S1S2mux , newDist , Accumulate , Rpipe ) ;
input  clock ;
input  [7:0] R ;
input  [7:0] S1 ;
input  [7:0] S2 ;
input  S1S2mux ;
input  newDist ;
output [7:0] Accumulate ;
output [7:0] Rpipe ;

wire [7:0] AccumulateIn ;
wire [7:0] difference ;

PE_6_DW01_add_0 add_56 (
    .A ( { 1'b0 , Accumulate[7] , Accumulate[6] , Accumulate[5] , 
        Accumulate[4] , Accumulate[3] , Accumulate[2] , Accumulate[1] , 
        Accumulate[0] } ) ,
    .B ( { 1'b0 , difference[7] , difference[6] , difference[5] , 
        difference[4] , difference[3] , difference[2] , difference[1] , 
        difference[0] } ) ,
    .CI ( 1'b0 ) ,
    .SUM ( { Carry , N33 , N32 , N31 , N30 , N29 , N28 , N27 , N26 } ) ) ;
PE_6_DW01_sub_1 sub_50 ( .A ( R ) ,
    .B ( { N15 , N14 , N13 , N12 , N11 , N10 , N9 , N8 } ) ,
    .CI ( 1'b0 ) , .DIFF ( difference ) ) ;
DFFX1_LVT \Accumulate_reg[0] ( .D ( AccumulateIn[0] ) , .CLK ( clock ) , 
    .Q ( Accumulate[0] ) ) ;
DFFX1_LVT \Rpipe_reg[7] ( .D ( R[7] ) , .CLK ( clock ) , .Q ( Rpipe[7] ) ) ;
DFFX1_LVT \Rpipe_reg[6] ( .D ( R[6] ) , .CLK ( clock ) , .Q ( Rpipe[6] ) ) ;
DFFX1_LVT \Rpipe_reg[5] ( .D ( R[5] ) , .CLK ( clock ) , .Q ( Rpipe[5] ) ) ;
DFFX1_LVT \Rpipe_reg[4] ( .D ( R[4] ) , .CLK ( clock ) , .Q ( Rpipe[4] ) ) ;
DFFX1_LVT \Rpipe_reg[3] ( .D ( R[3] ) , .CLK ( clock ) , .Q ( Rpipe[3] ) ) ;
DFFX1_LVT \Rpipe_reg[2] ( .D ( R[2] ) , .CLK ( clock ) , .Q ( Rpipe[2] ) ) ;
DFFX1_LVT \Rpipe_reg[1] ( .D ( R[1] ) , .CLK ( clock ) , .Q ( Rpipe[1] ) ) ;
DFFX1_LVT \Accumulate_reg[7] ( .D ( AccumulateIn[7] ) , .CLK ( clock ) , 
    .Q ( Accumulate[7] ) ) ;
DFFX1_LVT \Accumulate_reg[6] ( .D ( AccumulateIn[6] ) , .CLK ( clock ) , 
    .Q ( Accumulate[6] ) ) ;
DFFX1_LVT \Accumulate_reg[5] ( .D ( AccumulateIn[5] ) , .CLK ( clock ) , 
    .Q ( Accumulate[5] ) ) ;
DFFX1_LVT \Accumulate_reg[4] ( .D ( AccumulateIn[4] ) , .CLK ( clock ) , 
    .Q ( Accumulate[4] ) ) ;
DFFX1_LVT \Accumulate_reg[3] ( .D ( AccumulateIn[3] ) , .CLK ( clock ) , 
    .Q ( Accumulate[3] ) ) ;
DFFX1_LVT \Accumulate_reg[2] ( .D ( AccumulateIn[2] ) , .CLK ( clock ) , 
    .Q ( Accumulate[2] ) ) ;
DFFX1_LVT \Accumulate_reg[1] ( .D ( AccumulateIn[1] ) , .CLK ( clock ) , 
    .Q ( Accumulate[1] ) ) ;
DFFX1_LVT \Rpipe_reg[0] ( .D ( R[0] ) , .CLK ( clock ) , .Q ( Rpipe[0] ) ) ;
INVX1_LVT U5 ( .A ( newDist ) , .Y ( n8 ) ) ;
INVX1_LVT U6 ( .A ( S1S2mux ) , .Y ( n9 ) ) ;
AND2X1_LVT U7 ( .A1 ( Carry ) , .A2 ( n8 ) , .Y ( n23 ) ) ;
AO221X1_LVT U8 ( .A1 ( N27 ) , .A2 ( n8 ) , .A3 ( difference[1] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[1] ) ) ;
AO221X1_LVT U9 ( .A1 ( N28 ) , .A2 ( n8 ) , .A3 ( difference[2] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[2] ) ) ;
AO221X1_LVT U10 ( .A1 ( N29 ) , .A2 ( n8 ) , .A3 ( difference[3] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[3] ) ) ;
AO221X1_LVT U11 ( .A1 ( N30 ) , .A2 ( n8 ) , .A3 ( difference[4] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[4] ) ) ;
AO221X1_LVT U12 ( .A1 ( N31 ) , .A2 ( n8 ) , .A3 ( difference[5] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[5] ) ) ;
AO221X1_LVT U13 ( .A1 ( N32 ) , .A2 ( n8 ) , .A3 ( difference[6] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[6] ) ) ;
AO221X1_LVT U14 ( .A1 ( N33 ) , .A2 ( n8 ) , .A3 ( newDist ) , 
    .A4 ( difference[7] ) , .A5 ( n23 ) , .Y ( AccumulateIn[7] ) ) ;
AO221X1_LVT U15 ( .A1 ( N26 ) , .A2 ( n8 ) , .A3 ( difference[0] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[0] ) ) ;
AO22X1_LVT U16 ( .A1 ( S1[7] ) , .A2 ( S1S2mux ) , .A3 ( S2[7] ) , 
    .A4 ( n9 ) , .Y ( N15 ) ) ;
AO22X1_LVT U17 ( .A1 ( S1[1] ) , .A2 ( S1S2mux ) , .A3 ( S2[1] ) , 
    .A4 ( n9 ) , .Y ( N9 ) ) ;
AO22X1_LVT U18 ( .A1 ( S1[2] ) , .A2 ( S1S2mux ) , .A3 ( S2[2] ) , 
    .A4 ( n9 ) , .Y ( N10 ) ) ;
AO22X1_LVT U19 ( .A1 ( S1[3] ) , .A2 ( S1S2mux ) , .A3 ( S2[3] ) , 
    .A4 ( n9 ) , .Y ( N11 ) ) ;
AO22X1_LVT U20 ( .A1 ( S1[4] ) , .A2 ( S1S2mux ) , .A3 ( S2[4] ) , 
    .A4 ( n9 ) , .Y ( N12 ) ) ;
AO22X1_LVT U21 ( .A1 ( S1[5] ) , .A2 ( S1S2mux ) , .A3 ( S2[5] ) , 
    .A4 ( n9 ) , .Y ( N13 ) ) ;
AO22X1_LVT U22 ( .A1 ( S1[6] ) , .A2 ( S1S2mux ) , .A3 ( S2[6] ) , 
    .A4 ( n9 ) , .Y ( N14 ) ) ;
AO22X1_LVT U23 ( .A1 ( S1[0] ) , .A2 ( S1S2mux ) , .A3 ( S2[0] ) , 
    .A4 ( n9 ) , .Y ( N8 ) ) ;
endmodule


module PE_6_DW01_add_0 ( A , B , CI , SUM , CO ) ;
input  [8:0] A ;
input  [8:0] B ;
input  CI ;
output [8:0] SUM ;
output CO ;

wire [8:1] carry ;

FADDX1_LVT U1_7 ( .A ( A[7] ) , .B ( B[7] ) , .CI ( carry[7] ) , 
    .CO ( SUM[8] ) , .S ( SUM[7] ) ) ;
FADDX1_LVT U1_6 ( .A ( A[6] ) , .B ( B[6] ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( SUM[6] ) ) ;
FADDX1_LVT U1_5 ( .A ( A[5] ) , .B ( B[5] ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( SUM[5] ) ) ;
FADDX1_LVT U1_4 ( .A ( A[4] ) , .B ( B[4] ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( SUM[4] ) ) ;
FADDX1_LVT U1_3 ( .A ( A[3] ) , .B ( B[3] ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( SUM[3] ) ) ;
FADDX1_LVT U1_2 ( .A ( A[2] ) , .B ( B[2] ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( SUM[2] ) ) ;
FADDX1_LVT U1_1 ( .A ( A[1] ) , .B ( B[1] ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( SUM[1] ) ) ;
XOR2X1_LVT U1 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( SUM[0] ) ) ;
AND2X1_LVT U2 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( carry[1] ) ) ;
endmodule


module PE_6_DW01_sub_1 ( A , B , CI , DIFF , CO ) ;
input  [7:0] A ;
input  [7:0] B ;
input  CI ;
output [7:0] DIFF ;
output CO ;

wire [8:0] carry ;

FADDX1_LVT U2_6 ( .A ( A[6] ) , .B ( n4 ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( DIFF[6] ) ) ;
FADDX1_LVT U2_5 ( .A ( A[5] ) , .B ( n5 ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( DIFF[5] ) ) ;
FADDX1_LVT U2_4 ( .A ( A[4] ) , .B ( n6 ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( DIFF[4] ) ) ;
FADDX1_LVT U2_3 ( .A ( A[3] ) , .B ( n7 ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( DIFF[3] ) ) ;
FADDX1_LVT U2_2 ( .A ( A[2] ) , .B ( n8 ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( DIFF[2] ) ) ;
FADDX1_LVT U2_1 ( .A ( A[1] ) , .B ( n1 ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( DIFF[1] ) ) ;
FADDX1_LVT U2_7 ( .A ( A[7] ) , .B ( n3 ) , .CI ( carry[7] ) , 
    .S ( DIFF[7] ) ) ;
INVX1_LVT U1 ( .A ( B[7] ) , .Y ( n3 ) ) ;
INVX1_LVT U2 ( .A ( B[1] ) , .Y ( n1 ) ) ;
OR2X1_LVT U3 ( .A1 ( n2 ) , .A2 ( A[0] ) , .Y ( carry[1] ) ) ;
INVX1_LVT U4 ( .A ( B[2] ) , .Y ( n8 ) ) ;
INVX1_LVT U5 ( .A ( B[3] ) , .Y ( n7 ) ) ;
INVX1_LVT U6 ( .A ( B[4] ) , .Y ( n6 ) ) ;
INVX1_LVT U7 ( .A ( B[5] ) , .Y ( n5 ) ) ;
INVX1_LVT U8 ( .A ( B[6] ) , .Y ( n4 ) ) ;
INVX1_LVT U9 ( .A ( B[0] ) , .Y ( n2 ) ) ;
XNOR2X1_LVT U10 ( .A1 ( A[0] ) , .A2 ( n2 ) , .Y ( DIFF[0] ) ) ;
endmodule


module PE_5 ( clock , R , S1 , S2 , S1S2mux , newDist , Accumulate , Rpipe ) ;
input  clock ;
input  [7:0] R ;
input  [7:0] S1 ;
input  [7:0] S2 ;
input  S1S2mux ;
input  newDist ;
output [7:0] Accumulate ;
output [7:0] Rpipe ;

wire [7:0] AccumulateIn ;
wire [7:0] difference ;

PE_5_DW01_add_0 add_56 (
    .A ( { 1'b0 , Accumulate[7] , Accumulate[6] , Accumulate[5] , 
        Accumulate[4] , Accumulate[3] , Accumulate[2] , Accumulate[1] , 
        Accumulate[0] } ) ,
    .B ( { 1'b0 , difference[7] , difference[6] , difference[5] , 
        difference[4] , difference[3] , difference[2] , difference[1] , 
        difference[0] } ) ,
    .CI ( 1'b0 ) ,
    .SUM ( { Carry , N33 , N32 , N31 , N30 , N29 , N28 , N27 , N26 } ) ) ;
PE_5_DW01_sub_1 sub_50 ( .A ( R ) ,
    .B ( { N15 , N14 , N13 , N12 , N11 , N10 , N9 , N8 } ) ,
    .CI ( 1'b0 ) , .DIFF ( difference ) ) ;
DFFX1_LVT \Accumulate_reg[0] ( .D ( AccumulateIn[0] ) , .CLK ( clock ) , 
    .Q ( Accumulate[0] ) ) ;
DFFX1_LVT \Rpipe_reg[7] ( .D ( R[7] ) , .CLK ( clock ) , .Q ( Rpipe[7] ) ) ;
DFFX1_LVT \Rpipe_reg[6] ( .D ( R[6] ) , .CLK ( clock ) , .Q ( Rpipe[6] ) ) ;
DFFX1_LVT \Rpipe_reg[5] ( .D ( R[5] ) , .CLK ( clock ) , .Q ( Rpipe[5] ) ) ;
DFFX1_LVT \Rpipe_reg[4] ( .D ( R[4] ) , .CLK ( clock ) , .Q ( Rpipe[4] ) ) ;
DFFX1_LVT \Rpipe_reg[3] ( .D ( R[3] ) , .CLK ( clock ) , .Q ( Rpipe[3] ) ) ;
DFFX1_LVT \Rpipe_reg[2] ( .D ( R[2] ) , .CLK ( clock ) , .Q ( Rpipe[2] ) ) ;
DFFX1_LVT \Rpipe_reg[1] ( .D ( R[1] ) , .CLK ( clock ) , .Q ( Rpipe[1] ) ) ;
DFFX1_LVT \Accumulate_reg[7] ( .D ( AccumulateIn[7] ) , .CLK ( clock ) , 
    .Q ( Accumulate[7] ) ) ;
DFFX1_LVT \Accumulate_reg[6] ( .D ( AccumulateIn[6] ) , .CLK ( clock ) , 
    .Q ( Accumulate[6] ) ) ;
DFFX1_LVT \Accumulate_reg[5] ( .D ( AccumulateIn[5] ) , .CLK ( clock ) , 
    .Q ( Accumulate[5] ) ) ;
DFFX1_LVT \Accumulate_reg[4] ( .D ( AccumulateIn[4] ) , .CLK ( clock ) , 
    .Q ( Accumulate[4] ) ) ;
DFFX1_LVT \Accumulate_reg[3] ( .D ( AccumulateIn[3] ) , .CLK ( clock ) , 
    .Q ( Accumulate[3] ) ) ;
DFFX1_LVT \Accumulate_reg[2] ( .D ( AccumulateIn[2] ) , .CLK ( clock ) , 
    .Q ( Accumulate[2] ) ) ;
DFFX1_LVT \Accumulate_reg[1] ( .D ( AccumulateIn[1] ) , .CLK ( clock ) , 
    .Q ( Accumulate[1] ) ) ;
DFFX1_LVT \Rpipe_reg[0] ( .D ( R[0] ) , .CLK ( clock ) , .Q ( Rpipe[0] ) ) ;
INVX1_LVT U5 ( .A ( newDist ) , .Y ( n8 ) ) ;
INVX1_LVT U6 ( .A ( S1S2mux ) , .Y ( n9 ) ) ;
AND2X1_LVT U7 ( .A1 ( Carry ) , .A2 ( n8 ) , .Y ( n23 ) ) ;
AO221X1_LVT U8 ( .A1 ( N27 ) , .A2 ( n8 ) , .A3 ( difference[1] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[1] ) ) ;
AO221X1_LVT U9 ( .A1 ( N28 ) , .A2 ( n8 ) , .A3 ( difference[2] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[2] ) ) ;
AO221X1_LVT U10 ( .A1 ( N29 ) , .A2 ( n8 ) , .A3 ( difference[3] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[3] ) ) ;
AO221X1_LVT U11 ( .A1 ( N30 ) , .A2 ( n8 ) , .A3 ( difference[4] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[4] ) ) ;
AO221X1_LVT U12 ( .A1 ( N31 ) , .A2 ( n8 ) , .A3 ( difference[5] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[5] ) ) ;
AO221X1_LVT U13 ( .A1 ( N32 ) , .A2 ( n8 ) , .A3 ( difference[6] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[6] ) ) ;
AO221X1_LVT U14 ( .A1 ( N33 ) , .A2 ( n8 ) , .A3 ( newDist ) , 
    .A4 ( difference[7] ) , .A5 ( n23 ) , .Y ( AccumulateIn[7] ) ) ;
AO221X1_LVT U15 ( .A1 ( N26 ) , .A2 ( n8 ) , .A3 ( difference[0] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[0] ) ) ;
AO22X1_LVT U16 ( .A1 ( S1[7] ) , .A2 ( S1S2mux ) , .A3 ( S2[7] ) , 
    .A4 ( n9 ) , .Y ( N15 ) ) ;
AO22X1_LVT U17 ( .A1 ( S1[1] ) , .A2 ( S1S2mux ) , .A3 ( S2[1] ) , 
    .A4 ( n9 ) , .Y ( N9 ) ) ;
AO22X1_LVT U18 ( .A1 ( S1[2] ) , .A2 ( S1S2mux ) , .A3 ( S2[2] ) , 
    .A4 ( n9 ) , .Y ( N10 ) ) ;
AO22X1_LVT U19 ( .A1 ( S1[3] ) , .A2 ( S1S2mux ) , .A3 ( S2[3] ) , 
    .A4 ( n9 ) , .Y ( N11 ) ) ;
AO22X1_LVT U20 ( .A1 ( S1[4] ) , .A2 ( S1S2mux ) , .A3 ( S2[4] ) , 
    .A4 ( n9 ) , .Y ( N12 ) ) ;
AO22X1_LVT U21 ( .A1 ( S1[5] ) , .A2 ( S1S2mux ) , .A3 ( S2[5] ) , 
    .A4 ( n9 ) , .Y ( N13 ) ) ;
AO22X1_LVT U22 ( .A1 ( S1[6] ) , .A2 ( S1S2mux ) , .A3 ( S2[6] ) , 
    .A4 ( n9 ) , .Y ( N14 ) ) ;
AO22X1_LVT U23 ( .A1 ( S1[0] ) , .A2 ( S1S2mux ) , .A3 ( S2[0] ) , 
    .A4 ( n9 ) , .Y ( N8 ) ) ;
endmodule


module PE_5_DW01_add_0 ( A , B , CI , SUM , CO ) ;
input  [8:0] A ;
input  [8:0] B ;
input  CI ;
output [8:0] SUM ;
output CO ;

wire [8:1] carry ;

FADDX1_LVT U1_7 ( .A ( A[7] ) , .B ( B[7] ) , .CI ( carry[7] ) , 
    .CO ( SUM[8] ) , .S ( SUM[7] ) ) ;
FADDX1_LVT U1_6 ( .A ( A[6] ) , .B ( B[6] ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( SUM[6] ) ) ;
FADDX1_LVT U1_5 ( .A ( A[5] ) , .B ( B[5] ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( SUM[5] ) ) ;
FADDX1_LVT U1_4 ( .A ( A[4] ) , .B ( B[4] ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( SUM[4] ) ) ;
FADDX1_LVT U1_3 ( .A ( A[3] ) , .B ( B[3] ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( SUM[3] ) ) ;
FADDX1_LVT U1_2 ( .A ( A[2] ) , .B ( B[2] ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( SUM[2] ) ) ;
FADDX1_LVT U1_1 ( .A ( A[1] ) , .B ( B[1] ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( SUM[1] ) ) ;
XOR2X1_LVT U1 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( SUM[0] ) ) ;
AND2X1_LVT U2 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( carry[1] ) ) ;
endmodule


module PE_5_DW01_sub_1 ( A , B , CI , DIFF , CO ) ;
input  [7:0] A ;
input  [7:0] B ;
input  CI ;
output [7:0] DIFF ;
output CO ;

wire [8:0] carry ;

FADDX1_LVT U2_6 ( .A ( A[6] ) , .B ( n4 ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( DIFF[6] ) ) ;
FADDX1_LVT U2_5 ( .A ( A[5] ) , .B ( n5 ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( DIFF[5] ) ) ;
FADDX1_LVT U2_4 ( .A ( A[4] ) , .B ( n6 ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( DIFF[4] ) ) ;
FADDX1_LVT U2_3 ( .A ( A[3] ) , .B ( n7 ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( DIFF[3] ) ) ;
FADDX1_LVT U2_2 ( .A ( A[2] ) , .B ( n8 ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( DIFF[2] ) ) ;
FADDX1_LVT U2_1 ( .A ( A[1] ) , .B ( n1 ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( DIFF[1] ) ) ;
FADDX1_LVT U2_7 ( .A ( A[7] ) , .B ( n3 ) , .CI ( carry[7] ) , 
    .S ( DIFF[7] ) ) ;
INVX1_LVT U1 ( .A ( B[7] ) , .Y ( n3 ) ) ;
INVX1_LVT U2 ( .A ( B[1] ) , .Y ( n1 ) ) ;
OR2X1_LVT U3 ( .A1 ( n2 ) , .A2 ( A[0] ) , .Y ( carry[1] ) ) ;
INVX1_LVT U4 ( .A ( B[2] ) , .Y ( n8 ) ) ;
INVX1_LVT U5 ( .A ( B[3] ) , .Y ( n7 ) ) ;
INVX1_LVT U6 ( .A ( B[4] ) , .Y ( n6 ) ) ;
INVX1_LVT U7 ( .A ( B[5] ) , .Y ( n5 ) ) ;
INVX1_LVT U8 ( .A ( B[6] ) , .Y ( n4 ) ) ;
INVX1_LVT U9 ( .A ( B[0] ) , .Y ( n2 ) ) ;
XNOR2X1_LVT U10 ( .A1 ( A[0] ) , .A2 ( n2 ) , .Y ( DIFF[0] ) ) ;
endmodule


module PE_4 ( clock , R , S1 , S2 , S1S2mux , newDist , Accumulate , Rpipe ) ;
input  clock ;
input  [7:0] R ;
input  [7:0] S1 ;
input  [7:0] S2 ;
input  S1S2mux ;
input  newDist ;
output [7:0] Accumulate ;
output [7:0] Rpipe ;

wire [7:0] AccumulateIn ;
wire [7:0] difference ;

PE_4_DW01_add_0 add_56 (
    .A ( { 1'b0 , Accumulate[7] , Accumulate[6] , Accumulate[5] , 
        Accumulate[4] , Accumulate[3] , Accumulate[2] , Accumulate[1] , 
        Accumulate[0] } ) ,
    .B ( { 1'b0 , difference[7] , difference[6] , difference[5] , 
        difference[4] , difference[3] , difference[2] , difference[1] , 
        difference[0] } ) ,
    .CI ( 1'b0 ) ,
    .SUM ( { Carry , N33 , N32 , N31 , N30 , N29 , N28 , N27 , N26 } ) ) ;
PE_4_DW01_sub_1 sub_50 ( .A ( R ) ,
    .B ( { N15 , N14 , N13 , N12 , N11 , N10 , N9 , N8 } ) ,
    .CI ( 1'b0 ) , .DIFF ( difference ) ) ;
DFFX1_LVT \Accumulate_reg[0] ( .D ( AccumulateIn[0] ) , .CLK ( clock ) , 
    .Q ( Accumulate[0] ) ) ;
DFFX1_LVT \Rpipe_reg[7] ( .D ( R[7] ) , .CLK ( clock ) , .Q ( Rpipe[7] ) ) ;
DFFX1_LVT \Rpipe_reg[6] ( .D ( R[6] ) , .CLK ( clock ) , .Q ( Rpipe[6] ) ) ;
DFFX1_LVT \Rpipe_reg[5] ( .D ( R[5] ) , .CLK ( clock ) , .Q ( Rpipe[5] ) ) ;
DFFX1_LVT \Rpipe_reg[4] ( .D ( R[4] ) , .CLK ( clock ) , .Q ( Rpipe[4] ) ) ;
DFFX1_LVT \Rpipe_reg[3] ( .D ( R[3] ) , .CLK ( clock ) , .Q ( Rpipe[3] ) ) ;
DFFX1_LVT \Rpipe_reg[2] ( .D ( R[2] ) , .CLK ( clock ) , .Q ( Rpipe[2] ) ) ;
DFFX1_LVT \Rpipe_reg[1] ( .D ( R[1] ) , .CLK ( clock ) , .Q ( Rpipe[1] ) ) ;
DFFX1_LVT \Accumulate_reg[7] ( .D ( AccumulateIn[7] ) , .CLK ( clock ) , 
    .Q ( Accumulate[7] ) ) ;
DFFX1_LVT \Accumulate_reg[6] ( .D ( AccumulateIn[6] ) , .CLK ( clock ) , 
    .Q ( Accumulate[6] ) ) ;
DFFX1_LVT \Accumulate_reg[5] ( .D ( AccumulateIn[5] ) , .CLK ( clock ) , 
    .Q ( Accumulate[5] ) ) ;
DFFX1_LVT \Accumulate_reg[4] ( .D ( AccumulateIn[4] ) , .CLK ( clock ) , 
    .Q ( Accumulate[4] ) ) ;
DFFX1_LVT \Accumulate_reg[3] ( .D ( AccumulateIn[3] ) , .CLK ( clock ) , 
    .Q ( Accumulate[3] ) ) ;
DFFX1_LVT \Accumulate_reg[2] ( .D ( AccumulateIn[2] ) , .CLK ( clock ) , 
    .Q ( Accumulate[2] ) ) ;
DFFX1_LVT \Accumulate_reg[1] ( .D ( AccumulateIn[1] ) , .CLK ( clock ) , 
    .Q ( Accumulate[1] ) ) ;
DFFX1_LVT \Rpipe_reg[0] ( .D ( R[0] ) , .CLK ( clock ) , .Q ( Rpipe[0] ) ) ;
INVX1_LVT U5 ( .A ( S1S2mux ) , .Y ( n9 ) ) ;
INVX1_LVT U6 ( .A ( newDist ) , .Y ( n8 ) ) ;
AND2X1_LVT U7 ( .A1 ( Carry ) , .A2 ( n8 ) , .Y ( n23 ) ) ;
AO221X1_LVT U8 ( .A1 ( N27 ) , .A2 ( n8 ) , .A3 ( difference[1] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[1] ) ) ;
AO221X1_LVT U9 ( .A1 ( N28 ) , .A2 ( n8 ) , .A3 ( difference[2] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[2] ) ) ;
AO221X1_LVT U10 ( .A1 ( N29 ) , .A2 ( n8 ) , .A3 ( difference[3] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[3] ) ) ;
AO221X1_LVT U11 ( .A1 ( N30 ) , .A2 ( n8 ) , .A3 ( difference[4] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[4] ) ) ;
AO221X1_LVT U12 ( .A1 ( N31 ) , .A2 ( n8 ) , .A3 ( difference[5] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[5] ) ) ;
AO221X1_LVT U13 ( .A1 ( N32 ) , .A2 ( n8 ) , .A3 ( difference[6] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[6] ) ) ;
AO221X1_LVT U14 ( .A1 ( N33 ) , .A2 ( n8 ) , .A3 ( newDist ) , 
    .A4 ( difference[7] ) , .A5 ( n23 ) , .Y ( AccumulateIn[7] ) ) ;
AO221X1_LVT U15 ( .A1 ( N26 ) , .A2 ( n8 ) , .A3 ( difference[0] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[0] ) ) ;
AO22X1_LVT U16 ( .A1 ( S1[7] ) , .A2 ( S1S2mux ) , .A3 ( S2[7] ) , 
    .A4 ( n9 ) , .Y ( N15 ) ) ;
AO22X1_LVT U17 ( .A1 ( S1[1] ) , .A2 ( S1S2mux ) , .A3 ( S2[1] ) , 
    .A4 ( n9 ) , .Y ( N9 ) ) ;
AO22X1_LVT U18 ( .A1 ( S1[2] ) , .A2 ( S1S2mux ) , .A3 ( S2[2] ) , 
    .A4 ( n9 ) , .Y ( N10 ) ) ;
AO22X1_LVT U19 ( .A1 ( S1[3] ) , .A2 ( S1S2mux ) , .A3 ( S2[3] ) , 
    .A4 ( n9 ) , .Y ( N11 ) ) ;
AO22X1_LVT U20 ( .A1 ( S1[4] ) , .A2 ( S1S2mux ) , .A3 ( S2[4] ) , 
    .A4 ( n9 ) , .Y ( N12 ) ) ;
AO22X1_LVT U21 ( .A1 ( S1[5] ) , .A2 ( S1S2mux ) , .A3 ( S2[5] ) , 
    .A4 ( n9 ) , .Y ( N13 ) ) ;
AO22X1_LVT U22 ( .A1 ( S1[6] ) , .A2 ( S1S2mux ) , .A3 ( S2[6] ) , 
    .A4 ( n9 ) , .Y ( N14 ) ) ;
AO22X1_LVT U23 ( .A1 ( S1[0] ) , .A2 ( S1S2mux ) , .A3 ( S2[0] ) , 
    .A4 ( n9 ) , .Y ( N8 ) ) ;
endmodule


module PE_4_DW01_add_0 ( A , B , CI , SUM , CO ) ;
input  [8:0] A ;
input  [8:0] B ;
input  CI ;
output [8:0] SUM ;
output CO ;

wire [8:1] carry ;

FADDX1_LVT U1_7 ( .A ( A[7] ) , .B ( B[7] ) , .CI ( carry[7] ) , 
    .CO ( SUM[8] ) , .S ( SUM[7] ) ) ;
FADDX1_LVT U1_6 ( .A ( A[6] ) , .B ( B[6] ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( SUM[6] ) ) ;
FADDX1_LVT U1_5 ( .A ( A[5] ) , .B ( B[5] ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( SUM[5] ) ) ;
FADDX1_LVT U1_4 ( .A ( A[4] ) , .B ( B[4] ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( SUM[4] ) ) ;
FADDX1_LVT U1_3 ( .A ( A[3] ) , .B ( B[3] ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( SUM[3] ) ) ;
FADDX1_LVT U1_2 ( .A ( A[2] ) , .B ( B[2] ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( SUM[2] ) ) ;
FADDX1_LVT U1_1 ( .A ( A[1] ) , .B ( B[1] ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( SUM[1] ) ) ;
XOR2X1_LVT U1 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( SUM[0] ) ) ;
AND2X1_LVT U2 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( carry[1] ) ) ;
endmodule


module PE_4_DW01_sub_1 ( A , B , CI , DIFF , CO ) ;
input  [7:0] A ;
input  [7:0] B ;
input  CI ;
output [7:0] DIFF ;
output CO ;

wire [8:0] carry ;

FADDX1_LVT U2_6 ( .A ( A[6] ) , .B ( n4 ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( DIFF[6] ) ) ;
FADDX1_LVT U2_5 ( .A ( A[5] ) , .B ( n5 ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( DIFF[5] ) ) ;
FADDX1_LVT U2_4 ( .A ( A[4] ) , .B ( n6 ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( DIFF[4] ) ) ;
FADDX1_LVT U2_3 ( .A ( A[3] ) , .B ( n7 ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( DIFF[3] ) ) ;
FADDX1_LVT U2_2 ( .A ( A[2] ) , .B ( n8 ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( DIFF[2] ) ) ;
FADDX1_LVT U2_1 ( .A ( A[1] ) , .B ( n1 ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( DIFF[1] ) ) ;
FADDX1_LVT U2_7 ( .A ( A[7] ) , .B ( n3 ) , .CI ( carry[7] ) , 
    .S ( DIFF[7] ) ) ;
INVX1_LVT U1 ( .A ( B[7] ) , .Y ( n3 ) ) ;
INVX1_LVT U2 ( .A ( B[1] ) , .Y ( n1 ) ) ;
OR2X1_LVT U3 ( .A1 ( n2 ) , .A2 ( A[0] ) , .Y ( carry[1] ) ) ;
INVX1_LVT U4 ( .A ( B[2] ) , .Y ( n8 ) ) ;
INVX1_LVT U5 ( .A ( B[3] ) , .Y ( n7 ) ) ;
INVX1_LVT U6 ( .A ( B[4] ) , .Y ( n6 ) ) ;
INVX1_LVT U7 ( .A ( B[5] ) , .Y ( n5 ) ) ;
INVX1_LVT U8 ( .A ( B[6] ) , .Y ( n4 ) ) ;
INVX1_LVT U9 ( .A ( B[0] ) , .Y ( n2 ) ) ;
XNOR2X1_LVT U10 ( .A1 ( A[0] ) , .A2 ( n2 ) , .Y ( DIFF[0] ) ) ;
endmodule


module PE_3 ( clock , R , S1 , S2 , S1S2mux , newDist , Accumulate , Rpipe ) ;
input  clock ;
input  [7:0] R ;
input  [7:0] S1 ;
input  [7:0] S2 ;
input  S1S2mux ;
input  newDist ;
output [7:0] Accumulate ;
output [7:0] Rpipe ;

wire [7:0] AccumulateIn ;
wire [7:0] difference ;

PE_3_DW01_add_0 add_56 (
    .A ( { 1'b0 , Accumulate[7] , Accumulate[6] , Accumulate[5] , 
        Accumulate[4] , Accumulate[3] , Accumulate[2] , Accumulate[1] , 
        Accumulate[0] } ) ,
    .B ( { 1'b0 , difference[7] , difference[6] , difference[5] , 
        difference[4] , difference[3] , difference[2] , difference[1] , 
        difference[0] } ) ,
    .CI ( 1'b0 ) ,
    .SUM ( { Carry , N33 , N32 , N31 , N30 , N29 , N28 , N27 , N26 } ) ) ;
PE_3_DW01_sub_1 sub_50 ( .A ( R ) ,
    .B ( { N15 , N14 , N13 , N12 , N11 , N10 , N9 , N8 } ) ,
    .CI ( 1'b0 ) , .DIFF ( difference ) ) ;
DFFX1_LVT \Accumulate_reg[0] ( .D ( AccumulateIn[0] ) , .CLK ( clock ) , 
    .Q ( Accumulate[0] ) ) ;
DFFX1_LVT \Rpipe_reg[7] ( .D ( R[7] ) , .CLK ( clock ) , .Q ( Rpipe[7] ) ) ;
DFFX1_LVT \Rpipe_reg[6] ( .D ( R[6] ) , .CLK ( clock ) , .Q ( Rpipe[6] ) ) ;
DFFX1_LVT \Rpipe_reg[5] ( .D ( R[5] ) , .CLK ( clock ) , .Q ( Rpipe[5] ) ) ;
DFFX1_LVT \Rpipe_reg[4] ( .D ( R[4] ) , .CLK ( clock ) , .Q ( Rpipe[4] ) ) ;
DFFX1_LVT \Rpipe_reg[3] ( .D ( R[3] ) , .CLK ( clock ) , .Q ( Rpipe[3] ) ) ;
DFFX1_LVT \Rpipe_reg[2] ( .D ( R[2] ) , .CLK ( clock ) , .Q ( Rpipe[2] ) ) ;
DFFX1_LVT \Rpipe_reg[1] ( .D ( R[1] ) , .CLK ( clock ) , .Q ( Rpipe[1] ) ) ;
DFFX1_LVT \Accumulate_reg[7] ( .D ( AccumulateIn[7] ) , .CLK ( clock ) , 
    .Q ( Accumulate[7] ) ) ;
DFFX1_LVT \Accumulate_reg[6] ( .D ( AccumulateIn[6] ) , .CLK ( clock ) , 
    .Q ( Accumulate[6] ) ) ;
DFFX1_LVT \Accumulate_reg[5] ( .D ( AccumulateIn[5] ) , .CLK ( clock ) , 
    .Q ( Accumulate[5] ) ) ;
DFFX1_LVT \Accumulate_reg[4] ( .D ( AccumulateIn[4] ) , .CLK ( clock ) , 
    .Q ( Accumulate[4] ) ) ;
DFFX1_LVT \Accumulate_reg[3] ( .D ( AccumulateIn[3] ) , .CLK ( clock ) , 
    .Q ( Accumulate[3] ) ) ;
DFFX1_LVT \Accumulate_reg[2] ( .D ( AccumulateIn[2] ) , .CLK ( clock ) , 
    .Q ( Accumulate[2] ) ) ;
DFFX1_LVT \Accumulate_reg[1] ( .D ( AccumulateIn[1] ) , .CLK ( clock ) , 
    .Q ( Accumulate[1] ) ) ;
DFFX1_LVT \Rpipe_reg[0] ( .D ( R[0] ) , .CLK ( clock ) , .Q ( Rpipe[0] ) ) ;
INVX1_LVT U5 ( .A ( newDist ) , .Y ( n8 ) ) ;
INVX1_LVT U6 ( .A ( S1S2mux ) , .Y ( n9 ) ) ;
AO221X1_LVT U7 ( .A1 ( N28 ) , .A2 ( n8 ) , .A3 ( difference[2] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[2] ) ) ;
AO221X1_LVT U8 ( .A1 ( N29 ) , .A2 ( n8 ) , .A3 ( difference[3] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[3] ) ) ;
AO221X1_LVT U9 ( .A1 ( N30 ) , .A2 ( n8 ) , .A3 ( difference[4] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[4] ) ) ;
AO221X1_LVT U10 ( .A1 ( N31 ) , .A2 ( n8 ) , .A3 ( difference[5] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[5] ) ) ;
AO221X1_LVT U11 ( .A1 ( N32 ) , .A2 ( n8 ) , .A3 ( difference[6] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[6] ) ) ;
AO221X1_LVT U12 ( .A1 ( N33 ) , .A2 ( n8 ) , .A3 ( newDist ) , 
    .A4 ( difference[7] ) , .A5 ( n23 ) , .Y ( AccumulateIn[7] ) ) ;
AO221X1_LVT U13 ( .A1 ( N27 ) , .A2 ( n8 ) , .A3 ( difference[1] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[1] ) ) ;
AND2X1_LVT U14 ( .A1 ( Carry ) , .A2 ( n8 ) , .Y ( n23 ) ) ;
AO221X1_LVT U15 ( .A1 ( N26 ) , .A2 ( n8 ) , .A3 ( difference[0] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[0] ) ) ;
AO22X1_LVT U16 ( .A1 ( S1[7] ) , .A2 ( S1S2mux ) , .A3 ( S2[7] ) , 
    .A4 ( n9 ) , .Y ( N15 ) ) ;
AO22X1_LVT U17 ( .A1 ( S1[1] ) , .A2 ( S1S2mux ) , .A3 ( S2[1] ) , 
    .A4 ( n9 ) , .Y ( N9 ) ) ;
AO22X1_LVT U18 ( .A1 ( S1[2] ) , .A2 ( S1S2mux ) , .A3 ( S2[2] ) , 
    .A4 ( n9 ) , .Y ( N10 ) ) ;
AO22X1_LVT U19 ( .A1 ( S1[3] ) , .A2 ( S1S2mux ) , .A3 ( S2[3] ) , 
    .A4 ( n9 ) , .Y ( N11 ) ) ;
AO22X1_LVT U20 ( .A1 ( S1[4] ) , .A2 ( S1S2mux ) , .A3 ( S2[4] ) , 
    .A4 ( n9 ) , .Y ( N12 ) ) ;
AO22X1_LVT U21 ( .A1 ( S1[5] ) , .A2 ( S1S2mux ) , .A3 ( S2[5] ) , 
    .A4 ( n9 ) , .Y ( N13 ) ) ;
AO22X1_LVT U22 ( .A1 ( S1[6] ) , .A2 ( S1S2mux ) , .A3 ( S2[6] ) , 
    .A4 ( n9 ) , .Y ( N14 ) ) ;
AO22X1_LVT U23 ( .A1 ( S1[0] ) , .A2 ( S1S2mux ) , .A3 ( S2[0] ) , 
    .A4 ( n9 ) , .Y ( N8 ) ) ;
endmodule


module PE_3_DW01_add_0 ( A , B , CI , SUM , CO ) ;
input  [8:0] A ;
input  [8:0] B ;
input  CI ;
output [8:0] SUM ;
output CO ;

wire [8:1] carry ;

FADDX1_LVT U1_7 ( .A ( A[7] ) , .B ( B[7] ) , .CI ( carry[7] ) , 
    .CO ( SUM[8] ) , .S ( SUM[7] ) ) ;
FADDX1_LVT U1_6 ( .A ( A[6] ) , .B ( B[6] ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( SUM[6] ) ) ;
FADDX1_LVT U1_5 ( .A ( A[5] ) , .B ( B[5] ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( SUM[5] ) ) ;
FADDX1_LVT U1_4 ( .A ( A[4] ) , .B ( B[4] ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( SUM[4] ) ) ;
FADDX1_LVT U1_3 ( .A ( A[3] ) , .B ( B[3] ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( SUM[3] ) ) ;
FADDX1_LVT U1_2 ( .A ( A[2] ) , .B ( B[2] ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( SUM[2] ) ) ;
FADDX1_LVT U1_1 ( .A ( A[1] ) , .B ( B[1] ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( SUM[1] ) ) ;
XOR2X1_LVT U1 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( SUM[0] ) ) ;
AND2X1_LVT U2 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( carry[1] ) ) ;
endmodule


module PE_3_DW01_sub_1 ( A , B , CI , DIFF , CO ) ;
input  [7:0] A ;
input  [7:0] B ;
input  CI ;
output [7:0] DIFF ;
output CO ;

wire [8:0] carry ;

FADDX1_LVT U2_6 ( .A ( A[6] ) , .B ( n4 ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( DIFF[6] ) ) ;
FADDX1_LVT U2_5 ( .A ( A[5] ) , .B ( n5 ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( DIFF[5] ) ) ;
FADDX1_LVT U2_4 ( .A ( A[4] ) , .B ( n6 ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( DIFF[4] ) ) ;
FADDX1_LVT U2_3 ( .A ( A[3] ) , .B ( n7 ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( DIFF[3] ) ) ;
FADDX1_LVT U2_2 ( .A ( A[2] ) , .B ( n8 ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( DIFF[2] ) ) ;
FADDX1_LVT U2_1 ( .A ( A[1] ) , .B ( n1 ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( DIFF[1] ) ) ;
FADDX1_LVT U2_7 ( .A ( A[7] ) , .B ( n3 ) , .CI ( carry[7] ) , 
    .S ( DIFF[7] ) ) ;
INVX1_LVT U1 ( .A ( B[7] ) , .Y ( n3 ) ) ;
INVX1_LVT U2 ( .A ( B[1] ) , .Y ( n1 ) ) ;
OR2X1_LVT U3 ( .A1 ( n2 ) , .A2 ( A[0] ) , .Y ( carry[1] ) ) ;
INVX1_LVT U4 ( .A ( B[2] ) , .Y ( n8 ) ) ;
INVX1_LVT U5 ( .A ( B[3] ) , .Y ( n7 ) ) ;
INVX1_LVT U6 ( .A ( B[4] ) , .Y ( n6 ) ) ;
INVX1_LVT U7 ( .A ( B[5] ) , .Y ( n5 ) ) ;
INVX1_LVT U8 ( .A ( B[6] ) , .Y ( n4 ) ) ;
XNOR2X1_LVT U9 ( .A1 ( A[0] ) , .A2 ( n2 ) , .Y ( DIFF[0] ) ) ;
INVX1_LVT U10 ( .A ( B[0] ) , .Y ( n2 ) ) ;
endmodule


module PE_2 ( clock , R , S1 , S2 , S1S2mux , newDist , Accumulate , Rpipe ) ;
input  clock ;
input  [7:0] R ;
input  [7:0] S1 ;
input  [7:0] S2 ;
input  S1S2mux ;
input  newDist ;
output [7:0] Accumulate ;
output [7:0] Rpipe ;

wire [7:0] AccumulateIn ;
wire [7:0] difference ;

PE_2_DW01_add_0 add_56 (
    .A ( { 1'b0 , Accumulate[7] , Accumulate[6] , Accumulate[5] , 
        Accumulate[4] , Accumulate[3] , Accumulate[2] , Accumulate[1] , 
        Accumulate[0] } ) ,
    .B ( { 1'b0 , difference[7] , difference[6] , difference[5] , 
        difference[4] , difference[3] , difference[2] , difference[1] , 
        difference[0] } ) ,
    .CI ( 1'b0 ) ,
    .SUM ( { Carry , N33 , N32 , N31 , N30 , N29 , N28 , N27 , N26 } ) ) ;
PE_2_DW01_sub_1 sub_50 ( .A ( R ) ,
    .B ( { N15 , N14 , N13 , N12 , N11 , N10 , N9 , N8 } ) ,
    .CI ( 1'b0 ) , .DIFF ( difference ) ) ;
DFFX1_LVT \Accumulate_reg[0] ( .D ( AccumulateIn[0] ) , .CLK ( clock ) , 
    .Q ( Accumulate[0] ) ) ;
DFFX1_LVT \Accumulate_reg[7] ( .D ( AccumulateIn[7] ) , .CLK ( clock ) , 
    .Q ( Accumulate[7] ) ) ;
DFFX1_LVT \Accumulate_reg[6] ( .D ( AccumulateIn[6] ) , .CLK ( clock ) , 
    .Q ( Accumulate[6] ) ) ;
DFFX1_LVT \Accumulate_reg[5] ( .D ( AccumulateIn[5] ) , .CLK ( clock ) , 
    .Q ( Accumulate[5] ) ) ;
DFFX1_LVT \Accumulate_reg[4] ( .D ( AccumulateIn[4] ) , .CLK ( clock ) , 
    .Q ( Accumulate[4] ) ) ;
DFFX1_LVT \Accumulate_reg[3] ( .D ( AccumulateIn[3] ) , .CLK ( clock ) , 
    .Q ( Accumulate[3] ) ) ;
DFFX1_LVT \Accumulate_reg[2] ( .D ( AccumulateIn[2] ) , .CLK ( clock ) , 
    .Q ( Accumulate[2] ) ) ;
DFFX1_LVT \Accumulate_reg[1] ( .D ( AccumulateIn[1] ) , .CLK ( clock ) , 
    .Q ( Accumulate[1] ) ) ;
DFFX1_LVT \Rpipe_reg[7] ( .D ( R[7] ) , .CLK ( clock ) , .Q ( Rpipe[7] ) ) ;
DFFX1_LVT \Rpipe_reg[6] ( .D ( R[6] ) , .CLK ( clock ) , .Q ( Rpipe[6] ) ) ;
DFFX1_LVT \Rpipe_reg[5] ( .D ( R[5] ) , .CLK ( clock ) , .Q ( Rpipe[5] ) ) ;
DFFX1_LVT \Rpipe_reg[4] ( .D ( R[4] ) , .CLK ( clock ) , .Q ( Rpipe[4] ) ) ;
DFFX1_LVT \Rpipe_reg[3] ( .D ( R[3] ) , .CLK ( clock ) , .Q ( Rpipe[3] ) ) ;
DFFX1_LVT \Rpipe_reg[2] ( .D ( R[2] ) , .CLK ( clock ) , .Q ( Rpipe[2] ) ) ;
DFFX1_LVT \Rpipe_reg[1] ( .D ( R[1] ) , .CLK ( clock ) , .Q ( Rpipe[1] ) ) ;
DFFX1_LVT \Rpipe_reg[0] ( .D ( R[0] ) , .CLK ( clock ) , .Q ( Rpipe[0] ) ) ;
INVX1_LVT U5 ( .A ( S1S2mux ) , .Y ( n9 ) ) ;
INVX1_LVT U6 ( .A ( newDist ) , .Y ( n8 ) ) ;
AO221X1_LVT U7 ( .A1 ( N28 ) , .A2 ( n8 ) , .A3 ( difference[2] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[2] ) ) ;
AO221X1_LVT U8 ( .A1 ( N29 ) , .A2 ( n8 ) , .A3 ( difference[3] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[3] ) ) ;
AO221X1_LVT U9 ( .A1 ( N30 ) , .A2 ( n8 ) , .A3 ( difference[4] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[4] ) ) ;
AO221X1_LVT U10 ( .A1 ( N31 ) , .A2 ( n8 ) , .A3 ( difference[5] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[5] ) ) ;
AO221X1_LVT U11 ( .A1 ( N32 ) , .A2 ( n8 ) , .A3 ( difference[6] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[6] ) ) ;
AO221X1_LVT U12 ( .A1 ( N33 ) , .A2 ( n8 ) , .A3 ( newDist ) , 
    .A4 ( difference[7] ) , .A5 ( n23 ) , .Y ( AccumulateIn[7] ) ) ;
AO221X1_LVT U13 ( .A1 ( N27 ) , .A2 ( n8 ) , .A3 ( difference[1] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[1] ) ) ;
AND2X1_LVT U14 ( .A1 ( Carry ) , .A2 ( n8 ) , .Y ( n23 ) ) ;
AO221X1_LVT U15 ( .A1 ( N26 ) , .A2 ( n8 ) , .A3 ( difference[0] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[0] ) ) ;
AO22X1_LVT U16 ( .A1 ( S1[7] ) , .A2 ( S1S2mux ) , .A3 ( S2[7] ) , 
    .A4 ( n9 ) , .Y ( N15 ) ) ;
AO22X1_LVT U17 ( .A1 ( S1[1] ) , .A2 ( S1S2mux ) , .A3 ( S2[1] ) , 
    .A4 ( n9 ) , .Y ( N9 ) ) ;
AO22X1_LVT U18 ( .A1 ( S1[2] ) , .A2 ( S1S2mux ) , .A3 ( S2[2] ) , 
    .A4 ( n9 ) , .Y ( N10 ) ) ;
AO22X1_LVT U19 ( .A1 ( S1[3] ) , .A2 ( S1S2mux ) , .A3 ( S2[3] ) , 
    .A4 ( n9 ) , .Y ( N11 ) ) ;
AO22X1_LVT U20 ( .A1 ( S1[4] ) , .A2 ( S1S2mux ) , .A3 ( S2[4] ) , 
    .A4 ( n9 ) , .Y ( N12 ) ) ;
AO22X1_LVT U21 ( .A1 ( S1[5] ) , .A2 ( S1S2mux ) , .A3 ( S2[5] ) , 
    .A4 ( n9 ) , .Y ( N13 ) ) ;
AO22X1_LVT U22 ( .A1 ( S1[6] ) , .A2 ( S1S2mux ) , .A3 ( S2[6] ) , 
    .A4 ( n9 ) , .Y ( N14 ) ) ;
AO22X1_LVT U23 ( .A1 ( S1[0] ) , .A2 ( S1S2mux ) , .A3 ( S2[0] ) , 
    .A4 ( n9 ) , .Y ( N8 ) ) ;
endmodule


module PE_2_DW01_add_0 ( A , B , CI , SUM , CO ) ;
input  [8:0] A ;
input  [8:0] B ;
input  CI ;
output [8:0] SUM ;
output CO ;

wire [8:1] carry ;

FADDX1_LVT U1_7 ( .A ( A[7] ) , .B ( B[7] ) , .CI ( carry[7] ) , 
    .CO ( SUM[8] ) , .S ( SUM[7] ) ) ;
FADDX1_LVT U1_6 ( .A ( A[6] ) , .B ( B[6] ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( SUM[6] ) ) ;
FADDX1_LVT U1_5 ( .A ( A[5] ) , .B ( B[5] ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( SUM[5] ) ) ;
FADDX1_LVT U1_4 ( .A ( A[4] ) , .B ( B[4] ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( SUM[4] ) ) ;
FADDX1_LVT U1_3 ( .A ( A[3] ) , .B ( B[3] ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( SUM[3] ) ) ;
FADDX1_LVT U1_2 ( .A ( A[2] ) , .B ( B[2] ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( SUM[2] ) ) ;
FADDX1_LVT U1_1 ( .A ( A[1] ) , .B ( B[1] ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( SUM[1] ) ) ;
XOR2X1_LVT U1 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( SUM[0] ) ) ;
AND2X1_LVT U2 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( carry[1] ) ) ;
endmodule


module PE_2_DW01_sub_1 ( A , B , CI , DIFF , CO ) ;
input  [7:0] A ;
input  [7:0] B ;
input  CI ;
output [7:0] DIFF ;
output CO ;

wire [8:0] carry ;

FADDX1_LVT U2_6 ( .A ( A[6] ) , .B ( n4 ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( DIFF[6] ) ) ;
FADDX1_LVT U2_5 ( .A ( A[5] ) , .B ( n5 ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( DIFF[5] ) ) ;
FADDX1_LVT U2_4 ( .A ( A[4] ) , .B ( n6 ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( DIFF[4] ) ) ;
FADDX1_LVT U2_3 ( .A ( A[3] ) , .B ( n7 ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( DIFF[3] ) ) ;
FADDX1_LVT U2_2 ( .A ( A[2] ) , .B ( n8 ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( DIFF[2] ) ) ;
FADDX1_LVT U2_1 ( .A ( A[1] ) , .B ( n1 ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( DIFF[1] ) ) ;
FADDX1_LVT U2_7 ( .A ( A[7] ) , .B ( n3 ) , .CI ( carry[7] ) , 
    .S ( DIFF[7] ) ) ;
INVX1_LVT U1 ( .A ( B[7] ) , .Y ( n3 ) ) ;
INVX1_LVT U2 ( .A ( B[1] ) , .Y ( n1 ) ) ;
OR2X1_LVT U3 ( .A1 ( n2 ) , .A2 ( A[0] ) , .Y ( carry[1] ) ) ;
INVX1_LVT U4 ( .A ( B[2] ) , .Y ( n8 ) ) ;
INVX1_LVT U5 ( .A ( B[3] ) , .Y ( n7 ) ) ;
INVX1_LVT U6 ( .A ( B[4] ) , .Y ( n6 ) ) ;
INVX1_LVT U7 ( .A ( B[5] ) , .Y ( n5 ) ) ;
INVX1_LVT U8 ( .A ( B[6] ) , .Y ( n4 ) ) ;
INVX1_LVT U9 ( .A ( B[0] ) , .Y ( n2 ) ) ;
XNOR2X1_LVT U10 ( .A1 ( A[0] ) , .A2 ( n2 ) , .Y ( DIFF[0] ) ) ;
endmodule


module PE_1 ( clock , R , S1 , S2 , S1S2mux , newDist , Accumulate , Rpipe ) ;
input  clock ;
input  [7:0] R ;
input  [7:0] S1 ;
input  [7:0] S2 ;
input  S1S2mux ;
input  newDist ;
output [7:0] Accumulate ;
output [7:0] Rpipe ;

wire [7:0] AccumulateIn ;
wire [7:0] difference ;

PE_1_DW01_add_0 add_56 (
    .A ( { 1'b0 , Accumulate[7] , Accumulate[6] , Accumulate[5] , 
        Accumulate[4] , Accumulate[3] , Accumulate[2] , Accumulate[1] , 
        Accumulate[0] } ) ,
    .B ( { 1'b0 , difference[7] , difference[6] , difference[5] , 
        difference[4] , difference[3] , difference[2] , difference[1] , 
        difference[0] } ) ,
    .CI ( 1'b0 ) ,
    .SUM ( { Carry , N33 , N32 , N31 , N30 , N29 , N28 , N27 , N26 } ) ) ;
PE_1_DW01_sub_1 sub_50 ( .A ( R ) ,
    .B ( { N15 , N14 , N13 , N12 , N11 , N10 , N9 , N8 } ) ,
    .CI ( 1'b0 ) , .DIFF ( difference ) ) ;
DFFX1_LVT \Rpipe_reg[7] ( .D ( R[7] ) , .CLK ( clock ) , .Q ( Rpipe[7] ) ) ;
DFFX1_LVT \Rpipe_reg[6] ( .D ( R[6] ) , .CLK ( clock ) , .Q ( Rpipe[6] ) ) ;
DFFX1_LVT \Rpipe_reg[5] ( .D ( R[5] ) , .CLK ( clock ) , .Q ( Rpipe[5] ) ) ;
DFFX1_LVT \Rpipe_reg[4] ( .D ( R[4] ) , .CLK ( clock ) , .Q ( Rpipe[4] ) ) ;
DFFX1_LVT \Rpipe_reg[3] ( .D ( R[3] ) , .CLK ( clock ) , .Q ( Rpipe[3] ) ) ;
DFFX1_LVT \Rpipe_reg[2] ( .D ( R[2] ) , .CLK ( clock ) , .Q ( Rpipe[2] ) ) ;
DFFX1_LVT \Rpipe_reg[1] ( .D ( R[1] ) , .CLK ( clock ) , .Q ( Rpipe[1] ) ) ;
DFFX1_LVT \Rpipe_reg[0] ( .D ( R[0] ) , .CLK ( clock ) , .Q ( Rpipe[0] ) ) ;
DFFX1_LVT \Accumulate_reg[0] ( .D ( AccumulateIn[0] ) , .CLK ( clock ) , 
    .Q ( Accumulate[0] ) ) ;
DFFX1_LVT \Accumulate_reg[7] ( .D ( AccumulateIn[7] ) , .CLK ( clock ) , 
    .Q ( Accumulate[7] ) ) ;
DFFX1_LVT \Accumulate_reg[6] ( .D ( AccumulateIn[6] ) , .CLK ( clock ) , 
    .Q ( Accumulate[6] ) ) ;
DFFX1_LVT \Accumulate_reg[5] ( .D ( AccumulateIn[5] ) , .CLK ( clock ) , 
    .Q ( Accumulate[5] ) ) ;
DFFX1_LVT \Accumulate_reg[4] ( .D ( AccumulateIn[4] ) , .CLK ( clock ) , 
    .Q ( Accumulate[4] ) ) ;
DFFX1_LVT \Accumulate_reg[3] ( .D ( AccumulateIn[3] ) , .CLK ( clock ) , 
    .Q ( Accumulate[3] ) ) ;
DFFX1_LVT \Accumulate_reg[2] ( .D ( AccumulateIn[2] ) , .CLK ( clock ) , 
    .Q ( Accumulate[2] ) ) ;
DFFX1_LVT \Accumulate_reg[1] ( .D ( AccumulateIn[1] ) , .CLK ( clock ) , 
    .Q ( Accumulate[1] ) ) ;
INVX1_LVT U5 ( .A ( S1S2mux ) , .Y ( n9 ) ) ;
AO221X1_LVT U6 ( .A1 ( N28 ) , .A2 ( n8 ) , .A3 ( difference[2] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[2] ) ) ;
AO221X1_LVT U7 ( .A1 ( N29 ) , .A2 ( n8 ) , .A3 ( difference[3] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[3] ) ) ;
AO221X1_LVT U8 ( .A1 ( N30 ) , .A2 ( n8 ) , .A3 ( difference[4] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[4] ) ) ;
AO221X1_LVT U9 ( .A1 ( N31 ) , .A2 ( n8 ) , .A3 ( difference[5] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[5] ) ) ;
AO221X1_LVT U10 ( .A1 ( N32 ) , .A2 ( n8 ) , .A3 ( difference[6] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[6] ) ) ;
AO221X1_LVT U11 ( .A1 ( N33 ) , .A2 ( n8 ) , .A3 ( newDist ) , 
    .A4 ( difference[7] ) , .A5 ( n23 ) , .Y ( AccumulateIn[7] ) ) ;
AO221X1_LVT U12 ( .A1 ( N27 ) , .A2 ( n8 ) , .A3 ( difference[1] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[1] ) ) ;
AND2X1_LVT U13 ( .A1 ( Carry ) , .A2 ( n8 ) , .Y ( n23 ) ) ;
INVX1_LVT U14 ( .A ( newDist ) , .Y ( n8 ) ) ;
AO221X1_LVT U15 ( .A1 ( N26 ) , .A2 ( n8 ) , .A3 ( difference[0] ) , 
    .A4 ( newDist ) , .A5 ( n23 ) , .Y ( AccumulateIn[0] ) ) ;
AO22X1_LVT U16 ( .A1 ( S1[7] ) , .A2 ( S1S2mux ) , .A3 ( S2[7] ) , 
    .A4 ( n9 ) , .Y ( N15 ) ) ;
AO22X1_LVT U17 ( .A1 ( S1[1] ) , .A2 ( S1S2mux ) , .A3 ( S2[1] ) , 
    .A4 ( n9 ) , .Y ( N9 ) ) ;
AO22X1_LVT U18 ( .A1 ( S1[2] ) , .A2 ( S1S2mux ) , .A3 ( S2[2] ) , 
    .A4 ( n9 ) , .Y ( N10 ) ) ;
AO22X1_LVT U19 ( .A1 ( S1[3] ) , .A2 ( S1S2mux ) , .A3 ( S2[3] ) , 
    .A4 ( n9 ) , .Y ( N11 ) ) ;
AO22X1_LVT U20 ( .A1 ( S1[4] ) , .A2 ( S1S2mux ) , .A3 ( S2[4] ) , 
    .A4 ( n9 ) , .Y ( N12 ) ) ;
AO22X1_LVT U21 ( .A1 ( S1[5] ) , .A2 ( S1S2mux ) , .A3 ( S2[5] ) , 
    .A4 ( n9 ) , .Y ( N13 ) ) ;
AO22X1_LVT U22 ( .A1 ( S1[6] ) , .A2 ( S1S2mux ) , .A3 ( S2[6] ) , 
    .A4 ( n9 ) , .Y ( N14 ) ) ;
AO22X1_LVT U23 ( .A1 ( S1[0] ) , .A2 ( S1S2mux ) , .A3 ( S2[0] ) , 
    .A4 ( n9 ) , .Y ( N8 ) ) ;
endmodule


module PE_1_DW01_add_0 ( A , B , CI , SUM , CO ) ;
input  [8:0] A ;
input  [8:0] B ;
input  CI ;
output [8:0] SUM ;
output CO ;

wire [8:1] carry ;

FADDX1_LVT U1_7 ( .A ( A[7] ) , .B ( B[7] ) , .CI ( carry[7] ) , 
    .CO ( SUM[8] ) , .S ( SUM[7] ) ) ;
FADDX1_LVT U1_6 ( .A ( A[6] ) , .B ( B[6] ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( SUM[6] ) ) ;
FADDX1_LVT U1_5 ( .A ( A[5] ) , .B ( B[5] ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( SUM[5] ) ) ;
FADDX1_LVT U1_4 ( .A ( A[4] ) , .B ( B[4] ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( SUM[4] ) ) ;
FADDX1_LVT U1_3 ( .A ( A[3] ) , .B ( B[3] ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( SUM[3] ) ) ;
FADDX1_LVT U1_2 ( .A ( A[2] ) , .B ( B[2] ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( SUM[2] ) ) ;
FADDX1_LVT U1_1 ( .A ( A[1] ) , .B ( B[1] ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( SUM[1] ) ) ;
XOR2X1_LVT U1 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( SUM[0] ) ) ;
AND2X1_LVT U2 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( carry[1] ) ) ;
endmodule


module PE_1_DW01_sub_1 ( A , B , CI , DIFF , CO ) ;
input  [7:0] A ;
input  [7:0] B ;
input  CI ;
output [7:0] DIFF ;
output CO ;

wire [8:0] carry ;

FADDX1_LVT U2_6 ( .A ( A[6] ) , .B ( n4 ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( DIFF[6] ) ) ;
FADDX1_LVT U2_5 ( .A ( A[5] ) , .B ( n5 ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( DIFF[5] ) ) ;
FADDX1_LVT U2_4 ( .A ( A[4] ) , .B ( n6 ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( DIFF[4] ) ) ;
FADDX1_LVT U2_3 ( .A ( A[3] ) , .B ( n7 ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( DIFF[3] ) ) ;
FADDX1_LVT U2_2 ( .A ( A[2] ) , .B ( n8 ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( DIFF[2] ) ) ;
FADDX1_LVT U2_1 ( .A ( A[1] ) , .B ( n1 ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( DIFF[1] ) ) ;
FADDX1_LVT U2_7 ( .A ( A[7] ) , .B ( n3 ) , .CI ( carry[7] ) , 
    .S ( DIFF[7] ) ) ;
INVX1_LVT U1 ( .A ( B[7] ) , .Y ( n3 ) ) ;
INVX1_LVT U2 ( .A ( B[1] ) , .Y ( n1 ) ) ;
OR2X1_LVT U3 ( .A1 ( n2 ) , .A2 ( A[0] ) , .Y ( carry[1] ) ) ;
INVX1_LVT U4 ( .A ( B[2] ) , .Y ( n8 ) ) ;
INVX1_LVT U5 ( .A ( B[3] ) , .Y ( n7 ) ) ;
INVX1_LVT U6 ( .A ( B[4] ) , .Y ( n6 ) ) ;
INVX1_LVT U7 ( .A ( B[5] ) , .Y ( n5 ) ) ;
INVX1_LVT U8 ( .A ( B[6] ) , .Y ( n4 ) ) ;
INVX1_LVT U9 ( .A ( B[0] ) , .Y ( n2 ) ) ;
XNOR2X1_LVT U10 ( .A1 ( A[0] ) , .A2 ( n2 ) , .Y ( DIFF[0] ) ) ;
endmodule


module PEend ( clock , R , S1 , S2 , S1S2mux , newDist , Accumulate ) ;
input  clock ;
input  [7:0] R ;
input  [7:0] S1 ;
input  [7:0] S2 ;
input  S1S2mux ;
input  newDist ;
output [7:0] Accumulate ;

wire [7:0] AccumulateIn ;
wire [7:0] difference ;

PEend_DW01_add_0 add_81 (
    .A ( { 1'b0 , Accumulate[7] , Accumulate[6] , Accumulate[5] , 
        Accumulate[4] , Accumulate[3] , Accumulate[2] , Accumulate[1] , 
        Accumulate[0] } ) ,
    .B ( { 1'b0 , difference[7] , difference[6] , difference[5] , 
        difference[4] , difference[3] , difference[2] , difference[1] , 
        difference[0] } ) ,
    .CI ( 1'b0 ) ,
    .SUM ( { Carry , N33 , N32 , N31 , N30 , N29 , N28 , N27 , N26 } ) ) ;
PEend_DW01_sub_1 sub_75 ( .A ( R ) ,
    .B ( { N15 , N14 , N13 , N12 , N11 , N10 , N9 , N8 } ) ,
    .CI ( 1'b0 ) , .DIFF ( difference ) ) ;
DFFX1_LVT \Accumulate_reg[0] ( .D ( AccumulateIn[0] ) , .CLK ( clock ) , 
    .Q ( Accumulate[0] ) ) ;
DFFX1_LVT \Accumulate_reg[7] ( .D ( AccumulateIn[7] ) , .CLK ( clock ) , 
    .Q ( Accumulate[7] ) ) ;
DFFX1_LVT \Accumulate_reg[6] ( .D ( AccumulateIn[6] ) , .CLK ( clock ) , 
    .Q ( Accumulate[6] ) ) ;
DFFX1_LVT \Accumulate_reg[5] ( .D ( AccumulateIn[5] ) , .CLK ( clock ) , 
    .Q ( Accumulate[5] ) ) ;
DFFX1_LVT \Accumulate_reg[4] ( .D ( AccumulateIn[4] ) , .CLK ( clock ) , 
    .Q ( Accumulate[4] ) ) ;
DFFX1_LVT \Accumulate_reg[3] ( .D ( AccumulateIn[3] ) , .CLK ( clock ) , 
    .Q ( Accumulate[3] ) ) ;
DFFX1_LVT \Accumulate_reg[2] ( .D ( AccumulateIn[2] ) , .CLK ( clock ) , 
    .Q ( Accumulate[2] ) ) ;
DFFX1_LVT \Accumulate_reg[1] ( .D ( AccumulateIn[1] ) , .CLK ( clock ) , 
    .Q ( Accumulate[1] ) ) ;
INVX1_LVT U5 ( .A ( newDist ) , .Y ( n1 ) ) ;
AND2X1_LVT U6 ( .A1 ( Carry ) , .A2 ( n1 ) , .Y ( n15 ) ) ;
AO221X1_LVT U7 ( .A1 ( N27 ) , .A2 ( n1 ) , .A3 ( difference[1] ) , 
    .A4 ( newDist ) , .A5 ( n15 ) , .Y ( AccumulateIn[1] ) ) ;
AO221X1_LVT U8 ( .A1 ( N28 ) , .A2 ( n1 ) , .A3 ( difference[2] ) , 
    .A4 ( newDist ) , .A5 ( n15 ) , .Y ( AccumulateIn[2] ) ) ;
AO221X1_LVT U9 ( .A1 ( N29 ) , .A2 ( n1 ) , .A3 ( difference[3] ) , 
    .A4 ( newDist ) , .A5 ( n15 ) , .Y ( AccumulateIn[3] ) ) ;
AO221X1_LVT U10 ( .A1 ( N30 ) , .A2 ( n1 ) , .A3 ( difference[4] ) , 
    .A4 ( newDist ) , .A5 ( n15 ) , .Y ( AccumulateIn[4] ) ) ;
AO221X1_LVT U11 ( .A1 ( N31 ) , .A2 ( n1 ) , .A3 ( difference[5] ) , 
    .A4 ( newDist ) , .A5 ( n15 ) , .Y ( AccumulateIn[5] ) ) ;
AO221X1_LVT U12 ( .A1 ( N32 ) , .A2 ( n1 ) , .A3 ( difference[6] ) , 
    .A4 ( newDist ) , .A5 ( n15 ) , .Y ( AccumulateIn[6] ) ) ;
AO221X1_LVT U13 ( .A1 ( N33 ) , .A2 ( n1 ) , .A3 ( newDist ) , 
    .A4 ( difference[7] ) , .A5 ( n15 ) , .Y ( AccumulateIn[7] ) ) ;
AO22X1_LVT U14 ( .A1 ( S1[1] ) , .A2 ( S1S2mux ) , .A3 ( S2[1] ) , 
    .A4 ( n4 ) , .Y ( N9 ) ) ;
AO22X1_LVT U15 ( .A1 ( S1[2] ) , .A2 ( S1S2mux ) , .A3 ( S2[2] ) , 
    .A4 ( n4 ) , .Y ( N10 ) ) ;
AO22X1_LVT U16 ( .A1 ( S1[3] ) , .A2 ( S1S2mux ) , .A3 ( S2[3] ) , 
    .A4 ( n4 ) , .Y ( N11 ) ) ;
AO22X1_LVT U17 ( .A1 ( S1[4] ) , .A2 ( S1S2mux ) , .A3 ( S2[4] ) , 
    .A4 ( n4 ) , .Y ( N12 ) ) ;
AO22X1_LVT U18 ( .A1 ( S1[5] ) , .A2 ( S1S2mux ) , .A3 ( S2[5] ) , 
    .A4 ( n4 ) , .Y ( N13 ) ) ;
AO22X1_LVT U19 ( .A1 ( S1[6] ) , .A2 ( S1S2mux ) , .A3 ( S2[6] ) , 
    .A4 ( n4 ) , .Y ( N14 ) ) ;
AO22X1_LVT U20 ( .A1 ( S1[7] ) , .A2 ( S1S2mux ) , .A3 ( S2[7] ) , 
    .A4 ( n4 ) , .Y ( N15 ) ) ;
AO221X1_LVT U21 ( .A1 ( N26 ) , .A2 ( n1 ) , .A3 ( difference[0] ) , 
    .A4 ( newDist ) , .A5 ( n15 ) , .Y ( AccumulateIn[0] ) ) ;
AO22X1_LVT U22 ( .A1 ( S1[0] ) , .A2 ( S1S2mux ) , .A3 ( S2[0] ) , 
    .A4 ( n4 ) , .Y ( N8 ) ) ;
INVX1_LVT U23 ( .A ( S1S2mux ) , .Y ( n4 ) ) ;
endmodule


module PEend_DW01_add_0 ( A , B , CI , SUM , CO ) ;
input  [8:0] A ;
input  [8:0] B ;
input  CI ;
output [8:0] SUM ;
output CO ;

wire [8:1] carry ;

FADDX1_LVT U1_7 ( .A ( A[7] ) , .B ( B[7] ) , .CI ( carry[7] ) , 
    .CO ( SUM[8] ) , .S ( SUM[7] ) ) ;
FADDX1_LVT U1_6 ( .A ( A[6] ) , .B ( B[6] ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( SUM[6] ) ) ;
FADDX1_LVT U1_5 ( .A ( A[5] ) , .B ( B[5] ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( SUM[5] ) ) ;
FADDX1_LVT U1_4 ( .A ( A[4] ) , .B ( B[4] ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( SUM[4] ) ) ;
FADDX1_LVT U1_3 ( .A ( A[3] ) , .B ( B[3] ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( SUM[3] ) ) ;
FADDX1_LVT U1_2 ( .A ( A[2] ) , .B ( B[2] ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( SUM[2] ) ) ;
FADDX1_LVT U1_1 ( .A ( A[1] ) , .B ( B[1] ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( SUM[1] ) ) ;
XOR2X1_LVT U1 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( SUM[0] ) ) ;
AND2X1_LVT U2 ( .A1 ( A[0] ) , .A2 ( B[0] ) , .Y ( carry[1] ) ) ;
endmodule


module PEend_DW01_sub_1 ( A , B , CI , DIFF , CO ) ;
input  [7:0] A ;
input  [7:0] B ;
input  CI ;
output [7:0] DIFF ;
output CO ;

wire [8:0] carry ;

FADDX1_LVT U2_7 ( .A ( A[7] ) , .B ( n3 ) , .CI ( carry[7] ) , 
    .S ( DIFF[7] ) ) ;
FADDX1_LVT U2_6 ( .A ( A[6] ) , .B ( n4 ) , .CI ( carry[6] ) , 
    .CO ( carry[7] ) , .S ( DIFF[6] ) ) ;
FADDX1_LVT U2_5 ( .A ( A[5] ) , .B ( n5 ) , .CI ( carry[5] ) , 
    .CO ( carry[6] ) , .S ( DIFF[5] ) ) ;
FADDX1_LVT U2_4 ( .A ( A[4] ) , .B ( n6 ) , .CI ( carry[4] ) , 
    .CO ( carry[5] ) , .S ( DIFF[4] ) ) ;
FADDX1_LVT U2_3 ( .A ( A[3] ) , .B ( n7 ) , .CI ( carry[3] ) , 
    .CO ( carry[4] ) , .S ( DIFF[3] ) ) ;
FADDX1_LVT U2_2 ( .A ( A[2] ) , .B ( n8 ) , .CI ( carry[2] ) , 
    .CO ( carry[3] ) , .S ( DIFF[2] ) ) ;
FADDX1_LVT U2_1 ( .A ( A[1] ) , .B ( n1 ) , .CI ( carry[1] ) , 
    .CO ( carry[2] ) , .S ( DIFF[1] ) ) ;
INVX1_LVT U1 ( .A ( B[1] ) , .Y ( n1 ) ) ;
OR2X1_LVT U2 ( .A1 ( n2 ) , .A2 ( A[0] ) , .Y ( carry[1] ) ) ;
INVX1_LVT U3 ( .A ( B[2] ) , .Y ( n8 ) ) ;
INVX1_LVT U4 ( .A ( B[3] ) , .Y ( n7 ) ) ;
INVX1_LVT U5 ( .A ( B[4] ) , .Y ( n6 ) ) ;
INVX1_LVT U6 ( .A ( B[5] ) , .Y ( n5 ) ) ;
INVX1_LVT U7 ( .A ( B[6] ) , .Y ( n4 ) ) ;
INVX1_LVT U8 ( .A ( B[7] ) , .Y ( n3 ) ) ;
XNOR2X1_LVT U9 ( .A1 ( A[0] ) , .A2 ( n2 ) , .Y ( DIFF[0] ) ) ;
INVX1_LVT U10 ( .A ( B[0] ) , .Y ( n2 ) ) ;
endmodule


module Comparator ( clock , CompStart , PEout , PEready , vectorX , vectorY , 
    BestDist , motionX , motionY ) ;
input  clock ;
input  CompStart ;
input  [127:0] PEout ;
input  [15:0] PEready ;
input  [3:0] vectorX ;
input  [3:0] vectorY ;
output [7:0] BestDist ;
output [3:0] motionX ;
output [3:0] motionY ;

DFFX1_LVT \motionY_reg[3] ( .D ( n130 ) , .CLK ( clock ) , .Q ( motionY[3] ) ) ;
DFFX1_LVT \motionY_reg[2] ( .D ( n129 ) , .CLK ( clock ) , .Q ( motionY[2] ) ) ;
DFFX1_LVT \motionY_reg[1] ( .D ( n128 ) , .CLK ( clock ) , .Q ( motionY[1] ) ) ;
DFFX1_LVT \motionY_reg[0] ( .D ( n127 ) , .CLK ( clock ) , .Q ( motionY[0] ) ) ;
DFFX1_LVT \motionX_reg[3] ( .D ( n126 ) , .CLK ( clock ) , .Q ( motionX[3] ) ) ;
DFFX1_LVT \motionX_reg[2] ( .D ( n125 ) , .CLK ( clock ) , .Q ( motionX[2] ) ) ;
DFFX1_LVT \motionX_reg[1] ( .D ( n124 ) , .CLK ( clock ) , .Q ( motionX[1] ) ) ;
DFFX1_LVT \motionX_reg[0] ( .D ( n123 ) , .CLK ( clock ) , .Q ( motionX[0] ) ) ;
DFFX1_HVT \BestDist_reg[7] ( .D ( n137 ) , .CLK ( clock ) , 
    .Q ( BestDist[7] ) , .QN ( n180 ) ) ;
DFFX1_HVT \BestDist_reg[6] ( .D ( n136 ) , .CLK ( clock ) , 
    .Q ( BestDist[6] ) ) ;
DFFX1_HVT \BestDist_reg[5] ( .D ( n135 ) , .CLK ( clock ) , 
    .Q ( BestDist[5] ) ) ;
DFFX1_HVT \BestDist_reg[4] ( .D ( n134 ) , .CLK ( clock ) , 
    .Q ( BestDist[4] ) ) ;
DFFX1_HVT \BestDist_reg[3] ( .D ( n133 ) , .CLK ( clock ) , 
    .Q ( BestDist[3] ) , .QN ( n176 ) ) ;
DFFX1_HVT \BestDist_reg[2] ( .D ( n132 ) , .CLK ( clock ) , 
    .Q ( BestDist[2] ) , .QN ( n175 ) ) ;
DFFX1_HVT \BestDist_reg[1] ( .D ( n131 ) , .CLK ( clock ) , 
    .Q ( BestDist[1] ) , .QN ( n174 ) ) ;
DFFX1_HVT \BestDist_reg[0] ( .D ( n138 ) , .CLK ( clock ) , 
    .Q ( BestDist[0] ) , .QN ( n173 ) ) ;
INVX1_LVT U3 ( .A ( n167 ) , .Y ( n197 ) ) ;
INVX1_LVT U4 ( .A ( n168 ) , .Y ( n190_CDR2 ) ) ;
AND3X1_LVT U5 ( .A1 ( n165 ) , .A2 ( n193 ) , .A3 ( PEready[7] ) , 
    .Y ( n75 ) ) ;
AND3X1_LVT U6 ( .A1 ( n164 ) , .A2 ( n194 ) , .A3 ( PEready[10] ) , 
    .Y ( n78_CDR2 ) ) ;
AND3X1_LVT U7 ( .A1 ( n172 ) , .A2 ( n199 ) , .A3 ( PEready[2] ) , 
    .Y ( n84 ) ) ;
AND3X1_LVT U8 ( .A1 ( n198 ) , .A2 ( n196 ) , .A3 ( PEready[4] ) , 
    .Y ( n86 ) ) ;
INVX1_LVT U9 ( .A ( PEready[5] ) , .Y ( n198 ) ) ;
AND3X1_LVT U10 ( .A1 ( n191 ) , .A2 ( n194 ) , .A3 ( n164 ) , .Y ( n163 ) ) ;
INVX1_LVT U11 ( .A ( PEready[10] ) , .Y ( n191 ) ) ;
AND2X1_LVT U12 ( .A1 ( PEready[9] ) , .A2 ( n163 ) , .Y ( n74_CDR2 ) ) ;
AND2X1_LVT U13 ( .A1 ( PEready[8] ) , .A2 ( n165 ) , .Y ( n71_CDR2 ) ) ;
AND2X1_LVT U14 ( .A1 ( PEready[3] ) , .A2 ( n172 ) , .Y ( n87 ) ) ;
AND2X1_LVT U15 ( .A1 ( PEready[12] ) , .A2 ( n203 ) , .Y ( n76 ) ) ;
INVX1_LVT U16 ( .A ( PEready[13] ) , .Y ( n203 ) ) ;
AND2X1_LVT U17 ( .A1 ( PEready[11] ) , .A2 ( n164 ) , .Y ( n72_CDR2 ) ) ;
AND2X1_LVT U18 ( .A1 ( PEready[5] ) , .A2 ( n196 ) , .Y ( n85 ) ) ;
AND2X1_LVT U19 ( .A1 ( n163 ) , .A2 ( n192 ) , .Y ( n165 ) ) ;
INVX1_LVT U20 ( .A ( PEready[9] ) , .Y ( n192 ) ) ;
NAND3X0_LVT U21 ( .A1 ( n195 ) , .A2 ( n193 ) , .A3 ( n165 ) , .Y ( n168 ) ) ;
INVX1_LVT U22 ( .A ( PEready[7] ) , .Y ( n195 ) ) ;
NOR3X0_LVT U23 ( .A1 ( PEready[5] ) , .A2 ( PEready[6] ) , 
    .A3 ( PEready[4] ) , .Y ( n172 ) ) ;
NOR2X0_LVT U24 ( .A1 ( PEready[12] ) , .A2 ( PEready[13] ) , .Y ( n164 ) ) ;
NAND4X0_LVT U25 ( .A1 ( n172 ) , .A2 ( n201 ) , .A3 ( n200 ) , .A4 ( n199 ) , 
    .Y ( n167 ) ) ;
INVX1_LVT U26 ( .A ( PEready[1] ) , .Y ( n201 ) ) ;
AND4X1_LVT U27 ( .A1 ( PEready[1] ) , .A2 ( n172 ) , .A3 ( n200 ) , 
    .A4 ( n199 ) , .Y ( n83 ) ) ;
INVX1_LVT U28 ( .A ( PEready[3] ) , .Y ( n199 ) ) ;
INVX1_LVT U29 ( .A ( PEready[6] ) , .Y ( n196 ) ) ;
INVX1_LVT U30 ( .A ( PEready[8] ) , .Y ( n193 ) ) ;
INVX1_LVT U31 ( .A ( PEready[11] ) , .Y ( n194 ) ) ;
INVX1_LVT U32 ( .A ( PEready[2] ) , .Y ( n200 ) ) ;
AND2X1_LVT U33 ( .A1 ( PEready[14] ) , .A2 ( n202 ) , .Y ( n65 ) ) ;
INVX1_LVT U34 ( .A ( PEready[15] ) , .Y ( n202 ) ) ;
NOR3X0_LVT U35 ( .A1 ( PEready[0] ) , .A2 ( n167 ) , .A3 ( n168 ) , 
    .Y ( n79 ) ) ;
NOR2X0_LVT U36 ( .A1 ( PEready[14] ) , .A2 ( PEready[15] ) , .Y ( n66 ) ) ;
INVX1_LVT U37 ( .A ( CompStart ) , .Y ( n204 ) ) ;
INVX1_LVT U38 ( .A ( n47 ) , .Y ( n177 ) ) ;
AO221X1_LVT U39 ( .A1 ( n177 ) , .A2 ( n52 ) , .A3 ( n47 ) , 
    .A4 ( BestDist[3] ) , .A5 ( n204 ) , .Y ( n133 ) ) ;
AO221X1_LVT U40 ( .A1 ( n177 ) , .A2 ( n51 ) , .A3 ( n47 ) , 
    .A4 ( BestDist[4] ) , .A5 ( n204 ) , .Y ( n134 ) ) ;
AO221X1_LVT U41 ( .A1 ( n177 ) , .A2 ( n50 ) , .A3 ( n47 ) , 
    .A4 ( BestDist[5] ) , .A5 ( n204 ) , .Y ( n135 ) ) ;
AO221X1_LVT U42 ( .A1 ( n177 ) , .A2 ( n49 ) , .A3 ( n47 ) , 
    .A4 ( BestDist[6] ) , .A5 ( n204 ) , .Y ( n136 ) ) ;
AO221X1_LVT U43 ( .A1 ( n177 ) , .A2 ( n48 ) , .A3 ( n47 ) , 
    .A4 ( BestDist[7] ) , .A5 ( n204 ) , .Y ( n137 ) ) ;
AO21X1_LVT U44 ( .A1 ( n179 ) , .A2 ( BestDist[6] ) , .A3 ( n58 ) , 
    .Y ( n56 ) ) ;
OA221X1_LVT U45 ( .A1 ( n181 ) , .A2 ( BestDist[5] ) , .A3 ( n179 ) , 
    .A4 ( BestDist[6] ) , .A5 ( n59 ) , .Y ( n58 ) ) ;
INVX1_LVT U46 ( .A ( n49 ) , .Y ( n179 ) ) ;
AO221X1_LVT U47 ( .A1 ( n182 ) , .A2 ( BestDist[4] ) , .A3 ( n181 ) , 
    .A4 ( BestDist[5] ) , .A5 ( n60 ) , .Y ( n59 ) ) ;
INVX1_LVT U48 ( .A ( n51 ) , .Y ( n182 ) ) ;
INVX1_LVT U49 ( .A ( n50 ) , .Y ( n181 ) ) ;
AO22X1_LVT U50 ( .A1 ( n47 ) , .A2 ( motionX[0] ) , .A3 ( vectorX[0] ) , 
    .A4 ( n177 ) , .Y ( n123 ) ) ;
AO22X1_LVT U51 ( .A1 ( n47 ) , .A2 ( motionX[1] ) , .A3 ( vectorX[1] ) , 
    .A4 ( n177 ) , .Y ( n124 ) ) ;
AO22X1_LVT U52 ( .A1 ( n47 ) , .A2 ( motionX[2] ) , .A3 ( vectorX[2] ) , 
    .A4 ( n177 ) , .Y ( n125 ) ) ;
AO22X1_LVT U53 ( .A1 ( n47 ) , .A2 ( motionX[3] ) , .A3 ( vectorX[3] ) , 
    .A4 ( n177 ) , .Y ( n126 ) ) ;
AO22X1_LVT U54 ( .A1 ( n47 ) , .A2 ( motionY[0] ) , .A3 ( vectorY[0] ) , 
    .A4 ( n177 ) , .Y ( n127 ) ) ;
AO22X1_LVT U55 ( .A1 ( n47 ) , .A2 ( motionY[1] ) , .A3 ( vectorY[1] ) , 
    .A4 ( n177 ) , .Y ( n128 ) ) ;
AO22X1_LVT U56 ( .A1 ( n47 ) , .A2 ( motionY[2] ) , .A3 ( vectorY[2] ) , 
    .A4 ( n177 ) , .Y ( n129 ) ) ;
AO22X1_LVT U57 ( .A1 ( n47 ) , .A2 ( motionY[3] ) , .A3 ( vectorY[3] ) , 
    .A4 ( n177 ) , .Y ( n130 ) ) ;
AO221X1_LVT U58 ( .A1 ( n177 ) , .A2 ( n46 ) , .A3 ( n47 ) , 
    .A4 ( BestDist[0] ) , .A5 ( n204 ) , .Y ( n138 ) ) ;
AO221X1_LVT U59 ( .A1 ( n177 ) , .A2 ( n54 ) , .A3 ( n47 ) , 
    .A4 ( BestDist[1] ) , .A5 ( n204 ) , .Y ( n131 ) ) ;
AO221X1_LVT U60 ( .A1 ( n177 ) , .A2 ( n53 ) , .A3 ( n47 ) , 
    .A4 ( BestDist[2] ) , .A5 ( n204 ) , .Y ( n132 ) ) ;
AO222X1_LVT U61 ( .A1 ( PEout[1] ) , .A2 ( n197 ) , .A3 ( PEout[9] ) , 
    .A4 ( n83 ) , .A5 ( PEout[49] ) , .A6 ( PEready[6] ) , .Y ( n96 ) ) ;
AO222X1_LVT U62 ( .A1 ( PEout[0] ) , .A2 ( n197 ) , .A3 ( PEout[8] ) , 
    .A4 ( n83 ) , .A5 ( PEready[6] ) , .A6 ( PEout[48] ) , .Y ( n82 ) ) ;
AO222X1_LVT U63 ( .A1 ( PEout[2] ) , .A2 ( n197 ) , .A3 ( PEout[10] ) , 
    .A4 ( n83 ) , .A5 ( PEout[50] ) , .A6 ( PEready[6] ) , .Y ( n105 ) ) ;
AO222X1_LVT U64 ( .A1 ( PEout[3] ) , .A2 ( n197 ) , .A3 ( PEout[11] ) , 
    .A4 ( n83 ) , .A5 ( PEout[51] ) , .A6 ( PEready[6] ) , .Y ( n114 ) ) ;
AO222X1_LVT U65 ( .A1 ( PEout[4] ) , .A2 ( n197 ) , .A3 ( PEout[12] ) , 
    .A4 ( n83 ) , .A5 ( PEout[52] ) , .A6 ( PEready[6] ) , .Y ( n139 ) ) ;
AO222X1_LVT U66 ( .A1 ( PEout[5] ) , .A2 ( n197 ) , .A3 ( PEout[13] ) , 
    .A4 ( n83 ) , .A5 ( PEout[53] ) , .A6 ( PEready[6] ) , .Y ( n148 ) ) ;
AO222X1_LVT U67 ( .A1 ( PEout[6] ) , .A2 ( n197 ) , .A3 ( PEout[14] ) , 
    .A4 ( n83 ) , .A5 ( PEout[54] ) , .A6 ( PEready[6] ) , .Y ( n157 ) ) ;
AO222X1_LVT U68 ( .A1 ( PEout[7] ) , .A2 ( n197 ) , .A3 ( PEout[15] ) , 
    .A4 ( n83 ) , .A5 ( PEout[55] ) , .A6 ( PEready[6] ) , .Y ( n171 ) ) ;
AO221X1_LVT U69 ( .A1 ( PEout[81] ) , .A2 ( n78_CDR2 ) , .A3 ( n190_CDR2 ) , 
    .A4 ( n93_CDR1 ) , .A5 ( n79 ) , .Y ( n89_CDR1 ) ) ;
OR3X1_LVT U70 ( .A1 ( n94 ) , .A2 ( n95 ) , .A3 ( n96 ) , .Y ( n93_CDR1 ) ) ;
AO22X1_LVT U71 ( .A1 ( PEout[33] ) , .A2 ( n86 ) , .A3 ( PEout[25] ) , 
    .A4 ( n87 ) , .Y ( n94 ) ) ;
AO22X1_LVT U72 ( .A1 ( PEout[17] ) , .A2 ( n84 ) , .A3 ( PEout[41] ) , 
    .A4 ( n85 ) , .Y ( n95 ) ) ;
AO221X1_LVT U73 ( .A1 ( PEout[82] ) , .A2 ( n78_CDR2 ) , .A3 ( n190_CDR2 ) , 
    .A4 ( n102_CDR1 ) , .A5 ( n79 ) , .Y ( n98_CDR1 ) ) ;
OR3X1_LVT U74 ( .A1 ( n103 ) , .A2 ( n104 ) , .A3 ( n105 ) , 
    .Y ( n102_CDR1 ) ) ;
AO22X1_LVT U75 ( .A1 ( PEout[34] ) , .A2 ( n86 ) , .A3 ( PEout[26] ) , 
    .A4 ( n87 ) , .Y ( n103 ) ) ;
AO22X1_LVT U76 ( .A1 ( PEout[18] ) , .A2 ( n84 ) , .A3 ( PEout[42] ) , 
    .A4 ( n85 ) , .Y ( n104 ) ) ;
AO221X1_LVT U77 ( .A1 ( PEout[83] ) , .A2 ( n78_CDR2 ) , .A3 ( n190_CDR2 ) , 
    .A4 ( n111_CDR1 ) , .A5 ( n79 ) , .Y ( n107_CDR1 ) ) ;
OR3X1_LVT U78 ( .A1 ( n112 ) , .A2 ( n113 ) , .A3 ( n114 ) , 
    .Y ( n111_CDR1 ) ) ;
AO22X1_LVT U79 ( .A1 ( PEout[35] ) , .A2 ( n86 ) , .A3 ( PEout[27] ) , 
    .A4 ( n87 ) , .Y ( n112 ) ) ;
AO22X1_LVT U80 ( .A1 ( PEout[19] ) , .A2 ( n84 ) , .A3 ( PEout[43] ) , 
    .A4 ( n85 ) , .Y ( n113 ) ) ;
AO221X1_LVT U81 ( .A1 ( PEout[84] ) , .A2 ( n78_CDR2 ) , .A3 ( n190_CDR2 ) , 
    .A4 ( n120_CDR1 ) , .A5 ( n79 ) , .Y ( n116_CDR1 ) ) ;
OR3X1_LVT U82 ( .A1 ( n121 ) , .A2 ( n122 ) , .A3 ( n139 ) , 
    .Y ( n120_CDR1 ) ) ;
AO22X1_LVT U83 ( .A1 ( PEout[36] ) , .A2 ( n86 ) , .A3 ( PEout[28] ) , 
    .A4 ( n87 ) , .Y ( n121 ) ) ;
AO22X1_LVT U84 ( .A1 ( PEout[20] ) , .A2 ( n84 ) , .A3 ( PEout[44] ) , 
    .A4 ( n85 ) , .Y ( n122 ) ) ;
AO221X1_LVT U85 ( .A1 ( PEout[85] ) , .A2 ( n78_CDR2 ) , .A3 ( n190_CDR2 ) , 
    .A4 ( n145_CDR1 ) , .A5 ( n79 ) , .Y ( n141 ) ) ;
OR3X1_LVT U86 ( .A1 ( n146 ) , .A2 ( n147 ) , .A3 ( n148 ) , 
    .Y ( n145_CDR1 ) ) ;
AO22X1_LVT U87 ( .A1 ( PEout[37] ) , .A2 ( n86 ) , .A3 ( PEout[29] ) , 
    .A4 ( n87 ) , .Y ( n146 ) ) ;
AO22X1_LVT U88 ( .A1 ( PEout[21] ) , .A2 ( n84 ) , .A3 ( PEout[45] ) , 
    .A4 ( n85 ) , .Y ( n147 ) ) ;
AO221X1_LVT U89 ( .A1 ( n190_CDR2 ) , .A2 ( n154_CDR1 ) , .A3 ( PEout[86] ) , 
    .A4 ( n78_CDR2 ) , .A5 ( n79 ) , .Y ( n150_CDR1 ) ) ;
OR3X1_LVT U90 ( .A1 ( n155 ) , .A2 ( n156 ) , .A3 ( n157 ) , 
    .Y ( n154_CDR1 ) ) ;
AO22X1_LVT U91 ( .A1 ( PEout[38] ) , .A2 ( n86 ) , .A3 ( PEout[30] ) , 
    .A4 ( n87 ) , .Y ( n155 ) ) ;
AO22X1_LVT U92 ( .A1 ( PEout[22] ) , .A2 ( n84 ) , .A3 ( PEout[46] ) , 
    .A4 ( n85 ) , .Y ( n156 ) ) ;
AO221X1_LVT U93 ( .A1 ( n190_CDR2 ) , .A2 ( n166_CDR1 ) , .A3 ( PEout[87] ) , 
    .A4 ( n78_CDR2 ) , .A5 ( n79 ) , .Y ( n159 ) ) ;
OR3X1_LVT U94 ( .A1 ( n169 ) , .A2 ( n170 ) , .A3 ( n171 ) , 
    .Y ( n166_CDR1 ) ) ;
AO22X1_LVT U95 ( .A1 ( PEout[39] ) , .A2 ( n86 ) , .A3 ( PEout[31] ) , 
    .A4 ( n87 ) , .Y ( n169 ) ) ;
AO22X1_LVT U96 ( .A1 ( PEout[23] ) , .A2 ( n84 ) , .A3 ( PEout[47] ) , 
    .A4 ( n85 ) , .Y ( n170 ) ) ;
AO222X1_LVT U97 ( .A1 ( n66 ) , .A2 ( n158 ) , .A3 ( PEout[119] ) , 
    .A4 ( n65 ) , .A5 ( PEout[127] ) , .A6 ( PEready[15] ) , .Y ( n48 ) ) ;
OR3X1_LVT U98 ( .A1 ( n159 ) , .A2 ( n160 ) , .A3 ( n161 ) , .Y ( n158 ) ) ;
AO221X1_LVT U99 ( .A1 ( PEout[71] ) , .A2 ( n71_CDR2 ) , .A3 ( PEout[79] ) , 
    .A4 ( n74_CDR2 ) , .A5 ( n162_CDR2 ) , .Y ( n161 ) ) ;
AO22X1_LVT U100 ( .A1 ( PEout[63] ) , .A2 ( n75 ) , .A3 ( PEout[103] ) , 
    .A4 ( n76 ) , .Y ( n160 ) ) ;
AO222X1_LVT U101 ( .A1 ( PEout[115] ) , .A2 ( n65 ) , .A3 ( n66 ) , 
    .A4 ( n106 ) , .A5 ( PEout[123] ) , .A6 ( PEready[15] ) , .Y ( n52 ) ) ;
OR3X1_LVT U102 ( .A1 ( n107_CDR1 ) , .A2 ( n108 ) , .A3 ( n109_CDR1 ) , 
    .Y ( n106 ) ) ;
AO221X1_LVT U103 ( .A1 ( PEout[67] ) , .A2 ( n71_CDR2 ) , .A3 ( PEout[107] ) , 
    .A4 ( PEready[13] ) , .A5 ( n110_CDR1 ) , .Y ( n109_CDR1 ) ) ;
AO22X1_LVT U104 ( .A1 ( PEout[59] ) , .A2 ( n75 ) , .A3 ( PEout[99] ) , 
    .A4 ( n76 ) , .Y ( n108 ) ) ;
AO222X1_LVT U105 ( .A1 ( PEout[116] ) , .A2 ( n65 ) , .A3 ( n66 ) , 
    .A4 ( n115 ) , .A5 ( PEout[124] ) , .A6 ( PEready[15] ) , .Y ( n51 ) ) ;
OR3X1_LVT U106 ( .A1 ( n116_CDR1 ) , .A2 ( n117 ) , .A3 ( n118_CDR1 ) , 
    .Y ( n115 ) ) ;
AO221X1_LVT U107 ( .A1 ( PEout[92] ) , .A2 ( n72_CDR2 ) , .A3 ( PEout[108] ) , 
    .A4 ( PEready[13] ) , .A5 ( n119_CDR2 ) , .Y ( n118_CDR1 ) ) ;
AO22X1_LVT U108 ( .A1 ( PEout[60] ) , .A2 ( n75 ) , .A3 ( PEout[100] ) , 
    .A4 ( n76 ) , .Y ( n117 ) ) ;
AO222X1_LVT U109 ( .A1 ( PEout[117] ) , .A2 ( n65 ) , .A3 ( n66 ) , 
    .A4 ( n140 ) , .A5 ( PEout[125] ) , .A6 ( PEready[15] ) , .Y ( n50 ) ) ;
OR3X1_LVT U110 ( .A1 ( n141 ) , .A2 ( n142 ) , .A3 ( n143 ) , .Y ( n140 ) ) ;
AO221X1_LVT U111 ( .A1 ( PEout[93] ) , .A2 ( n72_CDR2 ) , .A3 ( PEout[109] ) , 
    .A4 ( PEready[13] ) , .A5 ( n144_CDR1 ) , .Y ( n143 ) ) ;
AO22X1_LVT U112 ( .A1 ( PEout[61] ) , .A2 ( n75 ) , .A3 ( PEout[101] ) , 
    .A4 ( n76 ) , .Y ( n142 ) ) ;
AO222X1_LVT U113 ( .A1 ( PEout[118] ) , .A2 ( n65 ) , .A3 ( n66 ) , 
    .A4 ( n149 ) , .A5 ( PEout[126] ) , .A6 ( PEready[15] ) , .Y ( n49 ) ) ;
OR3X1_LVT U114 ( .A1 ( n150_CDR1 ) , .A2 ( n151 ) , .A3 ( n152_CDR1 ) , 
    .Y ( n149 ) ) ;
AO221X1_LVT U115 ( .A1 ( PEout[110] ) , .A2 ( PEready[13] ) , 
    .A3 ( PEout[94] ) , .A4 ( n72_CDR2 ) , .A5 ( n153_CDR2 ) , 
    .Y ( n152_CDR1 ) ) ;
AO22X1_LVT U116 ( .A1 ( PEout[62] ) , .A2 ( n75 ) , .A3 ( PEout[102] ) , 
    .A4 ( n76 ) , .Y ( n151 ) ) ;
AO222X1_LVT U117 ( .A1 ( PEout[114] ) , .A2 ( n65 ) , .A3 ( n66 ) , 
    .A4 ( n97 ) , .A5 ( PEout[122] ) , .A6 ( PEready[15] ) , .Y ( n53 ) ) ;
OR3X1_LVT U118 ( .A1 ( n98_CDR1 ) , .A2 ( n99 ) , .A3 ( n100_CDR1 ) , 
    .Y ( n97 ) ) ;
AO221X1_LVT U119 ( .A1 ( PEout[66] ) , .A2 ( n71_CDR2 ) , .A3 ( PEout[106] ) , 
    .A4 ( PEready[13] ) , .A5 ( n101_CDR1 ) , .Y ( n100_CDR1 ) ) ;
AO22X1_LVT U120 ( .A1 ( PEout[58] ) , .A2 ( n75 ) , .A3 ( PEout[98] ) , 
    .A4 ( n76 ) , .Y ( n99 ) ) ;
AO222X1_LVT U121 ( .A1 ( PEout[113] ) , .A2 ( n65 ) , .A3 ( n66 ) , 
    .A4 ( n88 ) , .A5 ( PEout[121] ) , .A6 ( PEready[15] ) , .Y ( n54 ) ) ;
OR3X1_LVT U122 ( .A1 ( n89_CDR1 ) , .A2 ( n90 ) , .A3 ( n91_CDR1 ) , 
    .Y ( n88 ) ) ;
AO221X1_LVT U123 ( .A1 ( PEout[65] ) , .A2 ( n71_CDR2 ) , .A3 ( PEout[105] ) , 
    .A4 ( PEready[13] ) , .A5 ( n92_CDR1 ) , .Y ( n91_CDR1 ) ) ;
AO22X1_LVT U124 ( .A1 ( PEout[57] ) , .A2 ( n75 ) , .A3 ( PEout[97] ) , 
    .A4 ( n76 ) , .Y ( n90 ) ) ;
AO222X1_LVT U125 ( .A1 ( PEout[112] ) , .A2 ( n65 ) , .A3 ( n66 ) , 
    .A4 ( n67 ) , .A5 ( PEready[15] ) , .A6 ( PEout[120] ) , .Y ( n46 ) ) ;
OR3X1_LVT U126 ( .A1 ( n68_CDR1 ) , .A2 ( n69 ) , .A3 ( n70_CDR1 ) , 
    .Y ( n67 ) ) ;
AO221X1_LVT U127 ( .A1 ( PEout[64] ) , .A2 ( n71_CDR2 ) , .A3 ( PEout[72] ) , 
    .A4 ( n74_CDR2 ) , .A5 ( n73_CDR1 ) , .Y ( n70_CDR1 ) ) ;
AO22X1_LVT U128 ( .A1 ( PEout[56] ) , .A2 ( n75 ) , .A3 ( PEout[96] ) , 
    .A4 ( n76 ) , .Y ( n69 ) ) ;
OA22X1_LVT U129 ( .A1 ( n54 ) , .A2 ( n174 ) , .A3 ( n64 ) , .A4 ( n46 ) , 
    .Y ( n62 ) ) ;
AO21X1_LVT U130 ( .A1 ( n54 ) , .A2 ( n174 ) , .A3 ( n173 ) , .Y ( n64 ) ) ;
AO22X1_LVT U131 ( .A1 ( PEout[88] ) , .A2 ( n72_CDR2 ) , .A3 ( PEready[13] ) , 
    .A4 ( PEout[104] ) , .Y ( n73_CDR1 ) ) ;
AO22X1_LVT U132 ( .A1 ( PEout[73] ) , .A2 ( n74_CDR2 ) , .A3 ( PEout[89] ) , 
    .A4 ( n72_CDR2 ) , .Y ( n92_CDR1 ) ) ;
AO22X1_LVT U133 ( .A1 ( PEout[74] ) , .A2 ( n74_CDR2 ) , .A3 ( PEout[90] ) , 
    .A4 ( n72_CDR2 ) , .Y ( n101_CDR1 ) ) ;
AO22X1_LVT U134 ( .A1 ( PEout[75] ) , .A2 ( n74_CDR2 ) , .A3 ( PEout[91] ) , 
    .A4 ( n72_CDR2 ) , .Y ( n110_CDR1 ) ) ;
AO22X1_LVT U135 ( .A1 ( PEout[68] ) , .A2 ( n71_CDR2 ) , .A3 ( PEout[76] ) , 
    .A4 ( n74_CDR2 ) , .Y ( n119_CDR2 ) ) ;
OA221X1_LVT U136 ( .A1 ( n183 ) , .A2 ( BestDist[3] ) , .A3 ( n182 ) , 
    .A4 ( BestDist[4] ) , .A5 ( n61 ) , .Y ( n60 ) ) ;
INVX1_LVT U137 ( .A ( n52 ) , .Y ( n183 ) ) ;
OAI222X1_LVT U138 ( .A1 ( n53 ) , .A2 ( n62 ) , .A3 ( n63 ) , .A4 ( n175 ) , 
    .A5 ( n52 ) , .A6 ( n176 ) , .Y ( n61 ) ) ;
AND2X1_LVT U139 ( .A1 ( n62 ) , .A2 ( n53 ) , .Y ( n63 ) ) ;
NAND2X0_LVT U140 ( .A1 ( CompStart ) , .A2 ( n55 ) , .Y ( n47 ) ) ;
AO22X1_LVT U141 ( .A1 ( n178 ) , .A2 ( BestDist[7] ) , .A3 ( n56 ) , 
    .A4 ( n57 ) , .Y ( n55 ) ) ;
NAND2X0_LVT U142 ( .A1 ( n180 ) , .A2 ( n48 ) , .Y ( n57 ) ) ;
INVX1_LVT U143 ( .A ( n48 ) , .Y ( n178 ) ) ;
AO221X1_LVT U144 ( .A1 ( PEout[80] ) , .A2 ( n78_CDR2 ) , .A3 ( n190_CDR2 ) , 
    .A4 ( n77_CDR1 ) , .A5 ( n79 ) , .Y ( n68_CDR1 ) ) ;
OR3X1_LVT U145 ( .A1 ( n80 ) , .A2 ( n81 ) , .A3 ( n82 ) , .Y ( n77_CDR1 ) ) ;
AO22X1_LVT U146 ( .A1 ( PEout[32] ) , .A2 ( n86 ) , .A3 ( PEout[24] ) , 
    .A4 ( n87 ) , .Y ( n80 ) ) ;
AO22X1_LVT U147 ( .A1 ( PEout[16] ) , .A2 ( n84 ) , .A3 ( PEout[40] ) , 
    .A4 ( n85 ) , .Y ( n81 ) ) ;
AO22X1_LVT U148 ( .A1 ( PEout[69] ) , .A2 ( n71_CDR2 ) , .A3 ( PEout[77] ) , 
    .A4 ( n74_CDR2 ) , .Y ( n144_CDR1 ) ) ;
AO22X1_LVT U149 ( .A1 ( PEout[78] ) , .A2 ( n74_CDR2 ) , .A3 ( PEout[70] ) , 
    .A4 ( n71_CDR2 ) , .Y ( n153_CDR2 ) ) ;
AO22X1_LVT U150 ( .A1 ( PEout[111] ) , .A2 ( PEready[13] ) , 
    .A3 ( PEout[95] ) , .A4 ( n72_CDR2 ) , .Y ( n162_CDR2 ) ) ;
endmodule


