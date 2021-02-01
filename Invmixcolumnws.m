function toto=Invmixcolumnws(m)
% fonction qui multiplie la matrice d'octet par la matrice inverse de la
% matrice utilise pour mixcolumns dans le groupe GF(2^8) 
for j=1:4 
    
tot=gf(hex2dec(m(1:4,j)),8,283) ; % transformation des vecteur de la matrice en matrice dans le groupe pour faciliter les operations 
%noter que le bitxor retransforme les elements en decimal 
 
    temp=tot ; 
    temp(1)=temp(1).*14 ; 
    temp(2)=temp(2).*11 ; 
    temp(3)=temp(3).*13 ;
    temp(4)=temp(4).*9 ; 
    
    t1=temp(1) ; 
    t2=temp(2) ; 
    t3=temp(3) ; 
    t4=temp(4) ; 
    S(1,j)=bitxor(bitxor(t1.x,t2.x),bitxor(t3.x,t4.x)) ;
    
    
 temp=tot ; 
    temp(2)=temp(2).*14 ; 
    temp(3)=temp(3).*11 ; 
    temp(4)=temp(4).*13 ;
    temp(1)=temp(1).*9 ; 
    
    t1=temp(1) ; 
    t2=temp(2) ; 
    t3=temp(3) ; 
    t4=temp(4) ; 
    S(2,j)=bitxor(bitxor(t1.x,t2.x),bitxor(t3.x,t4.x)) ;
    
    temp=tot ; 
    temp(3)=temp(3).*14 ; 
    temp(4)=temp(4).*11 ; 
    temp(1)=temp(1).*13 ;
    temp(2)=temp(2).*9 ; 
    
    t1=temp(1) ; 
    t2=temp(2) ; 
    t3=temp(3) ; 
    t4=temp(4) ; 
    S(3,j)=bitxor(bitxor(t1.x,t2.x),bitxor(t3.x,t4.x)) ;
    
    temp=tot ; 
    temp(4)=temp(4).*14 ; 
    temp(1)=temp(1).*11 ; 
    temp(2)=temp(2).*13 ;
    temp(3)=temp(3).*9 ; 
    
    t1=temp(1) ; 
    t2=temp(2) ; 
    t3=temp(3) ; 
    t4=temp(4) ; 
    S(4,j)=bitxor(bitxor(t1.x,t2.x),bitxor(t3.x,t4.x)) ;
end


toto=reshape(string(dec2hex(S)),4,4) ; 

