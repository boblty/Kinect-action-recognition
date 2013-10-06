function [skeleton,head,data]=readskd(gesture_num,filename)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
fileID=fopen(filename);
head=fread(fileID,[1,26],'int16');
fseek(fileID,26, 'bof');
data=fread(fileID,[5*20,gesture_num],'int16');
for i=0:19
    for j=1:3
       skeleton(i*3+j,:)= data(i*5+j,:);
    end
end
fclose(fileID);


end

