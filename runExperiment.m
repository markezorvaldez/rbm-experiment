hiddenUnits = (100:100:1000);
learningRate = (0.01:0.01:0.1);
numberEpochs = 100;
batchSize = 101;
bestError = inf;
bestRBM = 0;
matrixOfErrors = zeros(10,10);
startLearning;
n = 0;
for nHid = hiddenUnits
    for lRate = learningRate
        [r, error] = demoBinaryRBM(nHid, ...
            lRate, ...
            numberEpochs, ...
            batchSize);
        [~, nHidIndex] = ismember(nHid, hiddenUnits);
        [~, lRateIndex] = ismember(lRate, learningRate);
        matrixOfErrors(nHidIndex,lRateIndex) = error;
        
        if error < bestError
            bestError = error;
            bestRBM = r;
        end
        
        n = n+1
    end
end

save('errorTable.mat', 'matrixOfErrors');
save('bestRBM.mat', 'bestRBM');