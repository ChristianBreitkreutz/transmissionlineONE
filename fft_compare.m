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
  semilogx( f, magOut);
  xlabel('Hz')
  ylabel('dB')
endfunction

function printDoubleMagnitude (magOut1, magOut2,amountSamples1, amountSamples2)
  sampleRate = 44100;
  f1 = calcFrequencyRange(sampleRate, amountSamples1);
  f2 = calcFrequencyRange(sampleRate, amountSamples2);
  semilogx( f1, magOut1, f2, magOut2);
  xlabel('Hz')
  ylabel('dB')
  
endfunction

function calculateMagnitudeResult = calculateMagnitude (data)
  calculateMagnitudeResult = abs(fftshift(fft(data)));
endfunction

function result = myResize(vector, newLength)
 out = 1:newLength;
 for i = 1:newLength
  out(i) = vector(i);
 endfor
 result = out;
endfunction

#############################################################################
#############################################################################
#############################################################################
fileName_dry = "sweeps/sinussweep_2Hz_22050hz_15sec.wav";
fileName_wet = "sweeps/17_12_22_TransmissionOne - 0000.wav";

[data_dry, sampleRate_dry, bitDepth_dry] = wavread(fileName_dry);
[data_wet, sampleRate_wet, bitDepth_wet] = wavread(fileName_wet);
magnitude_dry = calculateMagnitude(data_dry);
magnitude_wet = calculateMagnitude(data_wet);

########################################################################
subplot(3,2,[1 2]);
fft_resoluton = length(magnitude_wet);
maxiValue = max(magnitude_wet);
resized_wet = myResize(magnitude_wet, fft_resoluton);
printMagnitude( resized_wet ./ maxiValue, fft_resoluton);
title("wet - normalized");
axis ([20 sampleRate_dry/2],"on");


subplot(3,2,[3 4]);
fft_resoluton = length(magnitude_dry);
temp = myResize(magnitude_wet, fft_resoluton);
temp2 = myResize(magnitude_dry, fft_resoluton);
printMagnitude(temp ./ temp2, fft_resoluton);
title("wet - pre-bla");
axis ([20 sampleRate_wet/2],"on");
