import 'dart:async';

import 'package:challenge/address.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserLocationScreen extends StatefulWidget {
  final Address address;
  const UserLocationScreen({Key? key, required this.address}) : super(key: key);

  @override
  State<UserLocationScreen> createState() => _UserLocationScreenState();
}

class _UserLocationScreenState extends State<UserLocationScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Location (${widget.address.geo!.lat.toString()}, ${widget.address.geo!.lng.toString()})"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(widget.address.geo!.lat!, widget.address.geo!.lng!),
            zoom: 0),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          Marker(
              markerId: MarkerId("Location"),
              icon: BitmapDescriptor.defaultMarker,
              position: LatLng(
                widget.address.geo!.lat!,
                widget.address.geo!.lng!,
              ))
        },
      ),
    );
  }
}
