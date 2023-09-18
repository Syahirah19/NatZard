import 'package:flutter/material.dart';
import 'package:natzard/Screens/Donation/donate_confirm/widget/confirm_information.dart';
import 'package:natzard/Screens/Donation/donate_confirm/widget/top_bar_confirmation.dart';
import 'package:natzard/Screens/Donation/home/donor_home.dart';
import 'package:natzard/Screens/Donation/update_account_donor/update_account_donor.dart';
import 'package:natzard/contants.dart';

class DonateConfirmScreen extends StatefulWidget {
  @override
  _DonateConfirmScreenState createState() => _DonateConfirmScreenState();
}

class _DonateConfirmScreenState extends State<DonateConfirmScreen> {
  int currentlyIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentlyIndex = index;
    });

    if (currentlyIndex == 0) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DonorHomeScreen()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => UpdateDonnorPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TopBarConfirm(),
            ConfirmInformations(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentlyIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: kBackgroundColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: onTabTapped,
      items: [
        BottomNavigationBarItem(
          label: 'home',
          icon: Image.asset('assets/icons/home.png', width: 25),
        ),
      ],
    );
  }
}
