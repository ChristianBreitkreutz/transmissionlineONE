# author: christianbreitkreutz@gmx.de
bitdepth = 16;
sampleRate = 44100;
startfreqency = 20;
endfreqency = sampleRate / 2;
lenghtInSek = 10;
figure(1, "position",get(0,"screensize") / 2) # maxi window plot output
amountOfSamples = sampleRate * lenghtInSek
stepSize = 1 / sampleRate;
allOverFrequency = (endfreqency - startfreqency);
frequencePerSample = (allOverFrequency) / amountOfSamples;
xRange = 1:amountOfSamples;

subplot(2,2,1);
frequencePerSampleRange = (xRange .** 3) ./ (amountOfSamples ** 3) * endfreqency;

plot(frequencePerSampleRange);

normalizedTimeRange = (xRange ./ amountOfSamples) ;
timeRange = normalizedTimeRange * lenghtInSek / 4 ;
subplot(2,2,2);
plot(timeRange);

wave = sin(timeRange * pi * 2  .* frequencePerSampleRange );

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

