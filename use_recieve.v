module  use_recieve(
    input                   rst         ,
    input                   sclk        ,
    input [7:0]             data        ,
    input                   rx_done     ,   
    output  reg  [7:0]      ctrl        ,
    output  reg  [31:0]     time_ctrl      
);
/*-------------协议模块--------------*/
reg [7:0] data_block [7:0];//为了存储input进来的40bit 数据
always @(posedge sclk or negedge rst) begin
    if (!rst) begin
        data_block[0]<=8'd0;//0xAB
        data_block[1]<=8'd0;//0xCD
        data_block[2]<=8'd0;
        data_block[3]<=8'd0;//time_ctrl[7:0]
        data_block[4]<=8'd0;//time_ctrl[15:8]
        data_block[5]<=8'd0;//time_ctrl[23:16]
        data_block[6]<=8'd0;//time_ctrl[31:24]
        data_block[7]<=8'd0;//0xEF
    end
    else if (rx_done) begin
        data_block[0]<=data_block[1];
        data_block[1]<=data_block[2];
        data_block[2]<=data_block[3];
        data_block[3]<=data_block[4];
        data_block[4]<=data_block[5];
        data_block[5]<=data_block[6];
        data_block[6]<=data_block[7];
        data_block[7]<=data;        
    end
    else
        data_block[0]<=data_block[0];
        data_block[1]<=data_block[1];
        data_block[2]<=data_block[2];
        data_block[3]<=data_block[3];
        data_block[4]<=data_block[4];
        data_block[5]<=data_block[5];
        data_block[6]<=data_block[6];
        data_block[7]<=data_block[7];    
end
/*-----判断data_block[0]、data_block[1]、data_block[7]------*/
always @(posedge sclk or negedge rst) begin
    if (data_block[0]&&data_block[1]&&data_block[7]) begin
        ctrl<=data_block[2];
        time_ctrl[7:0]  <=data_block[3];
        time_ctrl[15:8] <=data_block[4];
        time_ctrl[23:16]<=data_block[5];
        time_ctrl[31:24]<=data_block[6];        
    end
    else begin
        ctrl<=8'd0;
        time_ctrl[7:0]  <=8'd0;
        time_ctrl[15:8] <=8'd0;
        time_ctrl[23:16]<=8'd0;
        time_ctrl[31:24]<=8'd0;
    end
end
endmodule