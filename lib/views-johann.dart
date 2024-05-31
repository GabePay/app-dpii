import 'package:app_dpii/components/DrawerApp.dart';
import 'package:app_dpii/components/EvaluadoresBody.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_dpii/utils/images.dart' as images;
import 'package:app_dpii/main.dart';
import 'package:app_dpii/widgets/TextInputWidget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// Login View ///

class ClassLoginView extends StatefulWidget {
  const ClassLoginView({Key? key}) : super(key: key);

  @override
  State<ClassLoginView> createState() => _ClassStateLoginView();
}

class _ClassStateLoginView extends State<ClassLoginView> {
  final LoginController _con = LoginController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff173D6E),
        elevation: 10,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    images.appLogo,
                    height: 200,
                    width: 200,
                    alignment: Alignment.center,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 600.0,
            ),
            width: double.infinity,
            color: Color(0xffdedede),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Bienvenido',
                  style: TextStyle(
                      color: Color(0xff545454)
                  ),
                ),
                SizedBox(height: 16),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextInputWidget(
                        controller: emailController,
                        hintText: 'Ingrese su usuario',
                        icon: Icon(Icons.person),
                        labelText: 'Nombre del Usuario',
                      ),
                      SizedBox(height: 16),
                      TextInputWidget(
                        obscureText: true,
                        controller: passwordController,
                        hintText: 'Ingrese su contraseña',
                        icon: Icon(Icons.lock),
                        labelText: 'Contraseña',
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ElevatedButton(
                          onPressed: () {
                            _con.authUser(emailController.text, passwordController.text).then((value) {
                              print(value.body);
                              Map<String, dynamic> responseBody = json.decode(value.body);
                              String accessToken = responseBody['access'];
                              print('Access Token: $accessToken');
                              if (accessToken != null) {
                                appState.changePageSolicitudes(context, accessToken);
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            backgroundColor: Color(0xff173d6e),
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            height: 38.0,
                            child: Center(
                              child: Text(
                                'Entrar',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginController {
  Future<http.Response> authUser(String user, String password) async {
    final response = await http.post(
      Uri.parse('http://localhost:8000/api/token/'),
      body: {
        'username': user,
        'password': password,
      },
    );

    return response;
  }
}

/// Solicitudes View ///

class ClassSolicitudesView extends StatefulWidget {
  const ClassSolicitudesView({super.key});

  @override
  State<ClassSolicitudesView> createState() => _ClassSolicitudesState();
}

class _ClassSolicitudesState extends State<ClassSolicitudesView> {
  List<String> solicitudes = [
    "Maestría en administración",
    "Doctorado en Ciencias y Tecnologia de alimentos Funcionaeles",
    "Doctorado en Economía Social y Solidaria."
  ];
  Color buttonColor = Color(0xff6C757D);
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50.0),
            Text(
              "Solicitudes",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Buscar por nombre',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 400.0,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              border: OutlineInputBorder(),
                            ),
                            items: [
                              DropdownMenuItem<String>(
                                value: 'Opción 1',
                                child: Text('Opción 1'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'Opción 2',
                                child: Text('Opción 2'),
                              ),
                            ],
                            onChanged: (value){},
                            hint: Text('Todos'),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Acción al presionar el botón
                          },
                          icon: Icon(Icons.file_copy, color: Colors.white,),
                          label: Text(''),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size.fromHeight(50),
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            shape: RoundedRectangleBorder(),
                            backgroundColor: Color(0xff198754),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: ListView.builder(
                  itemCount: solicitudes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(solicitudes[index]),
                          Row(
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {

                                },
                                child: const Icon(
                                  Icons.file_copy_sharp,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                              ),
                              SizedBox(width: 5),
                              ElevatedButton(
                                onPressed: () {

                                },
                                child: const Icon(
                                  Icons.info_outline,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                              ),
                              SizedBox(width: 5),
                              ElevatedButton(
                                onPressed: () {

                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Evaluadores View ///

class ClassEvaluadoresView extends StatefulWidget {
  const ClassEvaluadoresView({super.key});

  @override
  State<ClassEvaluadoresView> createState() => _ClassEvaluadoresState();
}

class _ClassEvaluadoresState extends State<ClassEvaluadoresView> {
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
      drawer: DrawerApp(appState: appState),
      body: EvaluadoresBody(appState: appState,),
    );
  }
}

/// Datos Personales View ///

class ClassDatosPersonalesView extends StatefulWidget {
  const ClassDatosPersonalesView({super.key});

  @override
  State<ClassDatosPersonalesView> createState() => _ClassDatosPersonalesState();
}

class _ClassDatosPersonalesState extends State<ClassDatosPersonalesView> {
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
      drawer: DrawerApp(appState: appState),
      body: Center(
        child: Text('Datos Personales'),
      ),
    );
  }
}

/// Cambiar Contraseña View ///

class ClassCambiarContrasenaView extends StatefulWidget {
  const ClassCambiarContrasenaView({super.key});

  @override
  State<ClassCambiarContrasenaView> createState() => _ClassCambiarContrasenaState();
}

class _ClassCambiarContrasenaState extends State<ClassCambiarContrasenaView> {
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
      drawer: DrawerApp(appState: appState),
      body: Center(
        child: Text('Cambiar Contraseña'),
      ),
    );
  }
}
