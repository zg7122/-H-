% 定义截止频率（Hz）
fc = 10000;
% 转换为角频率（rad/s）
wc = 2*pi*fc;

% 选择合适的电感、电阻和电容值
% 对于二阶低通滤波器，截止频率 wc = 1 / sqrt(L * C)
% 假设品质因数 Q = 0.707（巴特沃斯滤波器），Q = 1 / (R * sqrt(C / L))
L = (22/6)*1E-6;
C = 1/(wc^2 * L);
R = 1/(0.707 * sqrt(C / L));

% 定义传递函数的分子和分母系数
num = 1;
den = [L*C, R*C, 1];

% 创建传递函数对象
sys = tf(num, den);

% 生成频率范围
w = logspace(1, 6, 500); % 从 10 Hz 到 1 MHz

% 绘制伯德图
bode(sys, w);
grid on;
title('Bode Plot of LRC Lowpass Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB) / Phase (degrees)');
