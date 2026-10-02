# -------------------------------------------------
# Problema de coloreado de grafos
# Minimizar el numero de colores utilizados
# -------------------------------------------------

param n integer > 0;

set V := 1..n;

# Aristas (i,j) con i<j
set E within {V,V};

# Colores disponibles; n colores siempre son suficientes
set C := 1..n;

# Color asignado a cada vertice
var Color{V} integer >= 1 <= 10;

# Los extremos de cada arista deben tener colores diferentes
s.t. AdjacentDiff{(i,j) in E}:
   # alldiff (Color[i], Color[j]);
   Color[i] != Color[j];

# Minimizar el mayor color asignado
minimize NumColors:
    max {v in V} Color[v];
