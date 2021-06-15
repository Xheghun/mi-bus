
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:myriad_bus_scheduler/util/styles/colors.dart';
import 'package:myriad_bus_scheduler/util/styles/style.dart';

void showFlushBar(BuildContext context, {String title = "MiBus", String message = "lorem ipsum", Color backgroundColor}) {
  Flushbar(
    title: title,
    message: message,
    margin: EdgeInsets.all(12),
    duration: Duration(seconds: 2),
    flushbarPosition: FlushbarPosition.TOP,
    routeBlur: 2,
    borderRadius: borderRadius12,
    blockBackgroundInteraction: true,
    backgroundColor: backgroundColor ?? colorPrimary,
  ).show(context);
}