module top(
    input           sclk    ,  
    input           rst     , 
    output          led
);
/*------------------------------------例化-------------------------------*/
///////////////////////////////////////串口接收例化
reg [2:0] Baud_set;
reg uart_rx;
reg [7:0] data;
reg rx_done;
recieve r1(
    .sysclk     (sclk  )  ,
    .rst        (rst     )  ,
    .Baud_set   (Baud_set)  ,
    .uart_rx    (uart_rx )  ,
    .Data       (data    )  ,
    .rx_done    (rx_done )
    );
///连接两个模块—— 串口接收模块 和 led闪烁模块 ——的中间模块
reg [7:0]ctrl;
reg [31:0]time_ctrl;
use_recieve u1(
    .rst       (rst       )   ,
    .sclk      (sclk      )   , 
    .data      (data      )   , 
    .rx_done   (rx_done   )   ,    
    .ctrl      (ctrl      )   , 
    .time_ctrl (time_ctrl )         
);

/////////////////////////////////////////led 闪烁模块
led_module led1(
    . rst       ( rst       )       ,
    . sclk      ( sclk      )       ,
    . ctrl      ( ctrl      )       ,      
    . time_ctrl ( time_ctrl )       , //控制时间长短的端口
    . led       ( led)
    );

endmodule