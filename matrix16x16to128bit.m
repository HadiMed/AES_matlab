function toto=matrix16x16to128bit(MYMATRIX)
%fonction tansforme matrice de 16 octet en 128 bits 

 m=hex2dec(MYMATRIX)' ; 
 m=dec2bin(m,8) ;
 
 
m=m' ; 

toto=reshape(m,1,128) ; 

