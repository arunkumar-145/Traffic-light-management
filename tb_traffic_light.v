`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2026 12:55:09
// Design Name: 
// Module Name: tb_traffic_light
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_traffic_light;
reg clk;
reg rst;
wire red,yellow,green;
traffic_light uut(.clk(clk), .rst(rst), .red(red), .yellow(yellow), .green(green));
always #5 clk = ~clk;
initial begin
clk=0;
rst=1;
#20;
rst=0;
#200;
rst=1;
#20;
rst=0;
#200;
$finish;
end
initial begin
$monitor("Time=%0t | R=%b Y=%b G=%b | rst=%b",$time,red,yellow,green,rst);
end
endmodule

