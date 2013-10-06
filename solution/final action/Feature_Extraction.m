function Dnode2=Feature_Extraction(gesture_num,filename)
%   create by guyu 2013/04/30
%   Detailed explanation goes here
%modifed for 2 gestures
[skeleton,head,data]=readskd(gesture_num,filename);
Dnode=Myfeature( skeleton);
Dnode2=ones(6,size(Dnode,2));
for i=0:2
Dnode2(1+i,:)=Dnode(4+i,:);
Dnode2(4+i,:)=Dnode(10+i,:);
end
end

