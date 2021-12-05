import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class ShowMap extends StatefulWidget {
  const ShowMap({Key? key}) : super(key: key);

  @override
  _ShowMapState createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {
  static LatLng myPosition = const LatLng(37.4220449, -122.0140497);

  late GoogleMapController mapController;

  Location location = Location();
  late LocationData locationData;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        GoogleMap(
          zoomControlsEnabled: false,
          myLocationButtonEnabled: true,
          zoomGesturesEnabled: true,
          myLocationEnabled: true,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(target: myPosition, zoom: 14.0),
        ),
      ]),
    );
  }
}
