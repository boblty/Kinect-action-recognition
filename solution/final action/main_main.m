function a= main_main(gesturenum,testchar)
%created by guyu 2013/05/15
%return the probility of test
%load('matrixes.mat')
%{
for i=1:20
     temp=int2str(i);
     file=strcat(testchar,temp);
     file=strcat(file,'.skd');

end 
%}
load('193.mat')
Data= ReadataOne( testchar,gesturenum );

    [PSTATES,logpa]=test(estTR_a, estE_a,Data, centa);
    [PSTATES,logpb]=test(estTR_b, estE_b,Data, centb);
    [PSTATES,logpc]=test(estTR_c, estE_c,Data, centc);
    [PSTATES,logpd]=test(estTR_d, estE_d,Data, centd);
    [PSTATES,logpe]=test(estTR_e, estE_e,Data, cente);
   [PSTATES,logpf]=test(estTR_f, estE_f,Data, centf);
    [PSTATES,logpg]=test(estTR_g, estE_g,Data, centg);
   a= [logpa,logpb,logpc,logpd,logpe,logpf,logpg];
    
end

