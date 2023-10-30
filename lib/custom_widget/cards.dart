

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathonapplication/app/Palette.dart';
import 'package:hackathonapplication/app/dimensions.dart';
import 'package:hackathonapplication/app/globals.dart';

class CardWidget extends StatefulWidget {
  String? phoneNumber;
  String? address;
  String? stationName;
  String? stationTitle;
  Color color;
  String png;
  void Function()? onTap;

  CardWidget({
    super.key,
    required this.address,
    required this.phoneNumber,
    required this.stationName,
    required this.stationTitle,
    required this.color,
    required this.png,
    required this.onTap,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("hiamnshi");
      },
      child: Container(
       color: Colors.transparent,
        margin: const EdgeInsets.only(right: 20),
        child: Column(children: [
          Container(
            decoration:  BoxDecoration(
              color: widget.color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            height: 70,
            width: 340,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: Text("${widget.stationTitle}",
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: "Gilroy",
                            fontWeight: FontWeight.bold)),
                  ),
                   w10,
                   Image.asset(widget.png, color: Palette.white,)
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            height: 105,
            width: 340,
            child: Card(
              elevation: 20,
              // shadowColor: Colors.grey,
              margin: const EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("\n\t ${widget.stationName}",
                        style:  TextStyle(
                            color: widget.color,
                            fontSize: 15,
                            fontFamily: "Gilroy",
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 3,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                              text: "\t Phone :  ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Gilroy",
                                  color: Colors.black)),
                          TextSpan(
                              text: widget.phoneNumber,
                              style: const TextStyle(
                                  fontFamily: "Gilroy",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                              text: "\t Address :  ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Gilroy",
                                  color: Colors.black)),
                          TextSpan(
                              text: widget.address,
                              style: const TextStyle(
                                  fontFamily: "Gilroy",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
