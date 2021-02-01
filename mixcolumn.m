function toto=mixcolumn(m) 

% fonction qui multiplie la matrice d'octet par la matrice utilise dans
% mixcolumns 

%noter que le bitxor retransforme les elements en decimal 
% pour des raison de compatibiltie de multiplication on utilise la fonction gf pour avoir la forme en GF(2^8)/283 ou 283 represente la forme decimal du polynome irreductible utilisee enn AES . 
for j=1:4 
    
tot=gf(hex2dec(m(1:4,j)),8,283) ; 
%cette fonction est inspire de la formule suivant :
%S'(1,j)=0x02.s(1,j) ⊕ 0x03.s(2,j) ⊕ s(3,j)  ⊕ s s(4,j) 
%S'(2,j)=0x02.s(2,j) ⊕ 0x03.s(3,j) ⊕ s(1,j)  ⊕ s s(4,j) 
%S'(3,j)=0x02.s(3,j) ⊕ 0x03.s(4,j) ⊕ s(1,j)  ⊕ s s(2,j) 
%S'(4,j)=0x02.s(4,j) ⊕ 0x03.s(1,j) ⊕ s(2,j)  ⊕ s s(3,j) 
for i=1:3 
    temp=tot ;
   temp(i)=temp(i).*2 ;
    temp(i+1)=temp(i+1).*3 ;
    t1=temp(1) ; 
    t2=temp(2) ; 
    t3=temp(3) ; 
    t4=temp(4) ; 
    S(i,j)=bitxor(bitxor(t1.x,t2.x),bitxor(t3.x,t4.x)) ; 
end 
temp=tot ;
temp(4)=temp(4).*2 ;
temp(1)=temp(1).*3 ; 
  
t1=temp(1) ; 
t2=temp(2) ; 
t3=temp(3) ; 
t4=temp(4) ; 
  S(4,j)=bitxor(bitxor(t1.x,t2.x),bitxor(t3.x,t4.x)) ;
end 


toto=string(dec2hex(S)) ; 
toto=reshape(toto,4,4) ; 





