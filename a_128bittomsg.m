function toto=a_128bittomsg(m)
%fonction change 128 bits en caractere en prenant chaque cqrqctere codee
%sur 8 bits donc total de 16 caractere
 m=reshape(m,8,16)' ;
 
 m=bin2dec(m) ; 
 
 m=char(m) ;  
 
 toto=m' ;
 
 