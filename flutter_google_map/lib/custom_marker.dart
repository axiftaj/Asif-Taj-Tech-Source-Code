import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class CustomMarkerScreen extends StatefulWidget {
  const CustomMarkerScreen({Key? key}) : super(key: key);

  @override
  _CustomMarkerScreenState createState() => _CustomMarkerScreenState();
}

class _CustomMarkerScreenState extends State<CustomMarkerScreen> {

  final Completer<GoogleMapController> _controller = Completer();

  List<String> images = [ 'images/car.png' , 'images/marker.png' ,];

  Uint8List? markerImage;
  final List<Marker> _markers =  <Marker>[];

  static const CameraPosition _kGooglePlex =  CameraPosition(
    target: LatLng(33.6844, 73.0479),
    zoom: 14,
  );

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();

    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();

  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData()async{

    for(int i = 0 ; i < images.length ; i++){
      print('name'+images[i].toString());
      final Uint8List markerIcon = await getBytesFromAsset(images[i].toString(), 100);

      if(i == 1 ){
        _markers.add(Marker(
                markerId: MarkerId('2'),
                position: LatLng(33.6992,  72.9744),
                icon: BitmapDescriptor.fromBytes(markerIcon),
                infoWindow: InfoWindow(
                    title: 'The title of the marker'
                )
            ));
      }else {
        _markers.add( Marker(
            markerId: MarkerId(i.toString()),
            position: LatLng(33.6844, 73.0479),
            icon: BitmapDescriptor.fromBytes(markerIcon),
            infoWindow: InfoWindow(
                title: 'The title of the marker'
            )));
      }

      setState(() {

      });
    }



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
    );
  }
}
