import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({Key? key}) : super(key: key);

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {


  Future<Position> _getUserCurrentLocation() async {

    try {

      return await Geolocator.getCurrentPosition();

    } on PlatformException catch (err) {

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  final Completer<GoogleMapController> _controller = Completer();

  List<Marker> _markers =  <Marker>[];

  static const CameraPosition _kGooglePlex =  CameraPosition(
    target: LatLng(33.6844, 73.0479),
    zoom: 14,
  );


List<Marker> list = const [
  Marker(
      markerId: MarkerId('1'),
      position: LatLng(33.6844, 73.0479),
      infoWindow: InfoWindow(
          title: 'The title of the marker'
      )
  ),
  Marker(
      markerId: MarkerId('2'),
      position: LatLng(33.6694 , 72.9972),
      infoWindow: InfoWindow(
          title: 'G-11 Islamabad'
      )
  ),
];

@override
void initState() {
  // TODO: implement initState
  super.initState();
  _markers.addAll(
      list);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          markers: Set<Marker>.of(_markers),
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          },
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
          _getUserCurrentLocation().then((value) async {
            print('mylocation'+value.latitude.toString() +value.longitude.toString());
            _markers.add(
                Marker(
                    markerId: MarkerId('SomeId'),
                    position: LatLng(value.latitude ,value.longitude),
                    infoWindow: InfoWindow(
                        title: 'My Current Position'
                    )
                )
            );

            final GoogleMapController controller = await _controller.future;
            CameraPosition _kGooglePlex =  CameraPosition(
              target: LatLng(value.latitude ,value.longitude),
              zoom: 14,
            );
            controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
            setState(() {

            });
          });
        },
        child: Icon(Icons.location_disabled_outlined),
      ),
    );
  }


}
