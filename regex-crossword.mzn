enum LETTER = {

  A, B, C, D, E, F, G, H, I, J, K, L, M,

  N, O, P, Q, R, S, T, U, V, W, X, Y, Z

};


array[1..7] of var LETTER: row1;

array[1..8] of var LETTER: row2;

array[1..9] of var LETTER: row3;

array[1..10] of var LETTER: row4;

array[1..11] of var LETTER: row5;

array[1..12] of var LETTER: row6;

array[1..13] of var LETTER: row7;

array[1..12] of var LETTER: row8;

array[1..11] of var LETTER: row9;

array[1..10] of var LETTER: row10;

array[1..9] of var LETTER: row11;

array[1..8] of var LETTER: row12;

array[1..7] of var LETTER: row13;


array[1..7] of var LETTER: up_diagonal1;

array[1..8] of var LETTER: up_diagonal2;

array[1..9] of var LETTER: up_diagonal3;

array[1..10] of var LETTER: up_diagonal4;

array[1..11] of var LETTER: up_diagonal5;

array[1..12] of var LETTER: up_diagonal6;

array[1..13] of var LETTER: up_diagonal7;

array[1..12] of var LETTER: up_diagonal8;

array[1..11] of var LETTER: up_diagonal9;

array[1..10] of var LETTER: up_diagonal10;

array[1..9] of var LETTER: up_diagonal11;

array[1..8] of var LETTER: up_diagonal12;

array[1..7] of var LETTER: up_diagonal13;


include "globals.mzn";


constraint regular(row1, ".* H .* H .*");

constraint regular(row2, "(D I|N S|T H|O M)*");

constraint regular(row3, "F .* [A O] .* [A O] .*");

constraint regular(row4, "(O|R H H|M M)*");

% row 5 is ".*"

constraint regular(row6, "C* M C (C C C|M M)*");

constraint regular(row7, "[^C]* [^R]* I I I .*");

% constraint regular(row8, "(. . .?) \1*);

constraint regular(row9, "([^X]|X C C)*");

constraint regular(row10, "(R R|H H H)* .?");

constraint regular(row11, "N .* X . X . X .* E");

constraint regular(row12, "R* D* M*");

constraint regular(row13, ". (C|H H)*");


constraint regular(up_diagonal1, "[^X]* (D N|T E|N I)");

constraint up_diagonal1[1] = row7[1];

constraint up_diagonal1[2] = row6[1];

constraint up_diagonal1[3] = row5[1];

constraint up_diagonal1[4] = row4[1];

constraint up_diagonal1[5] = row3[1];

constraint up_diagonal1[6] = row2[1];

constraint up_diagonal1[7] = row1[1];


constraint regular(up_diagonal2, "[R O N H M C]* I [R O N H M C]*");

constraint up_diagonal2[1] = row8[1];

constraint up_diagonal2[2] = row7[2];

constraint up_diagonal2[3] = row6[2];

constraint up_diagonal2[4] = row5[2];

constraint up_diagonal2[5] = row4[2];

constraint up_diagonal2[6] = row3[2];

constraint up_diagonal2[7] = row2[2];

constraint up_diagonal2[8] = row1[2];


% constraint regular(up_diagonal3, ".* (. .) \1 P+");

constraint up_diagonal3[1] = row9[1];

constraint up_diagonal3[2] = row8[2];

constraint up_diagonal3[3] = row7[3];

constraint up_diagonal3[4] = row6[3];

constraint up_diagonal3[5] = row5[3];

constraint up_diagonal3[6] = row4[3];

constraint up_diagonal3[7] = row3[3];

constraint up_diagonal3[8] = row2[3];

constraint up_diagonal3[9] = row1[3];


constraint regular(up_diagonal4, "(E|R C|N M)*");

constraint up_diagonal4[1] = row10[1];

constraint up_diagonal4[2] = row9[2];

constraint up_diagonal4[3] = row8[3];

constraint up_diagonal4[4] = row7[4];

constraint up_diagonal4[5] = row6[4];

constraint up_diagonal4[6] = row5[4];

constraint up_diagonal4[7] = row4[4];

constraint up_diagonal4[8] = row3[4];

constraint up_diagonal4[9] = row2[4];

constraint up_diagonal4[10] = row1[4];


constraint regular(up_diagonal5, "([^M C]|M M|C C)*");

constraint up_diagonal5[1] = row11[1];

constraint up_diagonal5[2] = row10[2];

constraint up_diagonal5[3] = row9[3];

constraint up_diagonal5[4] = row8[4];

constraint up_diagonal5[5] = row7[5];

constraint up_diagonal5[6] = row6[5];

constraint up_diagonal5[7] = row5[5];

constraint up_diagonal5[8] = row4[5];

constraint up_diagonal5[9] = row3[5];

constraint up_diagonal5[10] = row2[5];

constraint up_diagonal5[11] = row1[5];


constraint regular(up_diagonal6, "R? (C R)* M C [M A]*");

constraint up_diagonal6[1] = row12[1];

constraint up_diagonal6[2] = row11[2];

constraint up_diagonal6[3] = row10[3];

constraint up_diagonal6[4] = row9[4];

constraint up_diagonal6[5] = row8[5];

constraint up_diagonal6[6] = row7[6];

constraint up_diagonal6[7] = row6[6];

constraint up_diagonal6[8] = row5[6];

constraint up_diagonal6[9] = row4[6];

constraint up_diagonal6[10] = row3[6];

constraint up_diagonal6[11] = row2[6];

constraint up_diagonal6[12] = row1[6];


% up-diagonal 7 is ".*"

constraint up_diagonal7[1] = row13[1];

constraint up_diagonal7[2] = row12[2];

constraint up_diagonal7[3] = row11[3];

constraint up_diagonal7[4] = row10[4];

constraint up_diagonal7[5] = row9[5];

constraint up_diagonal7[6] = row8[6];

constraint up_diagonal7[7] = row7[7];

constraint up_diagonal7[8] = row6[7];

constraint up_diagonal7[9] = row5[7];

constraint up_diagonal7[10] = row4[7];

constraint up_diagonal7[11] = row3[7];

constraint up_diagonal7[12] = row2[7];

constraint up_diagonal7[13] = row1[7];


constraint regular(up_diagonal8, ".* C D D .* R R P .*");

constraint up_diagonal8[1] = row13[2];

constraint up_diagonal8[2] = row12[3];

constraint up_diagonal8[3] = row11[4];

constraint up_diagonal8[4] = row10[6];

constraint up_diagonal8[5] = row9[7];

constraint up_diagonal8[6] = row8[8];

constraint up_diagonal8[7] = row7[8];

constraint up_diagonal8[8] = row6[8];

constraint up_diagonal8[9] = row5[8];

constraint up_diagonal8[10] = row4[8];

constraint up_diagonal8[11] = row3[8];

constraint up_diagonal8[12] = row2[8];


constraint regular(up_diagonal9, "(X H H|[^X H])*");

constraint up_diagonal9[1] = row13[3];

constraint up_diagonal9[2] = row12[4];

constraint up_diagonal9[3] = row11[5];

constraint up_diagonal9[4] = row10[6];

constraint up_diagonal9[5] = row9[7];

constraint up_diagonal9[6] = row8[8];

constraint up_diagonal9[7] = row7[9];

constraint up_diagonal9[8] = row6[9];

constraint up_diagonal9[9] = row5[9];

constraint up_diagonal9[10] = row4[9];

constraint up_diagonal9[11] = row3[9];


constraint regular(up_diagonal10, "([^C M E]|M E)*");

constraint up_diagonal10[1] = row13[4];

constraint up_diagonal10[2] = row12[5];

constraint up_diagonal10[3] = row11[6];

constraint up_diagonal10[4] = row10[7];

constraint up_diagonal10[5] = row9[8];

constraint up_diagonal10[6] = row8[9];

constraint up_diagonal10[7] = row7[10];

constraint up_diagonal10[8] = row6[10];

constraint up_diagonal10[9] = row5[10];

constraint up_diagonal10[10] = row4[10];


constraint regular(up_diagonal11, ".* R X O .*");

constraint up_diagonal11[1] = row13[5];

constraint up_diagonal11[2] = row12[6];

constraint up_diagonal11[3] = row11[7];

constraint up_diagonal11[4] = row10[8];

constraint up_diagonal11[5] = row9[9];

constraint up_diagonal11[6] = row8[10];

constraint up_diagonal11[7] = row7[11];

constraint up_diagonal11[8] = row6[11];

constraint up_diagonal11[9] = row5[11];


constraint regular(up_diagonal12, ".* L R .* R L .*");

constraint up_diagonal12[1] = row13[6];

constraint up_diagonal12[2] = row12[7];

constraint up_diagonal12[3] = row11[8];

constraint up_diagonal12[4] = row10[9];

constraint up_diagonal12[5] = row9[10];

constraint up_diagonal12[6] = row8[11];

constraint up_diagonal12[7] = row7[12];

constraint up_diagonal12[8] = row6[12];


constraint regular(up_diagonal13, ".* E U .* E S .*");

constraint up_diagonal13[1] = row13[7];

constraint up_diagonal13[2] = row12[8];

constraint up_diagonal13[3] = row11[9];

constraint up_diagonal13[4] = row10[10];

constraint up_diagonal13[5] = row9[11];

constraint up_diagonal13[6] = row8[12];

constraint up_diagonal13[7] = row7[13];


solve satisfy;
