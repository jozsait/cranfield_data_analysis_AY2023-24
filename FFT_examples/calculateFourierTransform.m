function [frequency, amplitude] = calculateFourierTransform(pressure, time)
    % Input:
    %   pressure: Pressure measurements in Pascals (Pa)
    %   time: Corresponding time values in seconds (s)
    % Output:
    %   frequency: Frequency values in Hertz (Hz)
    %   amplitude: Amplitude of the Fourier transform in Pascals (Pa)

    % Calculate the sampling frequency
    fs = 1 / (time(2) - time(1));  % Assuming a uniform sampling rate

    % Perform the Fourier transform
    n = length(pressure);
    pressure_fft = fft(pressure);
    
    % Calculate the frequency axis
    frequency = fs * (0:(n/2))/n;

    % Calculate the amplitude, considering the normalization by 1/n
    amplitude = abs(pressure_fft(1:n/2+1)) * (2/n);

    [mymin,myargmin] = min(frequency);
    amplitude(myargmin) = 0.5*amplitude(myargmin);
