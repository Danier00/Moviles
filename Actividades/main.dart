import 'dart:io';
import 'dart:math';

void main() {
  int option;

  do {
    print(
      "Ingrese la opcion:\n"
      " 1.Actividad Nro.1\n"
      " 2.Actividad Nro.2\n"
      " 3.Actividad Nro.3\n"
      " 4.Actividad Nro.4\n"
      " 5.Actividad Nro.5\n"
      " 6.Actividad Nro.6\n"
      " 7.Salir",
    );

    option = int.parse(stdin.readLineSync()!);

    switch (option) {
      case 1:
        actividad1();
        break;
      case 2:
        actividad2();
        break;
      case 3:
        actividad3();
        break;
      case 4:
        actividad4();
        break;
      case 5:
        actividad5();
        break;
      case 6:
        actividad6();
        break;
      case 7:
        break;
      default:
        print('Opción inválida');
    }
  } while (option != 7);
}

void actividad1() {
  print("Ingrese el tiempo en Horas");
  double tiempo = double.parse(stdin.readLineSync()!);

  print("Ingrese la velocidad en Km/h");
  double velocidad = double.parse(stdin.readLineSync()!);

  double distancia = tiempo * velocidad;
  print("La distancia es $distancia Km");
}

void actividad2() {
  print("Ingresa la nota1");
  double nota1 = double.parse(stdin.readLineSync()!);

  print("Ingresa la nota2");
  double nota2 = double.parse(stdin.readLineSync()!);

  print("Ingresa la nota3");
  double nota3 = double.parse(stdin.readLineSync()!);

  double promedio = (nota1 + nota2 + nota3) / 3;
  print("Su promedio es $promedio");
}

void actividad3() {
  print("Ingresa los partidos ganados");
  int wins = int.parse(stdin.readLineSync()!);

  print("Ingresa los partidos perdidos");
  int lost = int.parse(stdin.readLineSync()!);

  print("Ingresa los partidos empatados");
  int ties = int.parse(stdin.readLineSync()!);

  int puntos = (wins * 3) + (ties * 1);
  print("Los partidos ganados son: $wins, los perdidos son: $lost y los empatados son: $ties puntos del equipo son $puntos");
}

void actividad4() {
  print("Ingresa el nombre del empleado");
  String name = stdin.readLineSync()!;

  print("Ingresa las horas trabajadas en el mes");
  int horas = int.parse(stdin.readLineSync()!);

  print("Ingresa la tarifa por hora");
  int tarifa = int.parse(stdin.readLineSync()!);

  int sueldo = horas * tarifa;
  print("El sueldo del empleado: $name es $sueldo");
}

void actividad5() {
  print("Ingresa un lado");
  int ladoa = int.parse(stdin.readLineSync()!);

  print("Ingresa otro lado");
  int ladob = int.parse(stdin.readLineSync()!);

  double h = sqrt(pow(ladoa, 2) + pow(ladob, 2));
  print("La Hipotenusa es $h");
}

void actividad6() {
  print("Ingresa la temperatura en celcius");
  int temp = int.parse(stdin.readLineSync()!);

  double farent = (temp * 1.8) + 32;
  print("$temp C en Fahrenthei es $farent");
}
