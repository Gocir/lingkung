import 'package:flutter/material.dart';
import 'package:lingkung/utilities/colorStyle.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final FontStyle style;
  final TextAlign align;

  //name constructor that has a positional parameters with the text required and the other parameters optional
  CustomText({@required this.text, this.size, this.color, this.style, this.align, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: color ?? black,
        fontFamily: "Poppins",
        fontSize: size ?? 14,
        fontStyle: style ?? FontStyle.normal,
        fontWeight: weight ?? FontWeight.normal),
    );
  }
}
