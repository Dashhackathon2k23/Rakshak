import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hackathonapplication/app/Palette.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart';

class AddMarkerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddMarkerState();
  }
}


class AddMarkerState extends State {
    final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(21.2466, 72.8312),
    zoom: 14.0,
  );

   MapmyIndiaMapController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Palette.red,
        title: const Text(
          'Add Marker',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.2, systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: MapmyIndiaMap(
        initialCameraPosition: _kInitialPosition,
        onMapCreated: (map) => {
          controller = map,
        },
        onStyleLoadedCallback: () => {addMarker()},
      ),
    );
  }

  /// Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return controller!.addImage(name, list);
  }

  void addMarker() async {

      await addImageFromAsset("icon", "assets/symbols/custom-icon.png");
      controller!.addSymbol(const SymbolOptions(
           geometry: LatLng(21.2166, 72.8312), iconImage: "icon"),);


  }
}
