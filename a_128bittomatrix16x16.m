function toto=a_128bittomatrix16x16(m) 

 toto=reshape(m,8,16)' ;
 
 toto=string(dec2hex(bin2dec(toto))) ; 
 
 toto=reshape(toto,4,4)' ; 
 
 
 
 
 