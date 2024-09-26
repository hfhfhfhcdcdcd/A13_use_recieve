module  use_recieve(
    input rst,
    input sclk,
    input [7:0]data,
    input rx_done,
    output [7:0]ctrl,
    output [31:0]time_ctrl
);
/*
制定一个协议：能清晰地区分，来自输入模块的数据中，
那一部分是属于下一模块 ctrl 端口的、那些数据是属
于下一模块的 time_ctrl 端口的。

约定：当接收到rx_done信号时，开始检测传输过来的数据。
所以协议可以是：当检测到rx_done信号时，先看看是否传
来两个数据：oxAB、oxCD, 如果检测到这两个数据，开始
接收传过来的数据——推测是40bit，因为下一个模块要用到
40bit：8bitctrl、32bittime_ctrl——接收完，最后仍然
要检测是否有oxEF这个字节，有的话说明刚才接收到的数据
是正确的；没有则弃用刚才接收到的数据。

既然要
*/

endmodule