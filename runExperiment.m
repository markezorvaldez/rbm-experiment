hiddenUnits = [100 1000];
learningRate = [0.01 0.1];
numberEpochs = [100 250];
batchSize = [100 500];
bestParams = [0 0 0 0];
bestError = inf;

startLearning

for nHid = hiddenUnits
    for lRate = learningRate
        for nEpoch = numberEpochs
            for batchSz = batchSize
                [nHid, lRate, nEpoch, batchSz]
                [r, err] = demoBinaryRBM(nHid, lRate, nEpoch, batchSz);
                
                if err < error
                    bestParams = [nHid, lRate, nEpoch, batchSz];
                    error = err;
                end
            end
        end
    end
end

fprintf(bestParams)