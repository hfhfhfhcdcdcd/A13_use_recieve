�ƶ�һ��Э�飺�����������֣���������ģ��������У�
��һ������������һģ�� ctrl �˿ڵġ���Щ��������
����һģ��� time_ctrl �˿ڵġ�

Լ���������յ�rx_done�ź�ʱ����ʼ��⴫����������ݡ�
����Э������ǣ�����⵽rx_done�ź�ʱ���ȿ����Ƿ�
���������ݣ�oxAB��oxCD, �����⵽���������ݣ���ʼ
���մ����������ݡ����Ʋ���40bit����Ϊ��һ��ģ��Ҫ�õ�
40bit��8bitctrl��32bit time_ctrl���������꣬�����Ȼ
Ҫ����Ƿ���oxEF����ֽڣ��еĻ�˵���ղŽ��յ�������
����ȷ�ģ�û�������øղŽ��յ������ݡ�

��Ȼ����������� output��Э��ļ�ⲿ�֣���Ҫ�ü�
�������洢ǰ�洫�������ݣ�Ȼ���жϣ��ɹ�֮���ٴ��� 
output���Ĵ���Ҫ������������ֽڣ��ټ���40bit ����
��һ����8byte�������ȶ���8���Ĵ�����ÿ���Ĵ�����λ��
��8bit������Ӧ�ö��壺reg [7:0]data_block [7:0]��
ǰ����λ��8bit������ǼĴ���������8����

�����ǣ�
data_block[0],�Ĵ����0xAB;
data_block[1],�Ĵ����0xCD;
data_block[2],�Ĵ����ctrl[7:0];
data_block[3],�Ĵ����time_ctrl[7:0];
data_block[4],�Ĵ����time_ctrl[15:8];
data_block[5],�Ĵ����time_ctrl[31:16];
data_block[6],�Ĵ����time_ctrl[47:32];
data_block[7],�Ĵ����0xEF;

��data_block[0]��data_block[1]��data_block[7]�Ĵ���
�жϡ����rx_done�ź������ˣ���
data[7:0],
data[15:8],
data[23:16],
data[31:24],
data[39:32],
data[47:40],
data[55:48],
data[63:56]
�Ĵ浽
data_block[0],
data_block[1],
data_block[2],
data_block[3],
data_block[4],
data_block[5],
data_block[6],
���档

�ж�data_block[0]��data_block[1]��data_block[7]�Ƿ����0xAB��0xCD��0xEF ����������������ģ��ctrl��ģ�����档

data��8bit�ģ�����ô��40λ���ݣ����3byte��0xAB��0xCD��0xEF���أ�

����ʹ��һ������8bit����λ�Ĵ���