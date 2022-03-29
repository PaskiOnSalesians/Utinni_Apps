import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/home/splash.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_login_signup/src/components/main_menu.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:location/location.dart' as lct;
// import 'package:geolocator/geolocator.dart';

import '../components/main_menu.dart';
import 'loginPage.dart';

const double PIN_VISIBLE_POSITION = 40;
const double PIN_INVISIBLE_POSITION = -220;

class Mapgo extends StatefulWidget {
  final LatLng Casa = LatLng(41.39473136159721, 2.1276748636311775);
  final LatLng Estacio = LatLng(41.39836145166467, 2.1258408980216323);
  final LatLng ParqueCole = LatLng(41.39349178411225, 2.1283920868367106);
  final LatLng BosqueSarria = LatLng(41.410614882087664, 2.1099410210945333);
  final LatLng CasasSarria =
      LatLng(41.39218700718102, 2.1273440510129933); //PicketPosttClose
  final LatLng JardinesSarria =
      LatLng(41.392445607953455, 2.122804447581041); //botanico
  final LatLng MercatSarria =
      LatLng(41.39394163426724, 2.1235249438108275); //mercado

  @override
  _MapgoState createState() => _MapgoState();
}

class _MapgoState extends State<Mapgo> {
  double pinPillPosition = PIN_VISIBLE_POSITION;
  double pinPillPosition2 = PIN_VISIBLE_POSITION;
  double pinPillPosition3 = PIN_VISIBLE_POSITION;
  double pinPillPosition4 = PIN_VISIBLE_POSITION;
  double pinPillPosition5 = PIN_VISIBLE_POSITION;
  double pinPillPosition6 = PIN_VISIBLE_POSITION;
  double pinPillPosition7 = PIN_VISIBLE_POSITION;

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
              onTap: (LatLng loc) {
                setState(() {
                  this.pinPillPosition = PIN_INVISIBLE_POSITION;
                  this.pinPillPosition2 = PIN_INVISIBLE_POSITION;
                  this.pinPillPosition3 = PIN_INVISIBLE_POSITION;
                  this.pinPillPosition4 = PIN_INVISIBLE_POSITION;
                  this.pinPillPosition5 = PIN_INVISIBLE_POSITION;
                  this.pinPillPosition6 = PIN_INVISIBLE_POSITION;
                  this.pinPillPosition7 = PIN_INVISIBLE_POSITION;
                });
              },
              markers: _createMarkers(),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            ),
            //Afegir lo de les markers?
            //BotoPosicioCasa(),
            BottonShowHouse(pinPillPosition: pinPillPosition),
            BottonShowTrain(pinPillPosition2: pinPillPosition2),
            BottonShowParque(pinPillPosition3: pinPillPosition3),
            BottonShowBosque(pinPillPosition4: pinPillPosition4),
            BottonShowCasas(pinPillPosition5: pinPillPosition5),
            BottonShowJardi(pinPillPosition6: pinPillPosition6),
            BottonShowMercat(pinPillPosition7: pinPillPosition7),
            MainMenu()
          ],
        ));
  }

  Set<Marker> _createMarkers() {
    var tmp = Set<Marker>();

    tmp.add(Marker(
        markerId: MarkerId("Casa"),
        position: widget.Casa,
        onTap: () {
          setState(() {
            this.pinPillPosition = PIN_VISIBLE_POSITION;
          });
        },
        // icon: ,
        infoWindow: InfoWindow(
            title: "Colegio Hogwarts de Magia y Hechicería", snippet: "")));
    tmp.add(Marker(
        markerId: MarkerId("estacio"),
        position: widget.Estacio,
        onTap: () {
          setState(() {
            this.pinPillPosition2 = PIN_VISIBLE_POSITION;
          });
        },
        infoWindow: InfoWindow(title: "Estació how")));

    tmp.add(Marker(
        markerId: MarkerId("Parque quidick"),
        position: widget.ParqueCole,
        onTap: () {
          setState(() {
            this.pinPillPosition3 = PIN_VISIBLE_POSITION;
          });
        },
        infoWindow: InfoWindow(title: "campo quidick")));
    tmp.add(Marker(
        markerId: MarkerId("Bosque"),
        position: widget.BosqueSarria,
        onTap: () {
          setState(() {
            this.pinPillPosition4 = PIN_VISIBLE_POSITION;
          });
        },
        infoWindow: InfoWindow(title: "BosqueSarria")));
    tmp.add(Marker(
        markerId: MarkerId("CasesHarry"),
        position: widget.CasasSarria,
        onTap: () {
          setState(() {
            this.pinPillPosition5 = PIN_VISIBLE_POSITION;
          });
        },
        infoWindow: InfoWindow(title: "vive aqui")));
    tmp.add(Marker(
        markerId: MarkerId("jardins"),
        position: widget.JardinesSarria,
        onTap: () {
          setState(() {
            this.pinPillPosition6 = PIN_VISIBLE_POSITION;
          });
        },
        infoWindow: InfoWindow(title: "jardins de botanoca")));
    tmp.add(Marker(
        markerId: MarkerId("mercado"),
        position: widget.MercatSarria,
        onTap: () {
          setState(() {
            this.pinPillPosition7 = PIN_VISIBLE_POSITION;
          });
        },
        infoWindow: InfoWindow(title: "mercat on comprar coses")));

    return tmp;
  }
}

class BottonShowHouse extends StatelessWidget {
  const BottonShowHouse({
    Key? key,
    required this.pinPillPosition,
  }) : super(key: key);

  final double pinPillPosition;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        left: 0,
        right: 0,
        top: this.pinPillPosition,
        // bottom: 20,
        child: InkWell(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset.zero)
                ]),
            child: Column(children: [
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'img/Castillo.jpg',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Text(
                          'Castillo de Hogwarts',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text('Joc'),
                        Text('Petita descripcio'),
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ));
  }
}

class BottonShowTrain extends StatelessWidget {
  const BottonShowTrain({
    Key? key,
    required this.pinPillPosition2,
  }) : super(key: key);

  final double pinPillPosition2;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        left: 0,
        right: 0,
        top: this.pinPillPosition2,
        // bottom: 20,
        child: InkWell(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset.zero)
                ]),
            child: Column(children: [
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'img/HogwartsExpress.png',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Text(
                          'Estacio Kings Cross',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text('Joc'),
                        Text('Mic mic'),
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Splash()),
            );
          },
        ));
  }
}

class BottonShowParque extends StatelessWidget {
  const BottonShowParque({
    Key? key,
    required this.pinPillPosition3,
  }) : super(key: key);

  final double pinPillPosition3;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        left: 0,
        right: 0,
        top: this.pinPillPosition3,
        // bottom: 20,
        child: InkWell(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset.zero)
                ]),
            child: Column(children: [
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'img/CampoQuidic.jpg',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Text(
                          'Campo de Quidditch',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text('Joc'),
                        Text('Mic mic'),
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Splash()),
            );
          },
        ));
  }
}

class BottonShowBosque extends StatelessWidget {
  const BottonShowBosque({
    Key? key,
    required this.pinPillPosition4,
  }) : super(key: key);

  final double pinPillPosition4;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        left: 0,
        right: 0,
        top: this.pinPillPosition4,
        // bottom: 20,
        child: InkWell(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset.zero)
                ]),
            child: Column(children: [
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'img/Bosque.jpg',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Text(
                          'El Bosque Prohibido',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text('Joc'),
                        Text('Petita descripcio'),
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ));
  }
}

class BottonShowCasas extends StatelessWidget {
  const BottonShowCasas({
    Key? key,
    required this.pinPillPosition5,
  }) : super(key: key);

  final double pinPillPosition5;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        left: 0,
        right: 0,
        top: this.pinPillPosition5,
        // bottom: 20,
        child: InkWell(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset.zero)
                ]),
            child: Column(children: [
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'img/CasaHarry.jpg',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Text(
                          'Casa muggle de Harry',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text('Punt d informació'),
                        Text('Mic mic'),
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Splash()),
            );
          },
        ));
  }
}

class BottonShowJardi extends StatelessWidget {
  const BottonShowJardi({
    Key? key,
    required this.pinPillPosition6,
  }) : super(key: key);

  final double pinPillPosition6;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        left: 0,
        right: 0,
        top: this.pinPillPosition6,
        // bottom: 20,
        child: InkWell(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset.zero)
                ]),
            child: Column(children: [
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'img/JardinBotanico.jpg',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Text(
                          'Jardi botanic',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text('Joc'),
                        Text('Mic mic'),
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Splash()),
            );
          },
        ));
  }
}

class BottonShowMercat extends StatelessWidget {
  const BottonShowMercat({
    Key? key,
    required this.pinPillPosition7,
  }) : super(key: key);

  final double pinPillPosition7;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        left: 0,
        right: 0,
        top: this.pinPillPosition7,
        // bottom: 20,
        child: InkWell(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset.zero)
                ]),
            child: Column(children: [
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'img/Mercado.jpg',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Text(
                          'Mercado Carkitt',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text('Joc'),
                        Text('Mic mic'),
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Splash()),
            );
          },
        ));
  }
}

class BotoPosicioCasa extends StatelessWidget {
  const BotoPosicioCasa({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        left: 0,
        right: 0,
        top: 40,
        // bottom: 20,
        child: InkWell(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset.zero)
                ]),
            child: Column(children: [
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'img/logoHP.png',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Text(
                          'Casa hodwards',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text('Joc'),
                        Text('Petita descripcio'),
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ));
  }
}

class Casa {}

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// //import '../components/circular_button.dart';
// import '../components/main_menu.dart';

// class MyGoogleMap extends StatefulWidget {
//   const MyGoogleMap({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   State<MyGoogleMap> createState() => _MyMyGoogleMapState();
// }

// class _MyMyGoogleMapState extends State<MyGoogleMap>{
//   // Variables of Google maps
//   static final LatLng _kMapCenter = LatLng(41.394209639341035, 2.1280800907598505);
//   static final CameraPosition _kInitialPosition = CameraPosition(target: _kMapCenter, zoom: 19.0, tilt: 0, bearing: 0);

//   late GoogleMapController _controller;

//   Future<void> onMapCreated(GoogleMapController controller) async{
//     _controller = controller;
//     String value = await DefaultAssetBundle.of(context)
//       .loadString('assets/map_style.json');
//     _controller.setMapStyle(value);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         backgroundColor: Colors.lightGreen,
//         centerTitle: true,
//       ),
//       body: Container(
//         child: Stack(
//           children: <Widget>[
//             GoogleMap(
//               mapType: MapType.normal,
//               initialCameraPosition: _kInitialPosition,
//               onMapCreated: onMapCreated,
//               myLocationEnabled: true,
//               myLocationButtonEnabled: true,
//               zoomControlsEnabled: false,
//               padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height / 1.3, MediaQuery.of(context).size.width / 1.2, 0),
//             ),
//             MainMenu()
//           ]
//         )
//       ),
//     );
//   }
// }
