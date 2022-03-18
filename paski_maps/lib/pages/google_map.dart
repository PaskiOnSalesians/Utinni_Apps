import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../components/circular_button.dart';

class MyGoogleMap extends StatefulWidget {
  const MyGoogleMap({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyGoogleMap> createState() => _MyMyGoogleMapState();
}

class _MyMyGoogleMapState extends State<MyGoogleMap>  with SingleTickerProviderStateMixin{
  // Variables of main menu
  late AnimationController animationController;
  late Animation degOneTranslationAnimation;

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

  double getRadiansFromDegree(double degree){
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void dispose(){
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 250));
    degOneTranslationAnimation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    animationController.addListener(() {
      setState(() {
        
      });
    });
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
            mainMenu()
          ]
        )
      ),
    );
  }

  Positioned mainMenu() {
    return Positioned(
      right: 50,
      bottom: 40,
      child: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(290), degOneTranslationAnimation.value * 90 ),
            child: CircularButton(
              color: Colors.redAccent,
              width: 50,
              height: 50,
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              onClick: (){
          
              },
            ),
          ),

          Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(250), degOneTranslationAnimation.value * 90),
            child: CircularButton(
              color: Colors.redAccent,
              width: 50,
              height: 50,
              icon: const Icon(
                Icons.star,
                color: Colors.white,
              ),
              onClick: (){
          
              },
            ),
          ),

          Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(210), degOneTranslationAnimation.value * 90),
            child: CircularButton(
              color: Colors.redAccent,
              width: 50,
              height: 50,
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              onClick: (){
          
              },
            ),
          ),

          Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(170), degOneTranslationAnimation.value * 90),
            child: CircularButton(
              color: Colors.redAccent,
              width: 50,
              height: 50,
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onClick: (){
          
              },
            ),
          ),

          CircularButton(
            color: Colors.red,
            width: 50,
            height: 50,
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onClick: (){
              if(animationController.isCompleted){
                animationController.reverse();
              } else{
                animationController.forward();
              }
            },
          ),
        ]
      )
    );
  }
}