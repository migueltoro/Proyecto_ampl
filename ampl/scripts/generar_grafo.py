import argparse
import random
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(
        description="Genera un grafo aleatorio no dirigido en formato .dat de AMPL."
    )
    parser.add_argument(
        "-n",
        "--vertices",
        type=int,
        required=True,
        help="Numero de vertices del grafo.",
    )
    parser.add_argument(
        "-p",
        "--probabilidad",
        type=float,
        default=0.3,
        help="Probabilidad de incluir cada arista (por defecto: 0.3).",
    )
    parser.add_argument(
        "--semilla",
        type=int,
        help="Semilla opcional para reproducir el mismo grafo.",
    )
    parser.add_argument(
        "-o",
        "--salida",
        type=Path,
        default=Path(__file__).resolve().parent.parent / "data" / "color.dat",
        help="Ruta del .dat de salida (por defecto: ampl/data/color.dat).",
    )
    args = parser.parse_args()

    if args.vertices < 1:
        parser.error("--vertices debe ser un entero mayor que cero.")
    if not 0 <= args.probabilidad <= 1:
        parser.error("--probabilidad debe estar entre 0 y 1.")

    rng = random.Random(args.semilla)
    aristas = [
        (i, j)
        for i in range(1, args.vertices + 1)
        for j in range(i + 1, args.vertices + 1)
        if rng.random() < args.probabilidad
    ]

    args.salida.parent.mkdir(parents=True, exist_ok=True)
    with args.salida.open("w", encoding="utf-8", newline="\n") as archivo:
        archivo.write(f"param n := {args.vertices};\n\n")
        archivo.write("set E :=\n")
        for i, j in aristas:
            archivo.write(f"    ({i},{j})\n")
        archivo.write(";\n")

    print(f"Grafo generado: {args.vertices} vertices, {len(aristas)} aristas.")
    print(f"Archivo AMPL: {args.salida.resolve()}")


if __name__ == "__main__":
    main()
