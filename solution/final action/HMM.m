function [estTR,estE]=HMM(statenum, outputnum,data,gesturenum)
g=gesturenum;
trans = transinit(statenum);
%trans=ones(6,6)/6;
emiss = emissinit(statenum, outputnum);
s=statenum;
O=outputnum;
spoint = 1;
epoint = g;
data=data';
seq_1 = data(spoint:epoint, 7)';
spoint = epoint + 1;
epoint = epoint + g;
seq_2 = data(spoint:epoint, 7)';
spoint = epoint + 1;
epoint = epoint + g;
seq_3 = data(spoint:epoint, 7)';
spoint = epoint + 1;
epoint = epoint + g;
seq_4 = data(spoint:epoint, 7)';
spoint = epoint + 1;
epoint = epoint + g;
seq_5 = data(spoint:epoint, 7)';
spoint = epoint + 1;
epoint = epoint + g;
seq_6 = data(spoint:epoint, 7)';
spoint = epoint + 1;
epoint = epoint + g;
seq_7 = data(spoint:epoint, 7)';
spoint = epoint + 1;
epoint = epoint + g;
seq_8 = data(spoint:epoint, 7)';
spoint = epoint + 1;
epoint = epoint + g;
seq_9 = data(spoint:epoint, 7)';
spoint = epoint + 1;
epoint = epoint + g;
seq_10 = data(spoint:epoint, 7)';
spoint = epoint + 1;
epoint = epoint + g;
seq_11 = data(spoint:epoint, 7)';
spoint = epoint + 1;
epoint = epoint + g;
seq_12 = data(spoint:epoint, 7)';
spoint = epoint + 1;
epoint = epoint + g;
seq_13 = data(spoint:epoint, 7)';
spoint = epoint + 1;
epoint = epoint + g;
seq_14 = data(spoint:epoint, 7)';
spoint = epoint + 1;
epoint = epoint + g;
seq_15 = data(spoint:epoint, 7)';
spoint = epoint + 1;
epoint = epoint + g;
seq_16 = data(spoint:epoint,7)';
spoint = epoint + 1;
epoint = epoint + g;
seq_17 = data(spoint:epoint, 7)';
spoint = epoint + 1;
epoint = epoint + g;
seq_18 = data(spoint:epoint, 7)';
spoint = epoint + 1;
epoint = epoint + g;
seq_19 = data(spoint:epoint,7)';
spoint = epoint + 1;
epoint = epoint + g;
%seq_20 = data(spoint:epoint, 7)';

%seqs = {seq_1,seq_2,seq_3,seq_4, seq_5,seq_6,seq_7,seq_8,seq_9,seq_10,seq_11,seq_12, seq_13, seq_14, seq_15,seq_16,seq_17, seq_18,seq_19,seq_20};
seqs = {seq_1,seq_2,seq_3,seq_4, seq_5,seq_6,seq_7,seq_8,seq_9,seq_10,seq_11,seq_12, seq_13, seq_14, seq_15,seq_16,seq_17, seq_18,seq_19};


[estTR,estE] = hmmtrain(seqs,trans,emiss);
%{
A=ones(s)*0.000001;
estTR=estTR+A;
for i=1:s
  estTR(i,:)=estTR(i,:)/sum(estTR(i,:),2);
end 
 A=ones(s,O)*0.00001;
estE=estE+A;
for i=1:s
  estE(i,:)=estE(i,:)/sum(estE(i,:),2);
end    

%seqtest = clustering(a1, cent);
%{
[PSTATES,logpseq] = hmmdecode(seqtest, estTR, estE);
logpseq
load('data/circle/test_2.txt');
seqtest = clustering(test_2, cent);
[PSTATES,logpseq] = hmmdecode(seqtest, estTR, estE);
logpseq
fprintf('done\n');
%}
%}
end
