function  rightrate= ptest(testchar,gesturenum)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
right=0;
for i=1:20
 [estTR_a,estE_a,centa] =main1_i('a', 19,50,3,4,i );
[estTR_b,estE_b,centb] =main1_i('b', 19,50,3,4,i );
[estTR_c,estE_c,centc] =main1_i('z',19,50,3,4,i);
[estTR_d,estE_d,centd] =main1_i('d',19,50,3,4,i );
[estTR_e,estE_e,cente] =main1_i('e',19,50,3,4,i );
[estTR_f,estE_f,centf] =main1_i('f', 19,50,3,4,i );
[estTR_g,estE_g,centg] =main1_i('g',19,50,3,4,i );
%save(savefile, 'estTR_a','estE_a','centa','estTR_b','estE_b','centb','estTR_c','estE_c','centc',)
     temp=int2str(i);
     file=strcat(testchar,temp);
     Data= ReadataOne( file,gesturenum );
     [PSTATES,logpa]=test(estTR_a, estE_a,Data, centa);
    [PSTATES,logpb]=test(estTR_b, estE_b,Data, centb);
    [PSTATES,logpc]=test(estTR_c, estE_c,Data, centc);
    [PSTATES,logpd]=test(estTR_d, estE_d,Data, centd);
    [PSTATES,logpe]=test(estTR_e, estE_e,Data, cente);
   [PSTATES,logpf]=test(estTR_f, estE_f,Data, centf);
    [PSTATES,logpg]=test(estTR_g, estE_g,Data, centg);
   a= [logpa,logpb,logpc,logpd,logpe,logpf,logpg];
   a
     if(testchar=='z')
    testchar='c';
     end
     n=testchar-'a'+1;
      disp(n);
     
       [d, pddata] = max(a(1:7));
       if (pddata==n)
           right=right+1;
       end
           %if((n==6)&&i>=5)
            %   right=right+1;
           %end
       
         if(testchar=='c')
    testchar='z';
         end
   
   
end
 rightrate=right/20;    
 %}
 
     


end

