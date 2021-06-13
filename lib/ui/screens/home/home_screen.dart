import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/homeScreen";
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Completer<GoogleMapController> _controller = Completer();

    CameraPosition cameraPosition = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(37.43296265331129, -122.08832357078792),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: cameraPosition,
          onMapCreated: (controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
