import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TextInputWidget extends StatelessWidget{
  final Icon? icon;
  final String? hintText;
  TextInputWidget(
      {
        this.icon,
        this.hintText,
      }
      );
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText != null ? hintText : "Ingresar Texto",
          suffixIcon: icon != null ? icon : null,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff173D6E), width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            )
        ),
      ),
    );
  }
}