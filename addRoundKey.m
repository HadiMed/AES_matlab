function toto=addRoundKey(Key,msg) 

decimalkey=hex2dec(Key) ; 
decimalmsg=hex2dec(msg) ; 

result=bitxor(decimalkey,decimalmsg) ; 

toto=reshape(string(dec2hex(result)),4,4) ; 

