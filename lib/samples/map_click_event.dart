import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:hackathonapplication/app/Palette.dart';

import 'package:mapmyindia_gl/mapmyindia_gl.dart';

class MapClickEvent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MapClickEventState();
  }

}

class MapClickEventState extends State {
  static final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(28.551087, 77.257373),
    zoom: 14.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Palette.red,
        title:const Text(
          'Map Click',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.2, systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: MapmyIndiaMap(
        initialCameraPosition: _kInitialPosition,
        onMapClick: (point, latlng) =>{
          print(latlng.toString()),
          // Fluttertoast.showToast(msg: latlng.toString(), toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM),
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(latlng.toString()))),
        },
      ),
    );
  }

}