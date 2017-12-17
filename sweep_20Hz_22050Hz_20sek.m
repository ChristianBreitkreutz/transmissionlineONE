# author: christianbreitkreutz@gmx.de
bitdepth = 16;
sampleRate = 44100;
startfreqency = 20;
endfreqency = sampleRate / 2;
lenghtInSek = 20;

amountOfSamples = sampleRate * lenghtInSek

stepSize = 1 / sampleRate
frequencePerSample = ((endfreqency - startfreqency) / amountOfSamples) / 2
xRange = 1:amountOfSamples;

timeRange = xRange .* stepSize;
frequencePerSampleRange =  xRange .* frequencePerSample;

wave = sin(timeRange .* pi .* 2  .* frequencePerSampleRange );

plot(wave)
sound(wave, sampleRate * 2, bitdepth)
waveTitle = strcat(
    'sinussweep','_',
    num2str(startfreqency),'Hz','_TO_',
    num2str(endfreqency),'Hz','_IN_',
    num2str(lenghtInSek), 'sec',
    '.wav')
wavwrite(wave, sampleRate, bitdepth, waveTitle )

