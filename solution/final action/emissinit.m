function emiss = emissinit(statenum, emissnum)
    emiss = (0.01*rand(statenum, emissnum) + ones(statenum, emissnum)) / emissnum;
    for i = 1 : statenum
        rsum = sum(emiss(i,:));
        emiss(i,:) = emiss(i,:) ./ rsum;
    end
    