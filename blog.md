制定一个协议：能清晰地区分，来自输入模块的数据中，
那一部分是属于下一模块 ctrl 端口的、那些数据是属
于下一模块的 time_ctrl 端口的。

约定：当接收到rx_done信号时，开始检测传输过来的数据。
所以协议可以是：当检测到rx_done信号时，先看看是否传
来两个数据：oxAB、oxCD, 如果检测到这两个数据，开始
接收传过来的数据——推测是40bit，因为下一个模块要用到
40bit：8bitctrl、32bit time_ctrl——接收完，最后仍然
要检测是否有oxEF这个字节，有的话说明刚才接收到的数据
是正确的；没有则弃用刚才接收到的数据。

既然在最后的输出是 output，协议的检测部分，就要用寄
存器来存储前面传来的数据，然后判断，成功之后，再传给 
output。寄存器要接收三个检测字节，再加上40bit 数据
，一共是8byte。所以先定义8个寄存器，每个寄存器的位宽
是8bit。所以应该定义：reg [7:0]data_block [7:0]。
前边是位宽8bit，后边是寄存器个数，8个。

具体是：
data_block[0],寄存的是0xAB;
data_block[1],寄存的是0xCD;
data_block[2],寄存的是ctrl[7:0];
data_block[3],寄存的是time_ctrl[7:0];
data_block[4],寄存的是time_ctrl[15:8];
data_block[5],寄存的是time_ctrl[31:16];
data_block[6],寄存的是time_ctrl[47:32];
data_block[7],寄存的是0xEF;

对data_block[0]、data_block[1]、data_block[7]寄存器
判断。如果rx_done信号拉高了，将
data[7:0],
data[15:8],
data[23:16],
data[31:24],
data[39:32],
data[47:40],
data[55:48],
data[63:56]
寄存到
data_block[0],
data_block[1],
data_block[2],
data_block[3],
data_block[4],
data_block[5],
data_block[6],
里面。

判断data_block[0]、data_block[1]、data_block[7]是否符合0xAB、0xCD、0xEF ，符合则将输出到最后模块ctrl、模块里面。

data是8bit的，那怎么发40位数据，外加3byte的0xAB、0xCD、0xEF的呢？

可以使用一个向右8bit的移位寄存器