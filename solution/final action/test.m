function [PSTATES,logpseq]=test(estTR, estE,a1, cent)
seqtest = clustering(a1, cent);
[PSTATES,logpseq] = hmmdecode(seqtest, estTR, estE);
%disp('sucess');
x=exp(logpseq);
end