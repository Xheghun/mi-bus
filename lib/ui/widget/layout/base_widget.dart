import 'package:flutter/material.dart';

class BaseWidget extends StatelessWidget {
  const BaseWidget({Key key, this.body, this.resizeToAvoidBottomInsets = false}) : super(key: key);

  final bool resizeToAvoidBottomInsets;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInsets,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: body,
        ),
      ),
    );
  }
}
