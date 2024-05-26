import 'package:app_dpii/components/ListEvaluadores.dart';
import 'package:app_dpii/widgets/CardWithButton.dart';
import 'package:app_dpii/widgets/TextInputWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../widgets/TextAreaWidget.dart';

class EvaluadoresBody extends StatelessWidget {
  late final MyAppState appState;
  List<String> evaluadores = ["Pepe", "Luis","Charlie"];
  Color buttonColor = Color(0xff6C757D);

  EvaluadoresBody({required this.appState});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Asignar Evaluadores',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextInputWidget(icon: Icon(Icons.face),hintText: "Texto de Ejemplo",),//Aqui se muestra el uso del Input
            TextAreaWidget(),
            Expanded(
              child: ListView.builder(
                itemCount: evaluadores.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardWithButton(
                    onPageChange: appState.changePageAevaluador,
                    buttonColor: buttonColor,
                    name: evaluadores[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
