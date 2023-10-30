import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hackathonapplication/app/Palette.dart';
import 'package:hackathonapplication/app/assets.dart';
import 'package:hackathonapplication/app/dimensions.dart';
import 'package:hackathonapplication/custom_widget/cards.dart';
import 'package:hackathonapplication/widgets/base_scaffold.dart';
import 'package:hackathonapplication/widgets/text_widget.dart';

class AddressServicesScreen extends StatefulWidget {
  const AddressServicesScreen({super.key});

  @override
  State<AddressServicesScreen> createState() => _AddressServicesScreenState();
}

class _AddressServicesScreenState extends State<AddressServicesScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  Widget build(BuildContext context) {
    return BaseScaffold(
      hasAppbar: true,
      hasBack: true,
      appBarColor: Palette.mainColor,
      title: "Services",
      titleStyle: const TextStyle(color: Palette.white),
      actions: [],
      child: Column(
        children: [_tabBar(), h30, Expanded(child: _tabBarView())],
      ),
    );
  }

  Widget _tabBar() {
    return Container(
      color: Palette.lightMain,
      child: TabBar(
          indicatorColor: Palette.white,
          indicatorWeight: 3,
          controller: tabController,
          labelStyle:
              const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          tabs: const [
            Tab(
              text: "Address",
            ),
            Tab(
              text: "Services",
            ),
          ]),
    );
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: tabController,
      children: [
        _addressView(),
        servicesView(),
      ],
    );
  }

  Widget servicesView() {
    return ListView(
      children: [
        _fireText(),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Divider(
            color: Palette.redLight,
            thickness: 2,
          ),
        ),
        h5,
        CarouselSlider.builder(
          itemCount: 4,
          carouselController: CarouselController(),
          itemBuilder: (context, index, realIndex) {
            return CardWidget(
              address: "puna Gam Firestation pune",
              phoneNumber: "7479923931",
              stationName: "punagam Firestation",
              stationTitle: "puna Gam fire station puna gam",
              color: Palette.redLight,
              png: Assets.fire,
              onTap: () {

              },
            );
          },
          options: CarouselOptions(
            height: 180,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            pageSnapping: false,
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: false,
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.1,
            onPageChanged: (index, reason) {},
            scrollDirection: Axis.horizontal,
          ),
        ),
        h20,
        _policeText(),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Divider(
            color: Palette.yellow,
            thickness: 2,
          ),
        ),
        h5,
        CarouselSlider.builder(
          itemCount: 4,
          carouselController: CarouselController(),
          itemBuilder: (context, index, realIndex) {
            return CardWidget(
              address: "puna Gam Firestation pune",
              phoneNumber: "7479923931",
              stationName: "punagam Firestation",
              stationTitle: "puna Gam fire station puna gam",
              color: Palette.yellow,
              png: Assets.police,
              onTap: () {

              },
            );
          },
          options: CarouselOptions(
            height: 180,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            pageSnapping: false,
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: false,
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.1,
            onPageChanged: (index, reason) {},
            scrollDirection: Axis.horizontal,
          ),
        ),
        h20,
        _hospitalText(),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Divider(
            color: Palette.lightBlue,
            thickness: 2,
          ),
        ),
        h5,
        CarouselSlider.builder(
          itemCount: 4,
          carouselController: CarouselController(),
          itemBuilder: (context, index, realIndex) {
            return CardWidget(
              address: "puna Gam Firestation pune",
              phoneNumber: "7479923931",
              stationName: "punagam Firestation",
              stationTitle: "puna Gam fire station puna gam",
              color: Palette.lightBlue,
              png: Assets.hospital,
              onTap: () {

              },
            );
          },
          options: CarouselOptions(
            height: 180,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            pageSnapping: false,
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: false,
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.1,
            onPageChanged: (index, reason) {},
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }

  Widget _addressView() {
    return ListView(
      children: [],
    );
  }

  Widget _fireText() {
    return const Padding(
      padding: EdgeInsets.only(left: 50),
      child: Row(
        children: [
          Icon(
            Icons.local_fire_department_sharp,
            color: Palette.red,
            size: 30,
          ),
          w10,
          Texts(
            "FIRE SERVICES",
            fontWeight: FontWeight.bold,
            color: Palette.redLight,
            fontSize: 19,
          )
        ],
      ),
    );
  }

  Widget _policeText() {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: Row(
        children: [
          Image.asset(Assets.police),
          w10,
          const Texts(
            "POLICE SERVICES",
            fontWeight: FontWeight.bold,
            color: Palette.yellow,
            fontSize: 19,
          )
        ],
      ),
    );
  }

  Widget _hospitalText() {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: Row(
        children: [
          Image.asset(Assets.hospital),
          w10,
          const Texts(
            "HOSPITAL SERVICES",
            fontWeight: FontWeight.bold,
            color: Palette.lightBlue,
            fontSize: 19,
          )
        ],
      ),
    );
  }
}
