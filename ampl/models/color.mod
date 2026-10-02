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
var Color{V} integer >= 1 <= n;

# Fijar la etiqueta del primer color elimina permutaciones equivalentes
s.t. FirstColor:
    Color[1] = 1;

# Introducir etiquetas nuevas en orden elimina simetrias restantes
s.t. OrderedColorIntroduction{v in 2..n}:
    Color[v] <= 1 + max {u in 1..v-1} Color[u];

# Los extremos de cada arista deben tener colores diferentes
s.t. AdjacentDiff{(i,j) in E}:
    Color[i] != Color[j];

# Minimizar el mayor color asignado
minimize NumColors:
    max {v in V} Color[v];
