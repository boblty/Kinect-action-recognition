function  [estTR,estE,cent] =main1_i(mychar, filenum,gesturenum,statenum,outputnum,n )
% created by guyu 2013/05/15
% train the maxtric of estTR and estE
 Dnode= Readata_i( mychar,filenum,gesturenum ,n);
  %[Dnode,cent] = DnodeInput(Dnode, statenum);
  [Dnode1,cent] = DnodeInput(Dnode, outputnum);
% Drawfeature(Dnode1,cent);
  [estTR,estE]=HMM(statenum, outputnum,Dnode1,gesturenum);
 %Data= ReadataOne( testchar,gesturenum );
%  [PSTATES,logp]=test(estTR, estE,Data, cent);
  
 

end

