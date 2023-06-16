import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../contants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 80,
      color: Colors.white,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            title: "Resources",
            svgScr: "assets/icons/Resources.svg",
          ),
          BottomNavItem(
            title: "Search",
            svgScr: "assets/icons/Search.svg",
            isActive: true,
          ),
          BottomNavItem(
            title: "Home",
            svgScr: "assets/icons/Home.svg",
          ),
          BottomNavItem(
            title: "Profile",
            svgScr: "assets/icons/Profile.svg",
          ),
          BottomNavItem(
            title: "Menu",
            svgScr: "assets/icons/Menu.svg",
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgScr;
  final String title;
  final Function()? press;
  final bool isActive;
  const BottomNavItem({
    key,
    required this.svgScr,
    required this.title,
    this.press,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(
            svgScr,
            color: isActive ? kActiveIconColor : kTextColor,
            fit: BoxFit.scaleDown,
            height: 30,
            width: 30,
          ),
          Text(
            title,
            style: TextStyle(color: isActive ? kActiveIconColor : kTextColor),
          ),
        ],
      ),
    );
  }
}
