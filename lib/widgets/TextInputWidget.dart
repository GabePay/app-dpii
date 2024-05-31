import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final Icon? icon;
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final bool obscureText;

  TextInputWidget({
    this.icon,
    this.hintText,
    this.labelText,
    this.controller,
    this.obscureText = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                labelText!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          TextField(
            obscureText: obscureText,
            controller: controller ,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: hintText ?? "Ingresar Texto",
              suffixIcon: icon,
            
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff173D6E), width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}