import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_login_signup/src/components/main_menu.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:geolocator/geolocator.dart';

import '../components/main_menu.dart';

class Mapgo extends StatefulWidget {
  final LatLng Casa = LatLng(41.39473136159721, 2.1276748636311775);
  final LatLng Estacio = LatLng(41.39836145166467, 2.1258408980216323);

  @override
  _MapgoState createState() => _MapgoState();
}

class _MapgoState extends State<Mapgo> {
  //pedir permisos de ubicacion
  Future<void> _checkPermission() async {
    final serviceStatus = await Permission.locationWhenInUse.serviceStatus;
    final isGpsOn = serviceStatus == ServiceStatus.enabled;

    if(!isGpsOn){
      print('Turn on location services before requesting permission');
      return;
    }

    final status = await Permission.locationWhenInUse.request();

    if(status == PermissionStatus.granted){
      print('Permission granted');
    } else if(status == PermissionStatus.denied){
      print('Permission denied. Show a dialog and ask for the permission again.');
    } else if(status == PermissionStatus.permanentlyDenied){
      print('To the user settings page');
      await openAppSettings();
    }
  }

  void initState(){
    _checkPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa districte Sarria'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.terrain,
            //onMapCreated: onMapCreated,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            mapToolbarEnabled:
                false, //Treu l'opcio de que si selecionem una marked ens dongui rutas
            initialCameraPosition: CameraPosition(
              target: LatLng(41.39473136159721, 2.1276748636311775),
              zoom: 19,
            ),
            markers: _createMarkers(),
            padding: EdgeInsets.fromLTRB(0,0,0,0),
          ),
          MainMenu(),
          
        ],
      )
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