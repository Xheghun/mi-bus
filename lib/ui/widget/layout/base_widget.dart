import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({Key key, this.appBar, this.body, this.resizeToAvoidBottomInsets = false}) : super(key: key);

  final bool resizeToAvoidBottomInsets;
  final Widget body;
  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
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
