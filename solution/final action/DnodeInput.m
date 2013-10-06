function  [Dnode,cent] = DnodeInput(Dnode,num)
        [idx, cent] = kmeans(Dnode', num);
        Dnode = [Dnode' idx]';
        
end
    