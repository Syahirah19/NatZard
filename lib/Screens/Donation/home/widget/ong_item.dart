import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:natzard/Screens/Donation/details/ong_details.dart';
import 'package:natzard/Screens/Donation/donate/donate.dart';
import 'package:natzard/contants.dart';
import 'package:natzard/model/org.dart';

class OngItem extends StatelessWidget {
  final OrgModel org;
  const OngItem(this.org, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: kDefaultPadding, bottom: kDefaultPadding - 10),
      child: Row(
        children: [
          Container(
            height: 150,
            width: 160,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(org.orgImg, fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 160,
            width: 200,
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: kDefaultPadding - 12,
                          left: kDefaultPadding - 8,
                          bottom: kDefaultPadding - 15,
                        ),
                        child: Row(
                          children: <Widget>[
                            Text(
                              org.orgName,
                              style: const TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: kFont,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 220,
                        height: 60,
                        padding: const EdgeInsets.only(
                          left: kDefaultPadding - 8,
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                org.orgDescription,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: kFont,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 170,
                  padding: const EdgeInsets.only(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(color: kFontLight),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => OngDetails(org)));
                            },
                            child: const Text('Ver +',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18,
                                ))),
                      ),
                      Container(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kButtonDonatePrimary,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DonateDetails(org)));
                            },
                            child: const Text('Doar',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18,
                                ))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
