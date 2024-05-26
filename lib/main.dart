import 'package:app_dpii/components/DrawerApp.dart';
import 'package:app_dpii/components/EvaluadoresBody.dart';
import 'package:flutter/material.dart';
import 'dart:js';
import 'dart:js_interop';
import 'package:flutter/foundation.dart';
//flutter pub add provider
import 'package:provider/provider.dart';
//Utils
import 'package:app_dpii/utils/images.dart' as images;
Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: '| Practica 1 |',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

          useMaterial3: true,
        ),
        initialRoute: '/ver-evaluadores',
        routes: {
          '/home': (context) {
            return const MyHomePage(title: 'Vemos',);
          },
          '/prueba': (context) {
            return const Prueba();
          },
          '/ver-evaluadores': (context) {
            return const VerEvaluadores();
          },
          '/asignar-evaluador': (context){
            return const AsignacionEvaluador();
          },
          '/archivos-solicitud': (context){
            return const ArchivosSolicitud();
          }
        },
        debugShowCheckedModeBanner: false,
      ),
    );

  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Prueba extends StatefulWidget {
  const Prueba({super.key});

  @override
  State<Prueba> createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("This is a prueba madafakersssssss"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Esto se acaba el vierneeeeesss',
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class VerEvaluadores extends StatefulWidget {
  const VerEvaluadores({super.key});

  @override
  State<VerEvaluadores> createState() => _VerEvaluadoresState();
}

class _VerEvaluadoresState extends State<VerEvaluadores> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff173D6E),
        elevation: 10,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    images.appLogo,
                    height: 500,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      drawer: DrawerApp(appState: appState,),
      body: EvaluadoresBody(appState: appState,)
    );
  }
}

class AsignacionEvaluador extends StatefulWidget {
  const AsignacionEvaluador({super.key});

  @override
  State<AsignacionEvaluador> createState() => _AsignacionEvaluadorState();
}

class _AsignacionEvaluadorState extends State<AsignacionEvaluador> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false; // Variable para rastrear si la casilla de verificación está marcada

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Asignar Evaluador"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'netoE',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: double.infinity, // Hace que el Container ocupe todo el ancho de la pantalla
              padding: const EdgeInsets.all(8.0), // Spacious intern optional
              margin: const EdgeInsets.fromLTRB(10.0,10.0,10.0,0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // Color del borde
                  width: 1.0, // Ancho del borde
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alineación opcional
                children: <Widget>[
                  Text(
                      "Instituto tecnologico de cerro azul",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                  ),

                ],
              ),
            ),
            Container(
              width: double.infinity, // Hace que el Container ocupe todo el ancho de la pantalla
              padding: const EdgeInsets.all(8.0), // Spacious intern optional
              margin: const EdgeInsets.fromLTRB(10.0,0, 10.0,0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // Color del borde
                  width: 1.0, // Ancho del borde
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alineación opcional
                children: <Widget>[
                  const Text(
                    "Instituto tecnologico de cerro azul",
                    style: TextStyle(
                      fontSize: 14,
                      //fontWeight: FontWeight.w700,
                    ),
                  ),
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = !isChecked; // Actualiza el estado del Checkbox
                      });
                    },
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ArchivosSolicitud extends StatefulWidget {
  const ArchivosSolicitud({super.key});

  @override
  State<ArchivosSolicitud> createState() => _ArchivosSolicitudState();
}

class _ArchivosSolicitudState extends State<ArchivosSolicitud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Archivos Solicitu"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10),
              ),
              const Text(
                'Archivos',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
              ),
              ElevatedButton(
                  onPressed: () {
                    //appState.changePageAevaluador(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Cambia el color de fondo del botón
                  ),
                  child: const Text(
                    "Descargar todos los archivos",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                      //fontWeight: FontWeight.bold,
                    ),
                  )
              ),
              Container(
                margin: const EdgeInsets.all(10),
              ),
              Container(
                width: double.infinity, // Hace que el Container ocupe todo el ancho de la pantalla
                padding: const EdgeInsets.all(10.0), // Spacious intern optional
                margin: const EdgeInsets.fromLTRB(10.0, 0, 10,0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Color del borde
                    width: 1.0, // Ancho del borde
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alineación opcional
                  children: <Widget>[
                    Text("Oficio de solicitud"),
                    ElevatedButton(
                      onPressed: () {
                        //appState.changePageAevaluador(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey, // Cambia el color de fondo del botón
                      ),
                      child: const Icon(
                        Icons.download, // Ícono de la librería de Flutter
                        color: Colors.white, // Color del ícono
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity, // Hace que el Container ocupe todo el ancho de la pantalla
                padding: const EdgeInsets.all(10.0), // Spacious intern optional
                margin: const EdgeInsets.fromLTRB(10.0, 0, 10,0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Color del borde
                    width: 1.0, // Ancho del borde
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alineación opcional
                  children: <Widget>[
                    Text("Oficio de compromiso institucional"),
                    ElevatedButton(
                      onPressed: () {
                        //appState.changePageAevaluador(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey, // Cambia el color de fondo del botón
                      ),
                      child: const Icon(
                        Icons.download, // Ícono de la librería de Flutter
                        color: Colors.white, // Color del ícono
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity, // Hace que el Container ocupe todo el ancho de la pantalla
                padding: const EdgeInsets.all(10.0), // Spacious intern optional
                margin: const EdgeInsets.fromLTRB(10.0, 0, 10,0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Color del borde
                    width: 1.0, // Ancho del borde
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alineación opcional
                  children: <Widget>[
                    Text("Aval"),
                    ElevatedButton(
                      onPressed: () {
                        //appState.changePageAevaluador(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey, // Cambia el color de fondo del botón
                      ),
                      child: const Icon(
                        Icons.download, // Ícono de la librería de Flutter
                        color: Colors.white, // Color del ícono
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity, // Hace que el Container ocupe todo el ancho de la pantalla
                padding: const EdgeInsets.all(10.0), // Spacious intern optional
                margin: const EdgeInsets.fromLTRB(10.0, 0, 10,0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Color del borde
                    width: 1.0, // Ancho del borde
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alineación opcional
                  children: <Widget>[
                    Text(
                        "Archivo complementario (COEPES)"),
                    ElevatedButton(
                      onPressed: () {
                        //appState.changePageAevaluador(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey, // Cambia el color de fondo del botón
                      ),
                      child: const Icon(
                        Icons.download, // Ícono de la librería de Flutter
                        color: Colors.white, // Color del ícono
                      ),
                    )
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.all(20),
              ),
              const Text(
                'Medios de verificaci[on',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Container(
                margin: const EdgeInsets.all(5),
              ),

              Container(
                width: double.infinity, // Hace que el Container ocupe todo el ancho de la pantalla
                padding: const EdgeInsets.all(10.0), // Spacious intern optional
                margin: const EdgeInsets.fromLTRB(10.0, 0, 10,0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Color del borde
                    width: 1.0, // Ancho del borde
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alineación opcional
                  children: <Widget>[
                    Text("Sistema Interno para el fortalecimiento de los Posgrados (SIFOR) "),
                    ElevatedButton(
                      onPressed: () {
                        //appState.changePageAevaluador(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey, // Cambia el color de fondo del botón
                      ),
                      child: const Icon(
                        Icons.download, // Ícono de la librería de Flutter
                        color: Colors.white, // Color del ícono
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity, // Hace que el Container ocupe todo el ancho de la pantalla
                padding: const EdgeInsets.all(10.0), // Spacious intern optional
                margin: const EdgeInsets.fromLTRB(10.0, 0, 10,0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Color del borde
                    width: 1.0, // Ancho del borde
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alineación opcional
                  children: <Widget>[
                    Text("Documentos de plan de estudio en extenso"),
                    ElevatedButton(
                      onPressed: () {
                        //appState.changePageAevaluador(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey, // Cambia el color de fondo del botón
                      ),
                      child: const Icon(
                        Icons.download, // Ícono de la librería de Flutter
                        color: Colors.white, // Color del ícono
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity, // Hace que el Container ocupe todo el ancho de la pantalla
                padding: const EdgeInsets.all(10.0), // Spacious intern optional
                margin: const EdgeInsets.fromLTRB(10.0, 0, 10,0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Color del borde
                    width: 1.0, // Ancho del borde
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alineación opcional
                  children: <Widget>[
                    Text("Estado del arte"),
                    ElevatedButton(
                      onPressed: () {
                        //appState.changePageAevaluador(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey, // Cambia el color de fondo del botón
                      ),
                      child: const Icon(
                        Icons.download, // Ícono de la librería de Flutter
                        color: Colors.white, // Color del ícono
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}










class MyAppState extends ChangeNotifier {

  void changePageAevaluador(BuildContext context) {
    Navigator.of(context).pushNamed('/asignar-evaluador');
  }

}