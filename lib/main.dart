import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evaluación Administrativa',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: AdminEvaluationScreen(),
    );
  }
}

class AdminEvaluationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evaluación Administrativa'),
      ),
      body: AdminEvaluationBody(),
    );
  }
}

class AdminEvaluationBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              // Para crear evaluador DPII
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CrearEvaluadorScreen()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(13, 110, 253, 100),
              foregroundColor: Colors.white,
              minimumSize: Size(350, 38),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              ),
            ),
            child: Text('Crear Evaluación Administrativa'),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              buildListItem(
                  'Sistema Interno para el fortalecimiento de los posgrados'),
              buildListItem('Documento de plan de estudios'),
              buildListItem('Estado del arte'),
              buildListItem('CV de los profesores'),
              buildListItem(
                  'Constancias de pertenencia a colegios y organizaciones.'),
              buildListItem(
                  'Evidencia de los espacios para profesores, estudiantes y personas con discapacidad asignado al programa'),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildListItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        child: ListTile(
          title: Text(title),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit_outlined),
                color: Colors.white,
                onPressed: () {
                  // Para editar
                },
                style: IconButton.styleFrom(
                    backgroundColor: Color.fromRGBO(255, 193, 7, 100)),
              ),
              IconButton(
                icon: Icon(Icons.delete_outline),
                color: Colors.white,
                onPressed: () {
                  // Para eliminar
                },
                style: IconButton.styleFrom(
                  backgroundColor: Color.fromRGBO(220, 53, 69, 100),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CrearEvaluadorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear evaluador DPII'),
      ),
      body: CrearEvaluadorBody(),
    );
  }
}

class CrearEvaluadorBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Nombre del Usuario"),
            TextField(
              decoration: InputDecoration(
                hintText: "Usuario",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Text("Correo Electrónico"),
            TextField(
              decoration: InputDecoration(
                hintText: "Correo Electrónico",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Text("Contraseña"),
            TextField(
              decoration: InputDecoration(
                hintText: "Contraseña",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    //Para CANCELAR
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(108, 117, 125, 100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    minimumSize: Size(136,38),
                    foregroundColor: Colors.white,
                  ),

                  child: Text("Cancelar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    //Para GUARDAR
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    minimumSize: Size(136,38),
                    foregroundColor: Colors.white,
                  ),
                  child: Text("Guardar"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

/*  Widget buildListItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        child: ListTile(
          title: Text(title),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                color: Colors.yellow,
                onPressed: () {
                  // Para editar
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  // Para eliminar
                },
              ),
            ],
          ),
        ),
      ),
    );
  }*/
}