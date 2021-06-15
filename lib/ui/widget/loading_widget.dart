import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myriad_bus_scheduler/util/styles/style.dart';

class Loading extends StatelessWidget {
  const Loading({Key key, this.message = "Lorem Ipsum"}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withOpacity(0.2),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2.5,
          sigmaY: 2.5,
        ),
        child: Center(
          child: Container(
            width: 140,
            height: 140,
            child: ClipRRect(
              borderRadius: borderRadius12,
              child: Material(
                color: Colors.white,
                elevation: 8,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Lottie.asset("assets/raw/bus-motion.json",
                          width: 100, height: 100),
                    ),
                    Text(
                      message,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
