import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myriad_bus_scheduler/ui/widget/google_map_widget.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/homeScreen";
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_list),
        onPressed: () {},
      ),
      body: SafeArea(
        child: Column(

        )
      ),
    );
  }
}
