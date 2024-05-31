import 'package:app_dpii/components/DrawerApp.dart';
import 'package:app_dpii/components/EvaluadoresBody.dart';
import 'package:app_dpii/views-marisol.dart';
import 'package:flutter/material.dart';
import 'dart:js';
import 'dart:js_interop';
import 'package:flutter/foundation.dart';
//flutter pub add provider
import 'package:provider/provider.dart';
//Utils
import 'package:app_dpii/utils/images.dart' as images;
import 'package:app_dpii/views-johann.dart';
import 'package:app_dpii/views-marisol.dart';

import 'package:app_dpii/widgets/TextInputWidget.dart';
import 'package:app_dpii/widgets/TextAreaWidget.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

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
        title: 'DPII',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

          useMaterial3: true,
        ),
        initialRoute: '/login',
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
          },
          '/login':(context){
            return const ClassLoginView();
          },
          '/solicitantes': (context){
            return const Solicitantes();
          },
          '/listaEvaluadores': (context){
            return const ListEvaluadores();
          },
          '/detallesSolicitudes': (context){
            return const DetallesSolicitud();
          },

          '/evalucacion-administrativa': (context){
            return const AdminEvaluationScreen();
          },
          '/crear-evaluador': (context){
            return const CrearEvaluadorScreen();
          },
          '/evaluacion-administrativa-crear': (context){
            return const EvaluacionAdminCrearView();
          },
          '/evaluacion-administrativa-editar': (context){
            return const EvaluacionAdminEditarView();
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
  bool isChecked = false; // Declarar la variable de estado fuera del método build

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff173D6E),
        title: Text("Asignar Evaluador"),
        foregroundColor: Colors.white,
      ),
      drawer: DrawerApp(),
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
              padding: const EdgeInsets.all(8.0), // Espaciado interno opcional
              margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // Color del borde
                  width: 1.0, // Ancho del borde
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center, // Alineación opcional
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Instituto tecnologico de cerro azul",
                    textAlign: TextAlign.center,
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
              padding: const EdgeInsets.all(8.0), // Espaciado interno opcional
              margin: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
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
                      // fontWeight: FontWeight.w700,
                    ),
                  ),
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Solicitantes extends StatefulWidget {
  const Solicitantes({super.key});

  @override
  State<Solicitantes> createState() => _SolicitantesState();
}

class _SolicitantesState extends State<Solicitantes> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final String? token = ModalRoute.of(context)!.settings.arguments as String?;
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
      body: FutureBuilder<List<Solicitante>>(
        future: SolicitantesController().fetchSolicitantes(token!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            // Si tenemos datos, los mostramos en una lista
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                // Aquí accedemos a los datos del solicitante
                Solicitante solicitante = snapshot.data![index];
                return ListTile(
                  title: Text(solicitante.username), // Muestra el nombre de usuario del solicitante
                  subtitle: Text(solicitante.email), // Muestra el correo electrónico del solicitante
                );
              },
            );
          } else {
            // Si no hay datos, mostramos un mensaje
            return Text('No hay datos disponibles');
          }
        },
      ),


    );
  }
}


class ListEvaluadores extends StatefulWidget {
  const ListEvaluadores({super.key});

  @override
  State<ListEvaluadores> createState() => _ListEvaluadoresS();
}

class _ListEvaluadoresS extends State<ListEvaluadores> {
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10),
              ),
              const Text(
                'Evaluador DPII',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: ElevatedButton(
                    onPressed: () {
                      //appState.changePageAevaluador(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      backgroundColor: Colors.blue, // Cambia el color de fondo del botón
                    ),
                    child: const Text(
                      "Crear Evaluador DPII",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                        //fontWeight: FontWeight.bold,
                      ),
                    )
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
              ),
              ComponenteUba2(texto: "Francis Amaya"),
              ComponenteUba2(texto: "Julio Gonzalez"),
              ComponenteUba2(texto: "Edgar Trejo"),
              ComponenteUba2(texto: "Julio Abril"),
              ComponenteUba2(texto: "Armando Reyes"),
              ComponenteUba2(texto: "Jose Ramirez")
            ],
          ),
        ),
      )
    );
  }
}

class DetallesSolicitud extends StatefulWidget {
  const DetallesSolicitud({super.key});

  @override
  State<DetallesSolicitud> createState() => _DetallesSolicitud();
}

class _DetallesSolicitud extends State<DetallesSolicitud> {
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10),
              ),
              const Text(
                'Información',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
              ),

              Container(
                margin: const EdgeInsets.all(10),
              ),
              ComponenteUba1(negritas: "Programa", texto: "Maestría en Administración"),
              ComponenteUba1(negritas: "Institución", texto: "Instituto Tecnológico de Morelia"),
              ComponenteUba1(negritas: "Orientación", texto: "Profesional"),
              ComponenteUba1(negritas: "Periodicidad", texto: "Semestral"),
              ComponenteUba1(negritas: "Modalidad", texto: "Escolarizada"),
              ComponenteUba1(negritas: "Sede", texto: "Unisede"),
              ComponenteUba1(negritas: "LGAC 1", texto: "------"),
              ComponenteUba1(negritas: "LGAC 2", texto: "------"),
              ComponenteUba1(negritas: "LGAC 3", texto: "------"),
              ComponenteUba1(negritas: "LGAC 4", texto: "------"),
              ComponenteUba1(negritas: "Fecha de solicitud", texto: "14-04-2024"),
              ComponenteUba1(negritas: "Estado", texto: "Pendiente de enviar"),

              Container(
                margin: const EdgeInsets.all(5),
              ),

              Container(
                margin: const EdgeInsets.all(10),
              ), Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                    onPressed: () {
                      //appState.changePageAevaluador(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      backgroundColor: Color.fromRGBO(176, 176, 176, 1), // Cambia el color de fondo del botón
                    ),
                    child: const Text(
                      "Regresar",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        //fontWeight: FontWeight.bold,
                      ),
                    )
                ),
              ),


            ],
          ),
        ),
      )
    );
  }
}
//Componente tabla de 2 textos, uno en negritas y el otro no (detalles Solicitud)
class ComponenteUba1 extends StatelessWidget {
  final String negritas;
  final String texto;
  const ComponenteUba1({
    Key? key,
    required this.negritas,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: negritas +": ", // Texto en negritas
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black, // Color del texto
              fontSize: 18, // Tamaño de la fuente
            ),
          ),
          TextSpan(
            text: texto, // Texto normal
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black, // Color del texto
              fontSize: 18, // Tamaño de la fuente
            ),
          ),
        ],
      ),
    )
    ],
    ),
    );
  }
}
//Componente tabla con texto y 2 botones, amarillo (editar) y rojo (borrar)
class ComponenteUba2 extends StatelessWidget {
  final String texto;
  const ComponenteUba2({
    Key? key,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
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
                      texto
                    ),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alineación opcional
                       children: <Widget>[
                    SizedBox(
                      width: 35,
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {
                          //appState.changePageAevaluador(context);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero, // Elimina el relleno interno del botón
                          backgroundColor: Color.fromRGBO(255, 193, 7, 1), // Cambia el color de fondo del botón
                          shape:
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7), // Esquinas no redondeadas
                            ),

                        ),
                        child: const Icon(
                          Icons.edit_outlined, // Ícono de la librería de Flutter
                          color: Colors.white, // Color del ícono
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15
                    ),
                    SizedBox(
                      height: 35,
                      width: 35,

                    child: ElevatedButton(
                      onPressed: () {
                        //appState.changePageAevaluador(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero, // Elimina el relleno interno del botón
                        backgroundColor: Color.fromRGBO(220, 53, 69, 1), // Cambia el color de fondo del botón
                        shape:
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7), // Esquinas no redondeadas
                          ),
                      ),
                      child: const Icon(
                        Icons.delete_outline, // Ícono de la librería de Flutter
                        color: Colors.white, // Color del ícono
                      ),
                    ),
                    ),


                       ],
                    ),
                  ],
                ),
              )

    ;
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
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff173D6E),
        foregroundColor: Colors.white,
        title: Text("Archivos Solicitud"),
      ),
      drawer: DrawerApp(appState: appState,),
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
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                    onPressed: () {
                      //appState.changePageAevaluador(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
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
                        backgroundColor: Colors.lightGreen, // Cambia el color de fondo del botón
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        )
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
                        backgroundColor: Colors.lightGreen, // Cambia el color de fondo del botón
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          )
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
                        backgroundColor: Colors.lightGreen, // Cambia el color de fondo del botón
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          )
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
                        backgroundColor: Colors.lightGreen, // Cambia el color de fondo del botón
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          )
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
                'Medios de verificación',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Container(
                margin: const EdgeInsets.all(5),
              ),

              Container(
                height: MediaQuery.of(context).size.height*0.2,
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
                    Container(
                      width: MediaQuery.of(context).size.width*0.6,
                        child: Text("Sistema Interno para el fortalecimiento de los Posgrados (SIFOR) ",maxLines: 2,)),
                    ElevatedButton(
                      onPressed: () {
                        //appState.changePageAevaluador(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen, // Cambia el color de fondo del botón
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          )
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
                        backgroundColor: Colors.lightGreen, // Cambia el color de fondo del botón
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          )
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
                        backgroundColor: Colors.lightGreen, // Cambia el color de fondo del botón
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          )
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


class EvaluacionAdminCrearView extends StatefulWidget {
  const EvaluacionAdminCrearView({super.key});

  @override
  State<EvaluacionAdminCrearView> createState() => _EvaluacionAdminCrearView();
}

class _EvaluacionAdminCrearView extends State<EvaluacionAdminCrearView> {
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10),
              ),
              const Text(
                'Crear evaluación administrativa',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Container(
                margin: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    TextInputWidget(
                      hintText: 'Titulo',
                      labelText: 'Titulo',
                    ),
                    TextAreaWidget(
                      hintText: 'Descripción',
                    ),
                    TextInputWidget(
                      hintText: 'Nomenclatura',
                      labelText: 'Ingrese la nomenclatura',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            //appState.changePageAevaluador(context);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            backgroundColor: Color.fromRGBO(176, 176, 176, 1), // Cambia el color de fondo del botón
                          ),
                          child: const Text(
                            "Cancelar",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white
                              //fontWeight: FontWeight.bold,
                            ),
                          )
                        ),
                        ElevatedButton(
                          onPressed: () {
                            //appState.changePageAevaluador(context);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            backgroundColor: Colors.blue, // Cambia el color de fondo del botón
                          ),
                          child: const Text(
                            "Agregar evaluación",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white
                              //fontWeight: FontWeight.bold,
                            ),
                          )
                        ),
                      ],
                    ),

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
class EvaluacionAdminEditarView extends StatefulWidget {
  const EvaluacionAdminEditarView({super.key});

  @override
  State<EvaluacionAdminEditarView> createState() => _EvaluacionAdminEditarView();
}

class _EvaluacionAdminEditarView extends State<EvaluacionAdminEditarView> {
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10),
              ),
              const Text(
                'Editar evaluación administrativa',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Container(
                margin: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    TextInputWidget(
                      hintText: 'Titulo',
                      labelText: 'Titulo',
                    ),
                    TextAreaWidget(
                      hintText: 'Descripción',
                    ),
                    TextInputWidget(
                      hintText: 'Nomenclatura',
                      labelText: 'Ingrese la nomenclatura',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            //to do...
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            backgroundColor: Color.fromRGBO(176, 176, 176, 1), // Cambia el color de fondo del botón
                          ),
                          child: const Text(
                            "Cancelar",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white
                              //fontWeight: FontWeight.bold,
                            ),
                          )
                        ),
                        ElevatedButton(
                          onPressed: () {
                            //to do...
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            backgroundColor: Colors.blue, // Cambia el color de fondo del botón
                          ),
                          child: const Text(
                            "Guardar",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white
                              //fontWeight: FontWeight.bold,
                            ),
                          )
                        ),
                      ],
                    ),

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

  void changePageArchivosSolicitud(BuildContext context){
    Navigator.of(context).pushNamed('/archivos-solicitud');
  }void changePageHome(BuildContext context){
    Navigator.of(context).pushNamed('/home');
  }void changePageSolicitudes(BuildContext context, String? token) {
    Navigator.of(context).pushNamed(
      '/solicitantes',
      arguments: token,
    );
  }

}


class SolicitantesController {
  Future<List<Solicitante>> fetchSolicitantes(String token) async {
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/solicitanteMaestro/'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      // Parseamos el cuerpo de la respuesta
      final Map<String, dynamic> parsed = jsonDecode(response.body);
      // Extraemos la lista de resultados
      final List<dynamic> results = parsed['results'];
      // Convertimos cada elemento a un objeto de tipo Solicitante
      List<Solicitante> solicitantes = results.map((json) => Solicitante.fromJson(json)).toList();
      return solicitantes;
    } else {
      throw Exception('Failed to load solicitantes');
    }
  }
}

// Definimos una clase para manejar los datos de cada solicitante
class Solicitante {
  final int id;
  final String username;
  final String email;
  final List<String> groups;
  final List<UserInstitution> userInstitutions;

  Solicitante({
    required this.id,
    required this.username,
    required this.email,
    required this.groups,
    required this.userInstitutions,
  });

  factory Solicitante.fromJson(Map<String, dynamic> json) {
    var groupList = List<String>.from(json['groups']);
    var userInstitutionsList = List<Map<String, dynamic>>.from(json['user_institutions'])
        .map((json) => UserInstitution.fromJson(json))
        .toList();
    return Solicitante(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      groups: groupList,
      userInstitutions: userInstitutionsList,
    );
  }
}

// Definimos una clase para manejar los datos de las instituciones de los usuarios
class UserInstitution {
  final int id;
  final int user;
  final String username;
  final String institutionName;
  final int institution;

  UserInstitution({
    required this.id,
    required this.user,
    required this.username,
    required this.institutionName,
    required this.institution,
  });

  factory UserInstitution.fromJson(Map<String, dynamic> json) {
    return UserInstitution(
      id: json['id'],
      user: json['user'],
      username: json['username'],
      institutionName: json['institution_name'],
      institution: json['institution'],
    );
  }
}

