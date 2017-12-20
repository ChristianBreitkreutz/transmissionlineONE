# author: christianbreitkreutz@gmx.de
bitdepth = 16;
sampleRate = 44100;
startfreqency = 20;
endfreqency = sampleRate / 2;
lenghtInSek = 4;
figure(1, "position",get(0,"screensize") / 2) # maxi window plot output

amountOfSamples = sampleRate * lenghtInSek;
xRangeInSamples = 1:amountOfSamples;

exponent = 3;
logagithmicXRange = (xRangeInSamples .** exponent);
maximalfrequencyePerSample = (amountOfSamples ** exponent);
normalizedLogagithmicXRange = logagithmicXRange ./ maximalfrequencyePerSample;
frequencyePerSampleRange =  normalizedLogagithmicXRange * endfreqency;

subplot(2,2,1);
plot(frequencyePerSampleRange);
title("frequency per sample");
xlabel('samples')
ylabel('frequency (Hz)')

normalizedTimeRange = xRangeInSamples ./ amountOfSamples ;
timeRange = normalizedTimeRange ;#.* (lenghtInSek / 4) ;


wave = sin(timeRange .* pi .* 2  .* 1000 );#.* frequencyePerSampleRange );
subplot(2,2,2);
semilogx( abs(fft2(wave)));
title("Spectrum");
xlabel('Hz')
ylabel('dB')

subplot(2,2,[3 4]);
plot(wave)
title("sinus sweep");
xlabel('samples')
ylabel('amplitude')

sound(wave, sampleRate , bitdepth)

waveTitle = strcat(
    'sinussweep','_',
    num2str(startfreqency),'Hz','_TO_',
    num2str(endfreqency),'Hz','_IN_',
    num2str(lenghtInSek), 'sec',
    '.wav')
wavwrite(wave, sampleRate, bitdepth, waveTitle )

