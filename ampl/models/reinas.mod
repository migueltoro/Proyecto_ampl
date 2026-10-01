# -------------------------------------------------------
# N-Reinas usando restricciones globales alldiff
# Requiere un solver CP (por ejemplo Gecode)
# -------------------------------------------------------

param N integer > 0;

set ROWS := 1..N;

var q {ROWS} integer >= 1 <= N;

subject to Cols:
    alldiff {i in ROWS} q[i];

subject to Diag1:
    alldiff {i in ROWS} (q[i] + i);

subject to Diag2:
    alldiff {i in ROWS} (q[i] - i);

minimize dummy:
    0;