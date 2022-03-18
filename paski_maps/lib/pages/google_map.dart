import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//import '../components/circular_button.dart';
import '../components/main_menu.dart';

class MyGoogleMap extends StatefulWidget {
  const MyGoogleMap({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyGoogleMap> createState() => _MyMyGoogleMapState();
}

class _MyMyGoogleMapState extends State<MyGoogleMap>{
  // Variables of Google maps
  static final LatLng _kMapCenter = LatLng(41.394209639341035, 2.1280800907598505);
  static final CameraPosition _kInitialPosition = CameraPosition(target: _kMapCenter, zoom: 19.0, tilt: 0, bearing: 0);

  late GoogleMapController _controller;

  Future<void> onMapCreated(GoogleMapController controller) async{
    _controller = controller;
    String value = await DefaultAssetBundle.of(context)
      .loadString('assets/map_style.json');
    _controller.setMapStyle(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: Container(
        child: Stack(
          children: <Widget>[            
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kInitialPosition,
              onMapCreated: onMapCreated,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
              padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height / 1.3, MediaQuery.of(context).size.width / 1.2, 0),
            ),
            MainMenu()
          ]
        )
      ),
    );
  }
}