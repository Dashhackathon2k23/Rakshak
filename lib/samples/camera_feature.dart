import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hackathonapplication/app/Palette.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart';


class CameraFeature extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CameraFeatureState();
  }
}

class CameraFeatureState extends State {
  late MapmyIndiaMapController mapController;
  bool isMapLoded = false;

    final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(25.321684, 82.987289),
    zoom: 14.0,
  );

  @override
  void initState() {
    super.initState();
    setState(() {
      isMapLoded = false;
    });
  }

  void _onMapCreated(MapmyIndiaMapController controller) {
    mapController = controller;
    setState(() {
      isMapLoded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Palette.red,
          title: const Text(
            'Camera Feature',
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0.2, systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: MapmyIndiaMap(
                  initialCameraPosition: _kInitialPosition,
                  onMapCreated: _onMapCreated,
                )),
            isMapLoded
                ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 4,
                ),
                Expanded(
                    child: TextButton(
                      onPressed: () {
                        if (mapController != null) {
                          mapController.moveCamera(CameraUpdate.newLatLngZoom(
                              const LatLng(22.553147478403194, 77.23388671875),
                              14));
                        }
                      },
                      child: const Text(
                        'Move Camera',
                        style: TextStyle(color: Colors.black),
                      ),
                      // color: MyColor.colorPrimaryDark,
                    )),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                    child: TextButton(
                      onPressed: () {
                        if (mapController != null) {
                          mapController.easeCamera(CameraUpdate.newLatLngZoom(
                              const LatLng(28.704268, 77.103045), 14));
                        }
                      },
                      child: const Text('Ease Camera',
                          style: TextStyle(color: Colors.black)),
                      // color: MyColor.colorPrimaryDark,
                    )),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                    child: TextButton(
                      onPressed: () {
                        if (mapController != null) {
                          mapController.animateCamera(
                              CameraUpdate.newLatLngZoom(
                                  const LatLng(28.698791, 77.121243), 14));
                        }
                      },
                      child:const Text(
                        'Animate Camera',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      // color: MyColor.colorPrimaryDark,
                    )),
                const SizedBox(
                  width: 4,
                )
              ],
            )
                : Container(),
          ],
        ));
  }
}