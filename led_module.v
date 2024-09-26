module led_module(
input        rst_n             , 
input        sys_clk           ,   
input [7:0]  ctrl              ,      
input [31:0] time_ctrl         , //����ʱ�䳤�̵Ķ˿�
output reg   led
    );
reg [31:0] cnt;
reg [3:0] cnt2;
//��1��ʱ��
always@(posedge sys_clk)
if(!rst_n)
    cnt<=0;
else if(cnt==time_ctrl-1)
    cnt<=0;
else
    cnt<=cnt+1;
//��2��ʱ��
always@(posedge sys_clk)
if(!rst_n)
    cnt2<=0;
else if(cnt==time_ctrl-1)
    cnt2<=cnt2+1;
else if(cnt2==8)
    cnt2<=0;
else
    cnt2<=cnt2;
///�������
always@(posedge sys_clk)
if(!rst_n)
    led<=0;
else
    case(cnt2)
        0:led<=ctrl[0];
        1:led<=ctrl[1];
        2:led<=ctrl[2];
        3:led<=ctrl[3];
        4:led<=ctrl[4];
        5:led<=ctrl[5];
        6:led<=ctrl[6];
        7:led<=ctrl[7];
        default:led<=0;
     endcase    
endmodule

