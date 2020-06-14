import "package:flutter/material.dart";

class SectionLisTile extends StatelessWidget {
  final String imagePath;
  final String name;
  final IconData icon;

  SectionLisTile({this.imagePath, this.name, this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.asset(imagePath),
        title: Text("$name",
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 16.0,
                fontWeight: FontWeight.w700)),
        trailing: Icon(
          icon,
          color: const Color(0xff9bc53d),
        ));
  }
}
