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
import 'package:app_dpii/main.dart';
import 'package:app_dpii/widgets/TextInputWidget.dart';
import 'package:app_dpii/widgets/CardWithButton.dart';

/// Login View ///

class ClassLoginView extends StatefulWidget {
  const ClassLoginView({Key? key}) : super(key: key);

  @override
  State<ClassLoginView> createState() => _ClassStateLoginView();
}

class _ClassStateLoginView extends State<ClassLoginView> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff173D6E),
        leading: Container(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              images.appLogo,
              height: 40,
              width: 400,
            ),
          ),
        ),
        centerTitle: true,
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
                TextInputWidget(
                  hintText: 'Ingrese su usuario',
                  icon: Icon(Icons.person),
                  labelText: 'Nombre del Usuario',
                ),
                SizedBox(height: 16),
                TextInputWidget(
                  hintText: 'Ingrese su contraseña',
                  icon: Icon(Icons.lock),
                  labelText: 'Contraseña',
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                      onPressed: (){
                          //
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        backgroundColor: Color(0xff173d6e),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 38.0,
                        child:Center(
                            child:Text(
                                'Entrar',
                                textAlign:TextAlign.center,
                                style:TextStyle(color: Colors.white)),
                          )
                        )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
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
        body:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
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
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Buscar por nombre',
                            border: OutlineInputBorder()
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
                              onChanged: (value){
                              },
                              hint: Text('Todos')
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              // Acción al presionar el botón
                            },
                            icon: Icon(Icons.file_copy, color: Colors.white,), // Icono de descarga
                            label: Text(''),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size.fromHeight(50),
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              shape: RoundedRectangleBorder(),
                              backgroundColor: Color(0xff198754),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ),
              ),
              SizedBox(height: 50.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
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
                                  Container(
                                    width: 40,
                                    height: 40,
                                    transformAlignment: Alignment.center,
                                    child:Column(
                                      children: [
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(buttonColor),
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15.0),
                                              ),
                                            ),
                                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                                          ),
                                          onPressed: () {
                                          },
                                          child: const Icon(
                                            Icons.info_outline,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),


                                      ],
                                    )
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ],
          )
        )
    );
  }
}