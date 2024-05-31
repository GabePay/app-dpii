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

/// Login Page ///

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
                SizedBox(height: 10), // Espacio entre los textos
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
