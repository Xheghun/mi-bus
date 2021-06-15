import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myriad_bus_scheduler/app/routes.dart';
import 'package:myriad_bus_scheduler/ui/widget/text/mi_bus_logo.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key key}) : super(key: key);

  final Future<FirebaseApp> _firebaseFuture = Firebase.initializeApp();



  Widget build(BuildContext context) {

    var splash = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MiBusLogo(showShimmer: true,),
          Lottie.asset("assets/raw/bus-motion.json",
              repeat: true,
              width: double.infinity, height: 200),
        ],
      ),
    );


    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: FutureBuilder(
          future: _firebaseFuture,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              return LoginPage();
            }

            if(snapshot.hasError) {
              return splash;
            }

           return splash;
          },
        )
    );
  }
}
