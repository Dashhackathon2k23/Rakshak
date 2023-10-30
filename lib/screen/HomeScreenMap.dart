import 'package:flutter/material.dart';
import 'package:hackathonapplication/samples/camera_feature.dart';
import 'package:hackathonapplication/samples/map_click_event.dart';
import 'package:hackathonapplication/app/Palette.dart';
import 'package:hackathonapplication/utils/feature_type.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart';

class HomeScreen extends StatefulWidget {
  static const String MAP_SDK_KEY = "";
  static const String REST_API_KEY = "";
  static const String ATLAS_CLIENT_ID = "";
  static const String ATLAS_CLIENT_SECRET = "";

  FeatureType? selectedFeatureType;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(25.321684, 82.987289),
    zoom: 10.0,
  );
  MapmyIndiaMapController? controller;

  TextEditingController textController = TextEditingController();

  int selectedIndex = 0;

  DirectionsRoute? route;

  @override
  void initState() {
    Mapsdks();

    super.initState();
  }

  double north = 21.2266;
  double east = 72.8312;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.appbar,
          actions: [
            IconButton(
              onPressed: () {
                print("Tap on pin icon ");

                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return CameraFeature();
                  },
                ));
              },
              icon: const Icon(Icons.pin_drop),
            ),
            IconButton(
              onPressed: () {
                print("Tap on pin icon ");

                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return MapClickEvent();
                  },
                ));
              },
              icon: const Icon(Icons.map),
            ),
          ],
        ),
        drawer: SizedBox(
          width: screenWidth,
          child: Drawer(
            child: ListView(
              children: [
                AppBar(
                    title: const Center(
                      child: Text(
                        "Settings",
                      ),
                    ),
                    actions: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 25,
                          ))
                    ],
                    backgroundColor: Palette.appbar),
                const SizedBox(
                  height: 15,
                ),
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Palette.appbar,
                    maxRadius: 30,
                    child: Icon(
                      Icons.notifications_none_outlined,
                      size: 30,
                      color: Palette.commonColor,
                    ),
                  ),
                  title: const Text('Notification',
                      style: TextStyle(
                          fontFamily: "Gilroy",
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Palette.appbar,
                    maxRadius: 30,
                    child: Icon(
                      Icons.notifications_none_outlined,
                      size: 30,
                      color: Palette.commonColor,
                    ),
                  ),
                  title: const Text('Account & Subscription',
                      style: TextStyle(
                          fontFamily: "Gilroy",
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 15,
                ),

              ],
            ),
          ),
        ),
        body: MapmyIndiaMap(
          initialCameraPosition: _kInitialPosition,
        ),
      ),
    );
  }

  void Mapsdks() {
    MapmyIndiaAccountManager.setMapSDKKey("d7730b6b7b796309ca737b1c923a94f3");
    MapmyIndiaAccountManager.setRestAPIKey("d7730b6b7b796309ca737b1c923a94f3");
    MapmyIndiaAccountManager.setAtlasClientId(
        "33OkryzDZsI0S8dSCcIGqhah7M5A_qUwRHgOzGH5eWuSwl5mcjC4ZkrlH6KPGkTQxdvnRk-FAuQ7-oN_-RQoi7H2uAUF3QcU");
    MapmyIndiaAccountManager.setAtlasClientSecret(
        "lrFxI-iSEg_LDdtssl6TK4amuZWxmAKfrEDbAz7iKHLOUIE_Wh51TT6x7_xVOjJ5pmPR3cFJgm5fLiJIn8YsYdcvqFrJMzuUw3ghG8kqcbg=");
  }
}
