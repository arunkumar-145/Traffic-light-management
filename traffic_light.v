`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2026 12:53:40
// Design Name: 
// Module Name: traffic_light
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
module traffic_light(
input clk,
input rst,
output reg red,
output reg yellow,
output reg green
);
parameter RED = 2'b00;
parameter GREEN = 2'b01;
parameter YELLOW = 2'b10;
reg [1:0] state;
reg [31:0] count;
parameter MAX_COUNT = 10;
always @(posedge clk or posedge rst) begin
if(rst) begin
state<=RED;
count<=0;
end
else begin
if(count<MAX_COUNT)
count<=count+1;
else begin
count <= 0;
case(state)
RED: state<=GREEN;
GREEN: state<=YELLOW;
YELLOW: state<=RED;
default: state<=RED;
endcase
end
end
end
always @(*) begin
red=0;
yellow=0;
green=0;
case(state)
RED: red=1;
GREEN: green=1;
YELLOW: yellow=1;
endcase
end
endmodule
