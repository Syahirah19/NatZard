import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:natzard/Screens/Donation/details/widget/ong_banner.dart';
import 'package:natzard/Screens/Donation/details/widget/ong_description.dart';
import 'package:natzard/model/org.dart';

class OngDetails extends StatefulWidget {
  final OrgModel org;
  OngDetails(this.org);

  @override
  _OngDetailsState createState() => _OngDetailsState();
}

class _OngDetailsState extends State<OngDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            OngBanner(
              widget.org,
            ),
            OngDescription(
              widget.org,
            ),
          ],
        ),
      ),
    );
  }
}
