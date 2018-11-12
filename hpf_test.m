clc; clear all; close all;

%% Create Test Signal
Fs = 10*1e3;    % 10 kHz
Ts = 1/Fs;      % sample time
endTime = 1;
t = 0 : Ts : endTime;
inputSig = 3*sin(2*pi*t);
sampleFreq = 10 : 50 : 500;

for i = 1 : size(sampleFreq, 2)
    inputSig = inputSig + 2*sin(2*pi*sampleFreq(i)*t);
end

[a1, b0, b1] = get1stFilterCoeffi(300, Ts, 1);
dataFiltered = d2f_1st(inputSig, a1, b0, b1);

figure
set(gcf,'Color',[1,1,1])
plot(t, inputSig, 'LineWidth',2)
hold on
plot(t, dataFiltered, '--','LineWidth',2)
grid on
xlabel('Time [s]')
set(gca, 'FontSize',13)
