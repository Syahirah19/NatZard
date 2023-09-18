import 'package:flutter/material.dart';
import 'package:natzard/Screens/Donation/update_account_donor/widget/update_account_donnor_banner.dart';
import 'package:natzard/Screens/Donation/update_account_donor/widget/update_account_donnor_body.dart';
import 'package:natzard/contants.dart';

class UpdateDonnorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            UpdateDonnorBanner(),
            UpdateDonnorBody(),
          ],
        ),
      ),
    );
  }
}
