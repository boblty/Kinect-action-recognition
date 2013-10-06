function Drawfeature(Dnode,cent)
%created by guyu 2013/04/30
%   Detailed explanation goes hereDo

data=Dnode';
for i=1:2
figure(i);
plot3(data(data(:,7)==1,1+(i-1)*3), data(data(:,7)==1,2+(i-1)*3), data(data(:,7)==1,3+(i-1)*3), 'bx');
hold on;
plot3(data(data(:,7)==2,1+(i-1)*3), data(data(:,7)==2,2+(i-1)*3), data(data(:,7)==2,3+(i-1)*3), 'gx');
hold on;
plot3(data(data(:,7)==3,1+(i-1)*3), data(data(:,7)==3,2+(i-1)*3), data(data(:,7)==3,3+(i-1)*3), 'yx');
hold on;
plot3(data(data(:,7)==4,1+(i-1)*3), data(data(:,7)==4,2+(i-1)*3), data(data(:,7)==4,3+(i-1)*3), 'mx');
hold on;
plot3(data(data(:,7)==5,1+(i-1)*3), data(data(:,7)==5,2+(i-1)*3), data(data(:,7)==5,3+(i-1)*3), 'cx');
hold on;
plot3(data(data(:,7)==6,1+(i-1)*3), data(data(:,7)==6,2+(i-1)*3), data(data(:,7)==6,3+(i-1)*3), 'mx');
hold on;
plot3(data(data(:,7)==7,1+(i-1)*3), data(data(:,7)==7,2+(i-1)*3), data(data(:,7)==7,3+(i-1)*3), 'kx');
hold on;
plot3(data(data(:,7)==8,1+(i-1)*3), data(data(:,7)==8,2+(i-1)*3), data(data(:,7)==8,3+(i-1)*3), 'rx');
hold on;
plot3(cent(:,1+(i-1)*3), cent(:,2+(i-1)*3), cent(:,3+(i-1)*3), 'ro');
grid on;
end

end

