import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_qr_scanner/src/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)?.settings.arguments as ScanModel;

    final CameraPosition initialPosition = CameraPosition(
      target: scan.getLatLng(),
      zoom: 16,
    );

    Set<Marker> markers = new Set<Marker>();
    markers.add(Marker(
        markerId: MarkerId("geo-location-marker-id"),
        position: scan.getLatLng()));

    return Scaffold(
      appBar: AppBar(
        title: Text("Coordinates"),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on_sharp),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(target: scan.getLatLng(), zoom: 17)));
            },
          )
        ],
      ),
      body: GoogleMap(
        mapType: mapType,
        markers: markers,
        initialCameraPosition: initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.layers),
        onPressed: () {
          if (mapType == MapType.normal) {
            mapType = MapType.satellite;
          } else {
            mapType = MapType.normal;
          }
          setState(() {});
        },
      ),
    );
  }
}
