# author: christianbreitkreutz@gmx.de
bitdepth = 16;
sampleRate = 44100;
startfreqency = 1;
endfreqency = sampleRate / 2;
lenghtInSek = 20;
figure(1, "position",get(0,"screensize") / 2) # maxi window plot output

amountOfSamples = sampleRate * lenghtInSek;
xRangeInSamples = 1:amountOfSamples;

exponent = 3;
logagithmicXRange = (xRangeInSamples .** exponent);
maximalfrequencyePerSample = (amountOfSamples ** exponent);
normalizedLogagithmicXRange = logagithmicXRange ./ maximalfrequencyePerSample;
frequencyePerSampleRange =  normalizedLogagithmicXRange * (endfreqency-startfreqency);

subplot(2,2,1);
plot(frequencyePerSampleRange);
title("frequency per sample");
xlabel('samples')
ylabel('frequency (Hz)')

normalizedTimeRange = xRangeInSamples ./ amountOfSamples ;
timeRange = normalizedTimeRange * lenghtInSek; 

sampleBasedWave = sin(timeRange  .* 2  .* frequencyePerSampleRange );
timeBaseWave = sin(normalizedTimeRange  .* 2  .* frequencyePerSampleRange);
subplot(2,2,3);
plot(timeBaseWave);
title("timeBaseWave");
subplot(2,2,2);

semilogx( abs(fft2(timeBaseWave)));
title("Spectrum");
xlabel('Hz')
ylabel('dB')
axis ([startfreqency endfreqency],"on")

subplot(2,2,[ 4]);
plot(sampleBasedWave)
title("sinus sweep");
xlabel('samples')
ylabel('amplitude')

sound(sampleBasedWave, sampleRate, bitdepth)

waveTitle = strcat(
    'sinussweep','_',
    num2str(startfreqency),'Hz','_TO_',
    num2str(endfreqency),'Hz','_IN_',
    num2str(lenghtInSek), 'sec',
    '.wav')
wavwrite(sampleBasedWave, sampleRate, bitdepth, waveTitle )

