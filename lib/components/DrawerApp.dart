import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//Utils
import 'package:app_dpii/utils/images.dart' as images;

import '../main.dart';
class DrawerApp extends StatelessWidget{
  late MyAppState? appState;

  DrawerApp({this.appState});

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                images.appLogo,
                height: 135,
              ),
            ],
          ),
            decoration: const BoxDecoration(color:Color(0xff173D6E)),
          ),
          ListTile(
            title: Text("Inicio"),
            trailing: Icon(Icons.home),
            onTap: () {
              if (appState != null) {
                appState!.changePageHome(context);
              }
            },
          ),
          ListTile(
            title: Text("Solicitud de Apertura"),
            trailing: Icon(Icons.file_open_outlined),
            //onTap: ,
          ),
          ListTile(
            title: Text("Solicitudes Realizadas"),
            trailing: Icon(Icons.file_download_done_sharp),
            //onTap: ,
          ),
          ListTile(
            title: Text("Usuarios Solicitantes"),
            trailing: Icon(Icons.person_add_alt_1),
            //onTap: ,
          ),
          ListTile(
            title: Text("Cerrar Sesión"),
            trailing: Icon(Icons.logout),
            //onTap: ,
          ),
        ],
      ),
    );
  }
}