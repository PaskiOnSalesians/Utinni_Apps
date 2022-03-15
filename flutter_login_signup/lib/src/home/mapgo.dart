import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';

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
        //mapType: MapType.terrain,

        myLocationButtonEnabled: true,
        myLocationEnabled: true,
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
        // icon: ,
        infoWindow: InfoWindow(
            title: "Colegio Hogwarts de Magia y Hechicería",
            snippet:
                "Hogwarts es una escuela a la cual asisten jóvenes magos para desarrollar sus habilidades mágicas. El edificio, situado en las colinas de Escocia, es visto como un antiguo edificio en ruinas con un cartel que dice 'cuidado, ruinas peligrosas', por las personas ajenas a poderes mágicos (más comúnmente conocidos como muggles). Tiene siete plantas, varias torres, escaleras que cambian de posición a su antojo y extensos terrenos que contienen un lago, un bosque, llamado El Bosque Prohibido, y varios invernaderos con fines botánicos.")));
    tmp.add(Marker(
        markerId: MarkerId("estacio"),
        position: widget.Estacio,
        infoWindow: InfoWindow(title: "Estació how")));
    return tmp;
  }
}

class Casa {}
