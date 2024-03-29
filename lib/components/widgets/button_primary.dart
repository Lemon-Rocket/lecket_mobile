import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonPrimary({@required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
          top: BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
          left: BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
          right: BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
        ),
      ),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,
        onPressed: onPressed,
        color: Color.fromRGBO(255, 209, 92, 1),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            fontFamily: "Poppins",
          ),
        ),
      ),
    );
  }
}
