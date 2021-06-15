import 'package:flutter/material.dart';
import 'package:myriad_bus_scheduler/util/styles/style.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class MiBusLogo extends StatelessWidget {
  const MiBusLogo({Key key, this.showShimmer = false}) : super(key: key);

  final bool showShimmer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Shimmer(
        color: Colors.white54,
        enabled: showShimmer,

        child: Row(
          mainAxisSize: MainAxisSize.min,
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
      ),
    );
  }
}
