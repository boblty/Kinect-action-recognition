function Dnode=Myfeature( skeleton)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%for i=0:8
   for j=1:3
      
     t0(j,:)=skeleton(6*3+j,:)-skeleton(5*3+j,:);
     t1(j,:)=skeleton(10*3+j,:)-skeleton(9*3+j,:);
     t2(j,:)=skeleton(5*3+j,:)-skeleton(4*3+j,:);
     t3(j,:)=skeleton(9*3+j,:)-skeleton(8*3+j,:);
     t4(j,:)=skeleton(12*3+j,:)-skeleton(13*3+j,:);
     t5(j,:)=skeleton(16*3+j,:)-skeleton(17*3+j,:);
     t6(j,:)=skeleton(13*3+j,:)-skeleton(14*3+j,:);
     t7(j,:)=skeleton(17*3+j,:)-skeleton(18*3+j,:);
     t8(j,:)=skeleton(0*3+j,:)-skeleton(2*3+j,:);
    
   end
   
   for i=1:9
       sum(i,:)=zeros(1,size(skeleton,2));
   end
   for j=1:3
       sum(1,:)=sum(1,:)+t0(j,:).*t0(j,:);
       sum(2,:)=sum(2,:)+t1(j,:).*t1(j,:);
        sum(3,:)=sum(3,:)+t2(j,:).*t2(j,:);
       sum(4,:)=sum(4,:)+t3(j,:).*t3(j,:);
       sum(5,:)=sum(5,:)+t4(j,:).*t4(j,:);
       sum(6,:)=sum(6,:)+t5(j,:).*t5(j,:);
       sum(7,:)=sum(7,:)+t6(j,:).*t6(j,:);
       sum(8,:)=sum(8,:)+t7(j,:).*t7(j,:);
       sum(9,:)=sum(9,:)+t8(j,:).*t8(j,:);
   end

     for j=1:3
      
   Dnode(0*3+j,:) = t0(j,:)./sqrt(sum(1,:));
   Dnode(1*3+j,:) = t1(j,:)./sqrt(sum(2,:));
   Dnode(2*3+j,:) = t2(j,:)./sqrt(sum(3,:));
   Dnode(3*3+j,:) = t3(j,:)./sqrt(sum(4,:));
   Dnode(4*3+j,:) = t4(j,:)./sqrt(sum(5,:));
   Dnode(5*3+j,:) = t5(j,:)./sqrt(sum(6,:));
   Dnode(6*3+j,:) = t6(j,:)./sqrt(sum(7,:));
   Dnode(7*3+j,:) = t7(j,:)./sqrt(sum(8,:));
   Dnode(8*3+j,:) = t8(j,:)./sqrt(sum(9,:));
    
   end
       

end

