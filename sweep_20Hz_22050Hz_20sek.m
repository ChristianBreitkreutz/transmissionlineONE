bitdepth = 16;
sampleRate = 44100;
startfreqency = 10;
endfreqency = sampleRate / 2;
lenghtInSek = 20;

amountOfSamples = sampleRate * lenghtInSek

stepSize = 1/sampleRate
frequencePerSample = (endfreqency - startfreqency) / amountOfSamples/2
x = 1:amountOfSamples;
timeRange = x .* stepSize;
frequencePerSampleRange =  x .* frequencePerSample;

wave = sin(timeRange * pi * 2  .* frequencePerSampleRange );

plot(wave)
sound(wave,sampleRate*2, bitdepth)
waveTitle = strcat(num2str(lenghtInSek),"sec_", num2str(startfreqency),"Hz_", num2str(endfreqency),  'Hz_sweep.wav')
wavwrite(wave, sampleRate, bitdepth, waveTitle )

