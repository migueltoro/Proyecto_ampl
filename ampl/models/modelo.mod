# Declaración de variables y parámetros
var x >= 0;
var y >= 0;

# Función Objetivo
maximize Ganancia: 3*x + 5*y;

# Restricciones
subject to HorasDisponibles: 2*x + 4*y <= 40;
subject to LimiteMateriaPrima: x + y <= 12;