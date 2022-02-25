import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapgo extends StatefulWidget {
  final LatLng Casa = LatLng(41.39473136159721, 2.1276748636311775);
  final LatLng Estacio = LatLng(41.39836145166467, 2.1258408980216323);

  @override
  _MapgoState createState() => _MapgoState();
}

class _MapgoState extends State<Mapgo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa districte Sarria'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(41.39473136159721, 2.1276748636311775),
          zoom: 19,
        ),
        markers: _createMarkers(),
      ),
    );
  }

  Set<Marker> _createMarkers() {
    var tmp = Set<Marker>();

    tmp.add(Marker(
        markerId: MarkerId("Casa"),
        position: widget.Casa,
        infoWindow: InfoWindow(title: "Casa Howdgawards")));
    tmp.add(Marker(
        markerId: MarkerId("estacio"),
        position: widget.Estacio,
        infoWindow: InfoWindow(title: "Estació how")));
    return tmp;
  }
}

class Casa {}
