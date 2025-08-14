import 'dart:io';

List<
  Map<
    String,
    dynamic
  >
>
libros = [];

void
main() {
  int option;

  do {
    print(
      "Ingrese la opcion:\n"
      " 1.Agregar libro\n"
      " 2.Listar libros\n"
      " 3.Actualizar libro\n"
      " 4.Eliminar libro\n"
      " 5.Salir\n",
    );

    option = int.parse(
      stdin.readLineSync()!,
    );

    switch (option) {
      case 1:
        AgregarLibro();
        break;
      case 2:
        Listarlibros();
        break;
      case 3:
        Actualizarlibro();
        break;
      case 4:
        Eliminarlibro();
        break;
      case 5:
        break;
      default:
        print(
          'Opción inválida',
        );
    }
  } while (option !=
      5);
}

void
AgregarLibro() {
  print(
    "Ingrese el titulo del libro",
  );
  String titulo = stdin.readLineSync()!;

  print(
    "Ingrese el autor del libro",
  );
  String autor = stdin.readLineSync()!;

  print(
    "Ingrese el año de publicación",
  );
  String anio = stdin.readLineSync()!;

  libros.add(
    {
      'Titulo': titulo,
      'Autor': autor,
      'Año': anio,
    },
  );
}

void
Listarlibros() {
  libros.asMap().forEach((i, libro) {
    print('Libro ${i}');
    libro.forEach((clave, valor) {
      print('  $clave: $valor');
    });
  });
}

void
Actualizarlibro() {
  Listarlibros();
print("Ingresa el numero del libro a editar");
  int index = int.parse(stdin.readLineSync()!);

print("Ingresa el nuevo titulo");
  String nuevotitulo=stdin.readLineSync()!;

print("Ingresa el nuevo autor");
  String nuevoautor=stdin.readLineSync()!;

print("Ingresa el nuevo año de publicacion");
  String nuevoanio=stdin.readLineSync()!;

libros[index]=( {
      'Titulo': nuevotitulo,
      'Autor': nuevoautor,
      'Año': nuevoanio,
    });
print(libros[index]);
}


void
Eliminarlibro() {
   Listarlibros();
print("Ingresa el numero del libro a eliminar");
  int index = int.parse(stdin.readLineSync()!);

  libros.removeAt(index);
  Listarlibros();
}
