import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:natzard/Screens/Donation/home/widget/list_title.dart';
import 'package:natzard/Screens/Donation/home/widget/ong_item.dart';
import 'package:natzard/Screens/Donation/home/widget/title_view.dart';
import 'package:natzard/Screens/Donation/home/widget/top_bar.dart';
import 'package:natzard/controller/org_controller.dart';
import 'package:natzard/model/org.dart';

class DonorHomeScreen extends StatefulWidget {
  @override
  _DonorHomeScreenState createState() => _DonorHomeScreenState();
}

class _DonorHomeScreenState extends State<DonorHomeScreen> {
  final controller = Get.put(OrgController());

  List<Widget> listViews = <Widget>[];

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    addAllListData();
    super.initState();
  }

  void addAllListData() {
    const int count = 5;

    listViews.add(
      TitleView(
        titleTxt: 'Your program',
        subTxt: 'Details',
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TopBar(),
              FutureBuilder<bool>(
                future: getData(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (!snapshot.hasData) {
                    return const SizedBox();
                  } else {
                    return ListView.builder(
                      controller: scrollController,
                      padding: EdgeInsets.only(
                        top: AppBar().preferredSize.height +
                            MediaQuery.of(context).padding.top +
                            24,
                        bottom: 62 + MediaQuery.of(context).padding.bottom,
                      ),
                      itemCount: listViews.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return listViews[index];
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
