import 'dart:io';
// import 'dart:math';

void
main() {
  // var i = 5;
  // var age = "35";
  // var bool = true;

  // double decimal = 10.5;
  // String name = "Joao Ortiz";

  // //Variables fijas
  // const pi = 3.14;
  // final String country = "USA";

  // print("El nombre es $name, tiene $age años, es de $country");

  // // Variables de tipo dynamic
  // dynamic Variable = "Hello";
  // Variable = 10;
  // print(Variable);

  // int a = 20;
  // int b = 5;
  // int sum = a + b;
  // print("la suma de $a y $b es $sum");
  // int rest = a-b;
  // int mult = a*b;
  // int divi = a~/b;
  // print(divi);

  // List<String> names = ["Joao", "Bob", "Charlie"];
  // names.add("David");
  // print(names);
  // names.remove("Bob");
  // print(names);
  // names.insert(1, "Eve");
  // print(names);
  //   print("----------------------------------");

  // //Map
  // Map<String, int> ages = {
  //   "Alice": 30,
  //   "Bob":25,
  //   "Charlie":25
  // };

  // ages["David"]= 28;
  // print(ages);
  // ages.remove("Alice");
  // print(ages);
  // ages["Charlie"] = 26;
  // print(ages);
  // print("----------------------------------");

  // //Sets
  // Set number = {1,20,3,40,5};
  // print(number);
  // number.add(6);
  // print(number);
  // number.add(0.1);
  // print(number);
  // number.remove(0.1);
  // print(number);
  // print("----------------------------------");

  // // Peticion de datos
  // print("Ingrese el nombre:");
  // String? nameUser = stdin.readLineSync();
  // print("Ingrese la edad:");
  // int? ageUser = int.tryParse(stdin.readLineSync() ?? "0");

  // print("El nombre es $nameUser y la edad $ageUser");
  // print("----------------------------------");

// print("Ingrese el costo de la prenda:");
// double? costo = double.tryParse(stdin.readLineSync() ?? "0");
// double precioTotal = (costo ?? 00)-((costo ?? 00)*0.15);
// print("El costo de la prenda con el 15% es:$precioTotal");

//   // Peticion de datos
//   print("Ingrese un numero:",);
//   int? valor1 = int.tryParse(stdin.readLineSync() ??"0",);
//   print("Ingrese otro numero:",);
//   int? valor2 = int.tryParse(stdin.readLineSync()!,);
//   int potencia = pow(valor1!,valor2!,).toInt();
//  print(potencia,);

 print("Digite un numero");
 int?num1=int.tryParse(stdin.readLineSync()??"0");
 print("Digite un numero");
 int?num2=int.parse(stdin.readLineSync()??"0");

 int sumar(int num1,int num2) {return num1+num2;}

  print(sumar(num1!,num2));
}
