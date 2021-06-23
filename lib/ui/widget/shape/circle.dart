import 'package:flutter/material.dart';
import 'package:myriad_bus_scheduler/util/styles/colors.dart';

class Circle extends StatelessWidget {
  const Circle({Key key, this.size = 10, this.color}) : super(key: key);

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color ?? colorBlueGrey,
        shape: BoxShape.circle,
      ),
    );
  }
}
