import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class CardWithButton extends StatelessWidget{

  //late final MyAppState appState;
  final Function(BuildContext) onPageChange;
  final Color buttonColor;
  final String name;

  CardWithButton({
   // required this.appState,
    required this.buttonColor,
    required this.name,
    required this.onPageChange
  });


  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity, // Hace que el Container ocupe todo el ancho de la pantalla
      padding: const EdgeInsets.all(10.0), // Spacious intern optional
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, // Color del borde
          width: 1.0, // Ancho del borde
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alineación opcional
        children: <Widget>[
          Text(name),
          Container(
            width: 40,
            height: 40,
            transformAlignment: Alignment.center,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(buttonColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                padding: MaterialStateProperty.all(EdgeInsets.zero), // Quitar padding
              ),
              onPressed: () {
                //appState.changePageAevaluador(context);
                onPageChange(context);
              },
              child: const Icon(
                Icons.info_outline, // Ícono de la librería de Flutter
                color: Colors.white,
                size: 25,
                // Color del ícono
              ),
            ),
          )
        ],
      ),
    );
  }
}