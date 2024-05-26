import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextAreaWidget extends StatelessWidget{
  final String? hintText;

  TextAreaWidget({this.hintText});

  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: TextField(
        maxLines: 10,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff173D6E), width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
          hintText: hintText != null ? hintText : "Ingrese su Texto"
        ),
      ),
    );
  }
}