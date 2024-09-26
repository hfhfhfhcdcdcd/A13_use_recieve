module top(
    input           sclk    ,  
    input           rst     , 
    output          led
);
/*------------------------------------����-------------------------------*/
///////////////////////////////////////���ڽ�������
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
///��������ģ�顪�� ���ڽ���ģ�� �� led��˸ģ�� �������м�ģ��
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

/////////////////////////////////////////led ��˸ģ��
led_module led1(
    . rst       ( rst       )       ,
    . sclk      ( sclk      )       ,
    . ctrl      ( ctrl      )       ,      
    . time_ctrl ( time_ctrl )       , //����ʱ�䳤�̵Ķ˿�
    . led       ( led)
    );

endmodule