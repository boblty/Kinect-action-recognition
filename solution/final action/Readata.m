function Dnode= Readata( mychar,filenum,gesturenum )
%  Created by guyu 2013/04/30
%   generate data sets from skd files;
f=filenum;
g=gesturenum;
for i=1:f
     temp=int2str(i);
     file=strcat(mychar,temp);
     file=strcat(file,'.skd');
     Data=Feature_Extraction(gesturenum,file);
        for j=1:g
         Dnode(:,(i-1)*g+j)=Data(:,j);
        end
end


end

