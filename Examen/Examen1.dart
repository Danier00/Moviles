import 'dart:io';

bool
salir = false;
List<
  Map<
    String,
    dynamic
  >
>
Productos = [];

void
main() {
  String? option;

  while (!salir) {
    print(
      "Ingrese la opcion:\n"
      " 1.Agregar producto\n"
      " 2.Listar productos\n"
      " 3.Actualizar producto\n"
      " 4.Eliminar producto\n"
      " 5.Salir\n",
    );

    option = stdin.readLineSync()!;

    switch (option) {
      case '1':
        AgregarProducto();
        break;
      case '2':
        ListarProducto();
        break;
      case '3':
        ActualizarProducto();
        break;
      case '4':
        EliminarProducto();
        break;
      case '5':
        salir = true;
        break;
      default:
        print(
          'Opción inválida',
        );
    }
  }
}

void
AgregarProducto() {
  print(
    "Ingrese el nombre del producto",
  );
  String nombre = stdin.readLineSync()!;

  print(
    "Ingrese el precio del producto",
  );
  int precio = int.parse(
    stdin.readLineSync()!,
  );

  print(
    "Ingrese la cantidad del producto",
  );
  int cantidad = int.parse(
    stdin.readLineSync()!,
  );

  Productos.add(
    {
      'Nombre': nombre,
      'Precio': precio,
      'Cantidad disponible': cantidad,
    },
  );
}

void
ListarProducto() {
  Productos.asMap().forEach(
    (
      i,
      Producto,
    ) {
      print(
        'Producto ${i}',
      );
      Producto.forEach(
        (
          clave,
          valor,
        ) {
          print(
            '  $clave: $valor',
          );
        },
      );
    },
  );
}

void
ActualizarProducto() {
  String? option;
  do {
    print(
      "Que desea actualizar?:\n"
      " 1.todos los datos\n"
      " 2.Solo el nombre\n"
      " 3.Solo el precio \n"
      " 4.Solo la cantidad \n"
      " 5.Salir\n",
    );

    option = 
      stdin.readLineSync()!;

    switch (option) {
      case '1':
        ListarProducto();
        print(
          "Ingresa el numero del producto a editar",
        );
        int index = int.parse(
          stdin.readLineSync()!,
        );

        print(
          "Ingresa el nuevo nombre",
        );
        String nuevonombre = stdin.readLineSync()!;

        print(
          "Ingresa el nuevo precio",
        );
        int nuevoprecio = int.parse(
          stdin.readLineSync()!,
        );

        print(
          "Ingresa la nueva cantidad",
        );
        int nuevacantidad = int.parse(
          stdin.readLineSync()!,
        );

        Productos[index] = ({
          'Nombre': nuevonombre,
          'Precio': nuevoprecio,
          'Cantidad': nuevacantidad,
        });

        print(
          Productos[index],
        );
        break;
      case '2':
        ListarProducto();
        print(
          "Ingresa el numero del producto a editar",
        );
        int index = int.parse(
          stdin.readLineSync()!,
        );

        print(
          "Ingresa el nuevo nombre",
        );
        String nuevonombre = stdin.readLineSync()!;

        Productos[index]["Nombre"] = nuevonombre;

        print(
          Productos[index],
        );
        break;
      case '3':
        ListarProducto();
        print(
          "Ingresa el numero del producto a editar",
        );
        int index = int.parse(
          stdin.readLineSync()!,
        );

        print(
          "Ingresa el nuevo precio",
        );
        String nuevoprecio = stdin.readLineSync()!;

        Productos[index]["Precio"] = nuevoprecio;

        print(
          Productos[index],
        );
        break;
      case '4':
        ListarProducto();
        print(
          "Ingresa el numero del producto a editar",
        );
        int index = int.parse(
          stdin.readLineSync()!,
        );

        print(
          "Ingresa la  nueva cantidad",
        );
        String nuevacantidad = stdin.readLineSync()!;

        Productos[index]["Cantidad"] = nuevacantidad;

        print(
          Productos[index],
        );
        break;
      case '5':
        break;

      default:
        print(
          'Opción inválida',
        );
    }
  } while (option !=
      '5');
}

void
EliminarProducto() {
  ListarProducto();
  print(
    "Ingresa el numero del libro a eliminar",
  );
  int index = int.parse(
    stdin.readLineSync()!,
  );

  Productos.removeAt(
    index,
  );
  ListarProducto();
}
