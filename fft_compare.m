figure(1, "position",get(0, "screensize") / 2) # maxi window plot output
0;
function result = calcFrequencyRange (sampleRate, amountSamples)
  delta_f = sampleRate/amountSamples;
  min_f = -sampleRate/2;
  max_f = sampleRate/2 - delta_f;
  result = [min_f: delta_f : max_f];
endfunction

function printMagnitude (magOut, amountSamples)
  sampleRate = 44100;
  f = calcFrequencyRange(sampleRate, amountSamples);
  length(f)
  length(magOut)
  semilogx( f, magOut);
  xlabel('Hz')
  ylabel('dB')
endfunction

function calculateMagnitudeResult = calculateMagnitude (data)
  calculateMagnitudeResult = abs(fftshift(fft(data)));
endfunction


#############################################################################
#############################################################################
#############################################################################
fileName_dry = "sweeps/sinussweep_2Hz_22050hz_15sec.wav";
fileName_wet = "sweeps/17_12_22_TransmissionOne - 0002.wav";


[data_dry, sampleRate_dry, bitDepth_dry] = wavread(fileName_dry);
[data_wet, sampleRate_wet, bitDepth_wet] = wavread(fileName_wet);
magnitude_dry = calculateMagnitude(data_dry);
magnitude_wet = calculateMagnitude(data_wet);

subplot(3,2,1);
printMagnitude(magnitude_dry , length(data_dry));
title("dry");
axis ([20 sampleRate_dry/2 0 6000],"on");

subplot(3,2,2);
printMagnitude(magnitude_wet , length(data_wet));
title("wet");
axis ([20 sampleRate_wet/2 0 6000],"on");



normalized_wet = 0:length(magnitude_dry );
for i=1:length(magnitude_dry), normalized_wet(i) = magnitude_wet(i) / magnitude_dry(i); end

length(magnitude_dry)
subplot(3,2,[3 4]);
printMagnitude(normalized_wet , 661501);
title("normlized wet");
axis ([20 sampleRate_wet/2 0 4],"on");

subplot(3,2,[5 6]);
printMagnitude(normalized_wet , 661501);
title("normlized wet");
axis ([20 sampleRate_dry/2 0 0.5],"on");