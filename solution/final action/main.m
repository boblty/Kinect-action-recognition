function logp =main(mychar, filenum,gesturenum,testchar,statenum,outputnum )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
 Dnode= Readata( mychar,filenum,gesturenum );
  [Dnode,cent] = DnodeInput(Dnode, statenum);
 Drawfeature(Dnode,cent);
  [estTR,estE]=HMM(statenum, outputnum,Dnode,gesturenum);
  Data= ReadataOne(testchar,gesturenum);
  [PSTATES,logp]=test(estTR, estE,Data, cent);
  
 

end

