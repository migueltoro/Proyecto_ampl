set ORIG;
set DEST;

param oferta{ORIG};
param demanda{DEST};

param coste{ORIG,DEST};

var x{ORIG,DEST} >= 0;

minimize CosteTotal:
   sum{i in ORIG,j in DEST}
      coste[i,j]*x[i,j];

subject to Oferta{i in ORIG}:
   sum{j in DEST} x[i,j] = oferta[i];

subject to Demanda{j in DEST}:
   sum{i in ORIG} x[i,j] = demanda[j];
