hiddenUnits = (100:100:1000);
learningRate = (0.01:0.01:0.1);
numberEpochs = 100;
batchSize = 101;
bestError = inf;
bestRBM = 0;
matrixOfErrors = zeros(10,10);
startLearning;

for nHid = hiddenUnits
    for lRate = learningRate
        [r, error] = demoBinaryRBM(nHid, ...
            lRate, ...
            numberEpochs, ...
            batchSize);
        matrixOfErrors((nHid/100),(lRate*100)) = error;
        
        if error < bestError
            bestError = error;
            bestRBM = r;
        end
            
    end
end

save('errorTable.mat', 'matrixOfErrors');
save('bestRBM.mat', 'bestRBM');