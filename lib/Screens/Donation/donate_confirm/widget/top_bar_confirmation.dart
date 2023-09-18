import 'package:flutter/material.dart';
import 'package:natzard/contants.dart';

class TopBarConfirm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: size.height * 0.32,
          child: Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                    left: 100 + kDefaultPadding,
                    right: kDefaultPadding,
                    top: kDefaultPadding,
                    bottom: kDefaultPadding),
                height: size.height * 0.3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage("assets/images/top.png")),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 100 + kDefaultPadding,
                  right: kDefaultPadding,
                  bottom: kDefaultPadding + 50,
                  top: 50 + kDefaultPadding,
                ),
                child: const Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Donate Easily',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Text(
                        'Connecting those who can donate with those in need',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 160,
                padding: const EdgeInsets.only(
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  bottom: kDefaultPadding,
                  top: kDefaultPadding + 35,
                ),
                child: Row(
                  children: <Widget>[Image.asset("assets/image/appicon.png")],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
