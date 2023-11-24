% this is a script developed to improve understanding of the FFT algorithm
% by using simple sinusoidal functions as inputs

clear all;
close all;
clc;

%% signal definition
t1 = 10;
nt = 1000001;

time = linspace(0,t1,nt);
pressure = 10 + 6*sin(2*2*pi* (time+sqrt(pi) )) + 2*sin(1*(2*pi)*time);

[frequency, amplitude] = calculateFourierTransform(pressure, time);

%% plotter
% Plot the time signal
figure;

% Plot the time signal on the left
subplot(1, 2, 1);
plot(time, pressure, 'LineWidth', 1.5);
xlabel('Time (s)', 'Interpreter', 'latex');
ylabel('Pressure (Pa)', 'Interpreter', 'latex');
grid on;
annotation('textbox', [0.05, 0.9, 0.05, 0.05], 'String', '(a)', 'EdgeColor', 'none', 'FontSize', 12, 'FontWeight', 'bold');

% Plot the spectrum on the right
subplot(1, 2, 2);
semilogx(frequency, amplitude, 'LineWidth', 1.5);
xlabel('Frequency (Hz)', 'Interpreter', 'latex');
ylabel('Amplitude (Pa)', 'Interpreter', 'latex');
title('Frequency Spectrum', 'Interpreter', 'latex');
xlim([0,10])
grid on;
annotation('textbox', [0.5, 0.9, 0.05, 0.05], 'String', '(b)', 'EdgeColor', 'none', 'FontSize', 12, 'FontWeight', 'bold');

% Adjust figure properties for better visibility
set(gcf, 'Position', [100, 100, 1200, 500]);  % Adjust figure size
legend({'Pressure Signal'}, 'Interpreter', 'latex', 'Location', 'best');