function pddata = clustering(data, cent)
%created  by guyu
%2013/05/01 
% modified for feature 2 and feature 4;
     data=data';
    for i = 1 : size(data, 1)
        for j = 1 : size(cent, 1)
            for w=1:2
            temp(j,w) = (data(i, 3*(w-1)+1) - cent(j,3*(w-1)+ 1))^2 + (data(i, 3*(w-1)+2) - cent(j, 3*(w-1)+2))^2 + (data(i, 3*(w-1)+3) - cent(j, 3*(w-1)+3))^2;
            end
            mytemp(j)=sum(temp(j,2),2);
        end
        [d, pddata(i)] = min(mytemp);
    end

end