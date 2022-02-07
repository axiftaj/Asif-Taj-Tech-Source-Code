import 'package:flutter/material.dart';

import 'package:geocoder2/geocoder2.dart';


class ConvertLatLangToAddress extends StatefulWidget {
  const ConvertLatLangToAddress({Key? key}) : super(key: key);

  @override
  _ConvertLatLangToAddressState createState() => _ConvertLatLangToAddressState();
}

class _ConvertLatLangToAddressState extends State<ConvertLatLangToAddress> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                const Text('latitude: 37.597576, longitude: 55.771899'),
             //   Text(address),
              ],
            ),
            const SizedBox(height: 40),
            Column(
              children: <Widget>[
                const Text('address: Москва, 4-я Тверская-Ямская улица, 7'),
                //Text(latLong),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          FetchGeocoder fetchGeocoder = await Geocoder2.getAddressFromCoordinates(
              latitude: 40.714224,
              longitude: -73.961452,
              googleMapApiKey: "AIzaSyDAmUHmAnmkjKmXLDg5lYGm6dfkVaHsbUM");
          var first = fetchGeocoder.results.first.toJson();
          print(first);

          FetchGeocoder fetchGeocoder1 = await Geocoder2.getCoordinatesFromAddress(
              address: "277 Bedford Ave, Brooklyn, NY 11211, USA",
              googleMapApiKey: "GOOGLE_MAP_API_KEY");
          var second = fetchGeocoder.results.first;
          print("${first.second.location.lat} , ${first.second.location.lng}");

          setState(() {});
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
