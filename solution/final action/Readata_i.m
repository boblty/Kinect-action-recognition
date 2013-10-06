function Dnode= Readata_i( mychar,filenum,gesturenum ,n)
%  Created by guyu 2013/04/30
%   generate data sets from skd files;
f=filenum;
g=gesturenum;
m=0;
for i=1:f
    if(i>=n)
        m=i+1;
    else m=i;
    end
     temp=int2str(m);
     file=strcat(mychar,temp);
     file=strcat(file,'.skd');
     Data=Feature_Extraction(gesturenum,file);
        for j=1:g
         Dnode(:,(i-1)*g+j)=Data(:,j);
        end
end


end

