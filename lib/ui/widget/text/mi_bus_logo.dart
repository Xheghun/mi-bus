import 'package:flutter/material.dart';
import 'package:myriad_bus_scheduler/util/styles/style.dart';

class MiBusLogo extends StatelessWidget {
  const MiBusLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Text(
            "Mi",
            style: miStyle,
          ),
          Text(
            "Bus",
            style: textBold,
          ),
        ],
      ),
    );
  }
}
