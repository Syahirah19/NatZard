import 'package:flutter/material.dart';
import 'package:natzard/model/org.dart';

import 'Widget/donate_banner.dart';
import 'Widget/donate_informations.dart';

class DonateDetails extends StatefulWidget {
  final OrgModel org;
  DonateDetails(this.org);

  @override
  _DonateDetailsState createState() => _DonateDetailsState();
}

class _DonateDetailsState extends State<DonateDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            DonateBanner(
              widget.org,
            ),
            DonateInformations(
              widget.org,
            ),
          ],
        ),
      ),
    );
  }
}
