% Using the demoBinaryRBM MNIST.m from the METAL implementation
% with a few changes
function [r, classErr] = demoBinaryRBM(numHid, lRate, nEpoch, batchSz)
fprintf('\nHere we train an RBM with Binary inputs (CalTech silhouettes 28x28 datastet).\n');

% LOAD DATASET
load('caltech101_silhouettes_28.mat');
load('caltech101_silhouettes_28_split1.mat')

[nObs,nVis] = size(train_data);

nHid = numHid; % ideal 1000

% DEFINE A MODEL ARCHITECTURE
arch = struct('size', [nVis,nHid], 'classifier',true, 'inputType','binary');

% GLOBAL OPTIONS
arch.opts = {'verbose', 1, ...
		 'lRate', lRate, ...      % ideal 0.1
		'nEpoch', nEpoch, ...      % ideal 250
		'batchSz', batchSz, ...     % ideal 101
		'beginAnneal', 10, ...
		'nGibbs', 1};
%  		'visFun', @visBinaryRBMLearning};

% INITIALIZE RBM


r = rbm(arch);

% TRAIN THE RBM
r = r.train(train_data,single(train_labels));

[~,classErr,misClass] = r.classify(test_data, single(test_labels));


misClass = test_data(misClass,:);
clf; visWeights(misClass',0,[0 1]); title(sprintf('Missclassified -- Error=%1.2f %%',classErr*100));

nVis = 100;
figure; visWeights(r.W(:,1:nVis));
title('Sample of RBM Features');