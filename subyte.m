function toto=subyte(MYMATRIX) 
%pour des raisons de complexite j'ai engendrer le tableau des inverses et le Sbox 
%la fonction trouve l'inverse en decoupant l'octet par exemple '01' en '0'
%et '1' comme il y'a des elemnts en zeros et matlab les tableaux commence
%par 1 donc il faut travaille par inverses(0+1,1+1) la fonction trouve que
%l'inverse et 1 il refait le meme travail pour trouver l image dans le
%Sbox.
inverses=["00"    "01"    "8D"    "F6"    "CB"    "52"    "7B"    "D1"    "E8"    "4F"    "29"    "C0"    "B0"    "E1"    "E5"    "C7"
    "74"    "B4"    "AA"    "4B"    "99"    "2B"    "60"    "5F"    "58"    "3F"    "FD"    "CC"    "FF"    "40"    "EE"    "B2"
    "3A"    "6E"    "5A"    "F1"    "55"    "4D"    "A8"    "C9"    "C1"    "0A"    "98"    "15"    "30"    "44"    "A2"    "C2"
    "2C"    "45"    "92"    "6C"    "F3"    "39"    "66"    "42"    "F2"    "35"    "20"    "6F"    "77"    "BB"    "59"    "19"
    "1D"    "FE"    "37"    "67"    "2D"    "31"    "F5"    "69"    "A7"    "64"    "AB"    "13"    "54"    "25"    "E9"    "09"
    "ED"    "5C"    "05"    "CA"    "4C"    "24"    "87"    "BF"    "18"    "3E"    "22"    "F0"    "51"    "EC"    "61"    "17"
    "16"    "5E"    "AF"    "D3"    "49"    "A6"    "36"    "43"    "F4"    "47"    "91"    "DF"    "33"    "93"    "21"    "3B"
    "79"    "B7"    "97"    "85"    "10"    "B5"    "BA"    "3C"    "B6"    "70"    "D0"    "06"    "A1"    "FA"    "81"    "82"
    "83"    "7E"    "7F"    "80"    "96"    "73"    "BE"    "56"    "9B"    "9E"    "95"    "D9"    "F7"    "02"    "B9"    "A4"
    "DE"    "6A"    "32"    "6D"    "D8"    "8A"    "84"    "72"    "2A"    "14"    "9F"    "88"    "F9"    "DC"    "89"    "9A"
    "FB"    "7C"    "2E"    "C3"    "8F"    "B8"    "65"    "48"    "26"    "C8"    "12"    "4A"    "CE"    "E7"    "D2"    "62"
    "0C"    "E0"    "1F"    "EF"    "11"    "75"    "78"    "71"    "A5"    "8E"    "76"    "3D"    "BD"    "BC"    "86"    "57"
    "0B"    "28"    "2F"    "A3"    "DA"    "D4"    "E4"    "0F"    "A9"    "27"    "53"    "04"    "1B"    "FC"    "AC"    "E6"
    "7A"    "07"    "AE"    "63"    "C5"    "DB"    "E2"    "EA"    "94"    "8B"    "C4"    "D5"    "9D"    "F8"    "90"    "6B"
    "B1"    "0D"    "D6"    "EB"    "C6"    "0E"    "CF"    "AD"    "08"    "4E"    "D7"    "E3"    "5D"    "50"    "1E"    "B3"
    "5B"    "23"    "38"    "34"    "68"    "46"    "03"    "8C"    "DD"    "9C"    "7D"    "A0"    "CD"    "1A"    "41"    "1C"
] ; 

Sbox=["63" "7c" "77" "7b" "f2" "6b" "6f" "c5" "30" "01" "67" "2b" "fe" "d7" "ab" "76"
"ca" "82" "c9" "7d" "fa" "59" "47" "f0" "ad" "d4" "a2" "af" "9c" "a4" "72" "c0"
"b7" "fd" "93" "26" "36" "3f" "f7" "cc" "34" "a5" "e5" "f1" "71" "d8" "31" "15"
"04" "c7" "23" "c3" "18" "96" "05" "9a" "07" "12" "80" "e2" "eb" "27" "b2" "75"
"09" "83" "2c" "1a" "1b" "6e" "5a" "a0" "52" "3b" "d6" "b3" "29" "e3" "2f" "84"
"53" "d1" "00" "ed" "20" "fc" "b1" "5b" "6a" "cb" "be" "39" "4a" "4c" "58" "cf"
"d0" "ef" "aa" "fb" "43" "4d" "33" "85" "45" "f9" "02" "7f" "50" "3c" "9f" "a8"
"51" "a3" "40" "8f" "92" "9d" "38" "f5" "bc" "b6" "da" "21" "10" "ff" "f3" "d2"
"cd" "0c" "13" "ec" "5f" "97" "44" "17" "c4" "a7" "7e" "3d" "64" "5d" "19" "73"
"60" "81" "4f" "dc" "22" "2a" "90" "88" "46" "ee" "b8" "14" "de" "5e" "0b" "db"
"e0" "32" "3a" "0a" "49" "06" "24" "5c" "c2" "d3" "ac" "62" "91" "95" "e4" "79"
"e7" "c8" "37" "6d" "8d" "d5" "4e" "a9" "6c" "56" "f4" "ea" "65" "7a" "ae" "08"
"ba" "78" "25" "2e" "1c" "a6" "b4" "c6" "e8" "dd" "74" "1f" "4b" "bd" "8b" "8a"
"70" "3e" "b5" "66" "48" "03" "f6" "0e" "61" "35" "57" "b9" "86" "c1" "1d" "9e"
"e1" "f8" "98" "11" "69" "d9" "8e" "94" "9b" "1e" "87" "e9" "ce" "55" "28" "df"
"8c" "a1" "89" "0d" "bf" "e6" "42" "68" "41" "99" "2d" "0f" "b0" "54" "bb" "16"
]  ; 

for i=1:4 
    for j=1:4
        toto1=MYMATRIX(i,j) ; 
        ind1=hex2dec(toto1{1}(1)) ;
        ind2=hex2dec(toto1{1}(2)) ; 
      
        Inv=inverses(ind1+1,ind2+1) ; 
      ind1=hex2dec(Inv{1}(1)) ;
        ind2=hex2dec(Inv{1}(2)) ; 
        Sub(i,j)=Sbox(ind1+1,ind2+1) ; 
    end
end

toto=Sub; 
