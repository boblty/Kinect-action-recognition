function rightrate = result( testchar,gesturenum )
%created by guyu 2013/05/16
%  generate the probality of  successful
for i=1:20
     temp=int2str(i);
     file=strcat(testchar,temp);
    a(i,:)=main_main(gesturenum,file);
end
right=0;
if(testchar=='z')
    testchar='c';
end
 n=testchar-'a';
 disp(n);
 if(n~=0&&n~=6)
 for i=1:20
       [d, pddata(i)] = max(a(i,2:7));
       if (pddata(i)==n)
           right=right+1;
       end
 end
 end
 %if(n==6||n==0)
 %    right=15;
 %end
 rightrate=right/20;
 a
end

