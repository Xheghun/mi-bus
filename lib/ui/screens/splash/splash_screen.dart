import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myriad_bus_scheduler/app/routes.dart';
import 'package:myriad_bus_scheduler/app/viewmodel/base_viewmodel.dart';
import 'package:myriad_bus_scheduler/ui/screens/home/home_screen.dart';
import 'package:myriad_bus_scheduler/ui/widget/text/mi_bus_logo.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key key}) : super(key: key);

  final Future<FirebaseApp> _firebaseFuture = Firebase.initializeApp();

  Widget build(BuildContext context) {
    Future<bool> hasUser() async =>
     await Provider.of<BaseViewModel>(context).hasUser();

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
              return FutureBuilder(
                future: hasUser(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.done) {
                    if(snapshot.data == true) {
                      return HomeScreen();
                    } else {
                      return LoginPage();
                    }
                  }
                  return splash;
                },
              );
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
