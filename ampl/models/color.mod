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

# Los extremos de cada arista deben tener colores diferentes
s.t. AdjacentDiff{(i,j) in E}:
    alldiff (Color[i], Color[j]);

# Contar cuantos colores aparecen en la asignacion
minimize NumColors:
    count {c in C}
        (numberof c in ({v in V} Color[v]) > 0);
