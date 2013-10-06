function Data= ReadataOne( mychar,gesturenum )
%  Created by guyu 2013/04/30
%   generate data sets
g=gesturenum;
file=strcat(mychar,'.skd');
file;
Data=Feature_Extraction(gesturenum,file);
end

