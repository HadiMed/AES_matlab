function msg=decryptAES(Key,cipher) 
%fonction AES principale qui fait le decryptage en appelant les differents fonctions Invmixcolumns , 
%invshiftrows , invsubyte 
%notez que addroundkey peut etre utilise pour le decryptage car c'est une fonction qui fait 
% le XOR exclusive 
%cette fonction travaille sur deux tours 

%transformation du cipher en matrice d'octet 
Cip=msgto128bit(cipher) ; 
Cip=a_128bittomatrix16x16(Cip) ; 
%transformation de la cle en matrice d'octet 
Key=msgto128bit(Key) ; 
Key=a_128bittomatrix16x16(Key(1,1:128))  ;
%generation des cle de tours 
% en effet pour decrypter il faut commencer par la derniere cle utilise 
roundKey1=generate1roundKey(Key,1) ; 
roundKey2=generate1roundKey(roundKey1,2) ; 

% operation AES inverser pour faire le decryptage 2 eme tour 
Cip=addRoundKey(roundKey2,Cip) ;
Cip=Invmixcolumnws(Cip) ; 
Cip=Invshiftrows(Cip) ; 
Cip=invsubyte(Cip) ; 
%operation AES inverser pour faire le decryptage 1 er tour 
Cip=addRoundKey(roundKey1,Cip) ;
Cip=Invmixcolumnws(Cip) ; 
Cip=Invshiftrows(Cip) ; 
Cip=invsubyte(Cip) ; 
%transformation de matrice d'octet en message clair
Cip=matrix16x16to128bit(Cip) ; 
Cip=a_128bittomsg(Cip) ; 
%eliminationn des espaces au debut si le message a moins que 16 caracteres 
Cip=Cip' ;

i=1 ;
while uint8(Cip(i))==0 
    i=i+1 ;
end 
display(i) ; 
Cip=Cip(i:length(Cip))' ;

msg=Cip ;
