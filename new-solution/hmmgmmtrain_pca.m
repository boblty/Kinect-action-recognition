clear all
clc

% parameters
% left 5
% samplenum = 112;
% circle 6
% samplenum = 59;
% wavel 5
samplenum = 27;
% waver 5
% samplenum = 48;
% jump 6
% samplenum = 50;
statenum = 5;
testnum = 3;
mixnum = 1;
datadim = 3;

% filename parameters
dicname = 'E:\Kinect\recog\body_test\data\newdata';
filenameformat = 'wavel_';

% load data
for i = 1 : samplenum
    load(strcat(dicname, '\', filenameformat, num2str(i), '.txt'));
end
data = [];
for i = 1 : samplenum
    data = [data; eval(strcat(filenameformat, num2str(i)))];
end

% PCA processing
[coeff, score, latent] = princomp(data);
data = data * coeff(:, 1:3);

% reduce dimentionality
for i = 1 : samplenum
    eval(strcat(filenameformat, num2str(i), '=', filenameformat, num2str(i), '*coeff(:,1:3);'));
end

% fit GMM
options = statset('Display','final');
gmm = gmdistribution.fit(data, statenum, 'Options', options);

% % clustering
% idx = cluster(gmm, data);
% cluster1 = (idx == 1);
% cluster2 = (idx == 2);
% cluster3 = (idx == 3);
% cluster4 = (idx == 4);
% cluster5 = (idx == 5);
% % scatter plot
% figure(1);
% grid on;
% scatter3(data(cluster1, 1), data(cluster1, 2), data(cluster1, 3), 'ro');
% hold on;
% scatter3(data(cluster2, 1), data(cluster2, 2), data(cluster2, 3), 'go');
% hold on;
% scatter3(data(cluster3, 1), data(cluster3, 2), data(cluster3, 3), 'bo');
% hold on;
% scatter3(data(cluster4, 1), data(cluster4, 2), data(cluster4, 3), 'mo');
% hold on;
% scatter3(data(cluster5, 1), data(cluster5, 2), data(cluster5, 3), 'ko');

% initialize matrices
train_transmat = transinit(statenum);
train_prior = gmm.PComponents;
train_mixmat = ones(statenum, mixnum);
train_data = cell(1, samplenum);
for i = 1 : samplenum
    train_data{i} = eval(strcat(filenameformat, num2str(i)))';
end
train_mu = zeros(datadim, statenum, mixnum);
for i = 1 : statenum
    train_mu(:, i, mixnum) = gmm.mu(i, :)';
end
train_sigma = zeros(datadim, datadim, statenum, mixnum);
for i = 1 : statenum
    train_sigma(:, :, i, mixnum) = gmm.Sigma(:, :, i)';
end

% train with MHMM
[LL, trained_prior, trained_transmat, trained_mu, trained_sigma, trained_mixmat] = mhmm_em(train_data, train_prior, train_transmat, train_mu, train_sigma, train_mixmat);

% prob test
% load('E:\Kinect\recog\body_test\data\left\circle_29.txt');
% load('E:\Kinect\recog\body_test\data\left\circle_30.txt');
% load('E:\Kinect\recog\body_test\data\left\circle_31.txt');
testdata = cell(1, 1);
for i = 1 : samplenum
    testdata{1} = eval(strcat(filenameformat, num2str(i)))';
    loglik(i) = mhmm_logprob(testdata, trained_prior, trained_transmat, trained_mu, trained_sigma, trained_mixmat) / log(size(eval(strcat(filenameformat, num2str(i))), 1));
    length(i) = size(eval(strcat(filenameformat, num2str(i))), 1);
end

loglik
minlik = min(loglik);

% save trained parameters
matpostrainfilename = strcat(dicname, '\', filenameformat, 'gestrain.mat');
save(matpostrainfilename, 'trained_prior', 'trained_transmat', 'trained_mu', 'trained_sigma', 'trained_mixmat', 'coeff', 'minlik');

plot(loglik,'ro','LineWidth',2);
axis([0 60 -5 30]);
%hold on;
grid on;
%plot(length, 'r');
%hold off;

% noptest = load('E:\Kinect\recog\body_test\data\circle\circle_test_1.txt');
% noptest = noptest * coeff(:, 1:3);
% testdata{1} = noptest';
% loglik = mhmm_logprob(testdata, trained_prior, trained_transmat, trained_mu, trained_sigma, trained_mixmat) / size(noptest, 1) * 20
% 
% noptest = load('E:\Kinect\recog\body_test\data\circle\circle_test_2.txt');
% noptest = noptest * coeff(:, 1:3);
% testdata{1} = noptest';
% loglik = mhmm_logprob(testdata, trained_prior, trained_transmat, trained_mu, trained_sigma, trained_mixmat) / size(noptest, 1) * 20
% 
% noptest = load('E:\Kinect\recog\body_test\data\circle\circle_test_3.txt');
% noptest = noptest * coeff(:, 1:3);
% testdata{1} = noptest';
% loglik = mhmm_logprob(testdata, trained_prior, trained_transmat, trained_mu, trained_sigma, trained_mixmat) / size(noptest, 1) * 20

% noptest = load('E:\Kinect\recog\body_test\data\jump\jump_test_44.txt');
% noptest = noptest * coeff(:, 1:3);
% testdata{1} = noptest';
% loglik = mhmm_logprob(testdata, trained_prior, trained_transmat, trained_mu, trained_sigma, trained_mixmat) / log(size(noptest, 1))
% 
% noptest = load('E:\Kinect\recog\body_test\data\jump\jump_test_45.txt');
% noptest = noptest * coeff(:, 1:3);
% testdata{1} = noptest';
% loglik = mhmm_logprob(testdata, trained_prior, trained_transmat, trained_mu, trained_sigma, trained_mixmat) / log(size(noptest, 1))
% 
% noptest = load('E:\Kinect\recog\body_test\data\jump\jump_test_46.txt');
% noptest = noptest * coeff(:, 1:3);
% testdata{1} = noptest';
% loglik = mhmm_logprob(testdata, trained_prior, trained_transmat, trained_mu, trained_sigma, trained_mixmat) / log(size(noptest, 1))
% 
% noptest = load('E:\Kinect\recog\body_test\data\jump\jump_test_47.txt');
% noptest = noptest * coeff(:, 1:3);
% testdata{1} = noptest';
% loglik = mhmm_logprob(testdata, trained_prior, trained_transmat, trained_mu, trained_sigma, trained_mixmat) / log(size(noptest, 1))
% 
% noptest = load('E:\Kinect\recog\body_test\data\jump\jump_test_48.txt');
% noptest = noptest * coeff(:, 1:3);
% testdata{1} = noptest';
% loglik = mhmm_logprob(testdata, trained_prior, trained_transmat, trained_mu, trained_sigma, trained_mixmat) / log(size(noptest, 1))
% 
% noptest = load('E:\Kinect\recog\body_test\data\jump\jump_test_49.txt');
% noptest = noptest * coeff(:, 1:3);
% testdata{1} = noptest';
% loglik = mhmm_logprob(testdata, trained_prior, trained_transmat, trained_mu, trained_sigma, trained_mixmat) / log(size(noptest, 1))
% 
% noptest = load('E:\Kinect\recog\body_test\data\jump\jump_test_50.txt');
% noptest = noptest * coeff(:, 1:3);
% testdata{1} = noptest';
% loglik = mhmm_logprob(testdata, trained_prior, trained_transmat, trained_mu, trained_sigma, trained_mixmat) / log(size(noptest, 1))

noptest = load('E:\Kinect\recog\body_test\data\waver\waver_32.txt');
noptest = noptest * coeff(:, 1:3);
testdata{1} = noptest';
loglik = mhmm_logprob(testdata, trained_prior, trained_transmat, trained_mu, trained_sigma, trained_mixmat) / log(size(noptest, 1))

noptest = load('E:\Kinect\recog\KinRecog\KinRecog\tempdata.txt');
noptest = noptest * coeff(:, 1:3);
testdata{1} = noptest';
loglik = mhmm_logprob(testdata, trained_prior, trained_transmat, trained_mu, trained_sigma, trained_mixmat) / log(size(noptest, 1))








