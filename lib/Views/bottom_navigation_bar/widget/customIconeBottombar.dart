import 'package:flutter/material.dart';

class CustomIcone extends StatelessWidget {
  final Color color;
  final double size;
  final IconData icon;

  CustomIcone({this.color = Colors.orange, required this.icon, this.size = 25});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}
