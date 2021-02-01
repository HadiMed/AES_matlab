function cipher=AESS(Key,msg) 
% fonction principale de AES qui fait appel aux differentes fonctions
% subyte , shiftrows , mix columns , addroundkey en effet cette fonction
% prend un bloc de 128 bits du msg clair et une cle de taille de 128 bits 
%et chiffre le bloc 
%cette fonction fait 2 tours mais ajustable si vous voulez changer le nbr
%des tours 

%transformation du message en matrice d'octet 
 m=msgto128bit(msg) ;
 m=a_128bittomatrix16x16(m(1,1:128)) ;
 %transformation de la cle en matrice d'octet
 roundKey=msgto128bit(Key) ; 
 roundKey=a_128bittomatrix16x16(roundKey(1,1:128))  ;
 %operation AES premier tour 
 m=subyte(m) ; 
 m=shiftrows(m) ;
 m=mixcolumn(m) ; 
 roundKey=generate1roundKey(roundKey,1) ; 
 m=addRoundKey(roundKey,m) ; 
%operation AES deuxieme tour 
m=subyte(m) ; 
 m=shiftrows(m) ;
 m=mixcolumn(m) ; 
 roundKey=generate1roundKey(roundKey,2) ; 
  m=addRoundKey(roundKey,m) ; 
  %transformation de la matrice en message chiffre 
  m=a_128bittomsg(matrix16x16to128bit(m)) ; 
  
 cipher=m ; 
