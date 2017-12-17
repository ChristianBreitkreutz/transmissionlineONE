%Load File
file = "sinussweep_20Hz_TO_22050Hz_IN_20sec.wav";
#file = "1000hz_sine.wav";
[y,Fs,bits] = wavread(file);

#Nsamps = length(y);
#t = (1/Fs)*(1:Nsamps);          %Prepare time data for plot

%Do Fourier Transform
magnitude = abs(fft2(y));            %Retain Magnitude
#y_fft = y_fft(1:Nsamps/2);      %Discard Half of Points
#f = Fs*(1:Nsamps/2-1)/Nsamps;   %Prepare freq data for plot

%Plot Sound File in Frequency Domain
#graphics_toolkit("gnuplot")
semilogx(20*log10(magnitude));
xlim([20 Fs/2])
xlabel('Frequency (Hz)')
ylabel('Amplitude')

