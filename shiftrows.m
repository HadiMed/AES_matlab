function toto=shiftrows(m)
%la fonction fait exactemnt le shiftrows decrit en algorithme AES et le stock dans A  

A(1,1:4)=m(1,1:4) ; 

A(2,1)=m(2,2) ; 
A(2,2)=m(2,3) ; 
A(2,3)=m(2,4) ; 
A(2,4)=m(2,1) ; 
A(3,1)=m(3,3) ; 
A(3,2)=m(3,4) ; 
A(3,3)=m(3,1) ;
A(3,4)=m(3,2) ; 
A(4,1)=m(4,4) ;
A(4,2)=m(4,1) ; 
A(4,3)=m(4,2) ; 
A(4,4)=m(4,3) ; 

toto=A ; 

