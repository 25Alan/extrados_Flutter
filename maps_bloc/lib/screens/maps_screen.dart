import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Set<Marker> _markers = {};
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _cameraUbication = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapToolbarEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: _cameraUbication,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: (LatLng position) {
          _add(position);
          print(_markers);
        },
        markers: _markers,
      ),
    );
  }

  void _add(LatLng location) {
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId(location.toString()),
            position: location,
            infoWindow: const InfoWindow(title: 'Marker')),
      );
    });
  }
}


/*

import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Set<Marker> _markers = {};
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _vistaCamara = CameraPosition(
    target: LatLng(-31.4324534, -64.19457615),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _vistaCamara,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: (LatLng location) {
          _addMarker(location);
        },
        markers: _markers,
      ),
    );
  }

  void _addMarker(LatLng location) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(location.toString()),
          position: location,
          infoWindow:  const InfoWindow(title: 'PUNTO'),
          
        ),
      );
    });
  }
}

 */