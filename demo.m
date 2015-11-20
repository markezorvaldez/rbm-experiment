startLearning;
load('caltech101_silhouettes_28.mat');
load('caltech101_silhouettes_28_split1.mat')
load('bestRBM.mat');

[~,classErr,misClass] = bestRBM.classify(test_data, single(test_labels));


misClass = test_data(misClass,:);
clf; visWeights(misClass',0,[0 1]); title(sprintf('Missclassified -- Error=%1.2f %%',classErr*100));

nVis = 100;
figure; visWeights(bestRBM.W(:,1:nVis));
title('Sample of RBM Features');