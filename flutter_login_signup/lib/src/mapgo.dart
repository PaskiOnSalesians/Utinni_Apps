import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapgo extends StatefulWidget {
  @override
  _MapgoState creatState() => _MapgoState();

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}

class _MapgoState extends State<Mapgo> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(0, 0), zoom: 12),
    );
  }
}
