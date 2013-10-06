function trans = transinit(statenum)
   %{
 trans = eye(statenum) * 0.6;
    trans(statenum, statenum) = 0.5;
    for i = 1 : (statenum - 1)
        trans(i, i + 1) = 0.5;
%}
trans=ones(statenum,statenum)/(statenum-1)*0.5;
trans=trans+eye(statenum)*(0.5-0.5/(statenum-1));
    end