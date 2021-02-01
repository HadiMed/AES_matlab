function Blocks=msgto128bit(m) 

  m=dec2bin(m,8)' ; 
   
   m=m(:) ; 
  m=m'  ;
  
  Blocks=m ; 
  
  while mod(length(Blocks),128)~=0
      Blocks=['0',Blocks] ;
  end
  a=length(Blocks)/128 ;
   
  
   Blocks=Blocks(:) ; 
   
   Blocks=reshape(Blocks,128,a) ; 
   
   Blocks=Blocks' ; 
  