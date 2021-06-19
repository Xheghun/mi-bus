import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatelessWidget {
   MapWidget({Key key}) : super(key: key);

  final Completer<GoogleMapController> _controller = Completer();

  final CameraPosition cameraPosition = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: cameraPosition,
      onMapCreated: (controller) {
        _controller.complete(controller);
      },
    );
  }
}