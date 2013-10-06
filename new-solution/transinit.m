function trans = transinit(statenum)
    trans = ones(statenum, statenum) * 0.5 / (statenum - 1);
    trans = trans + eye(statenum) * 0.5 - eye(statenum) * 0.5 / (statenum - 1);
%     trans(statenum, statenum) = 1;
%     for i = 1 : (statenum - 1)
%         trans(i, i + 1) = 0.5;
%     end
    
    