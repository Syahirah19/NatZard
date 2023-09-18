import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:natzard/Screens/Donation/donate_confirm/donate_confirm.dart';
import 'package:natzard/contants.dart';
import 'package:natzard/model/org.dart';

class DonateInformations extends StatelessWidget {
  final OrgModel org;
  DonateInformations(this.org);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    bottom: kDefaultPadding,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        org.orgName,
                        style: const TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: kFont,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: kDefaultPadding - 15,
                          bottom: kDefaultPadding - 5,
                        ),
                        child: const Column(
                          children: [
                            Text(
                              'Escolha uma forma de contribuir e realize sua doação:',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: kFont,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ])),
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: kDefaultPadding - 15,
                          bottom: kDefaultPadding - 15,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Pix:',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            Container(
                              padding: const EdgeInsets.only(
                                left: kDefaultPadding - 15,
                              ),
                              child: Row(children: [
                                Text(
                                  org.orgPix!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: kDefaultPadding - 15,
                          bottom: kDefaultPadding - 15,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Banco:',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            Container(
                              padding: const EdgeInsets.only(
                                left: kDefaultPadding - 15,
                              ),
                              child: Row(children: [
                                Text(
                                  org.orgBankName!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: kDefaultPadding - 15,
                          bottom: kDefaultPadding - 15,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Conta:',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            Container(
                              padding: const EdgeInsets.only(
                                left: kDefaultPadding - 15,
                              ),
                              child: Row(children: [
                                Text(
                                  org.orgBankAccount!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: kDefaultPadding - 15,
                          bottom: kDefaultPadding - 15,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Agency:',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            Container(
                              padding: const EdgeInsets.only(
                                left: kDefaultPadding - 15,
                              ),
                              child: Row(children: [
                                Text(
                                  org.orgBankName!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: kDefaultPadding - 5,
                    ),
                    height: 65,
                    width: 335,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kButtonDonatePrimary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DonateConfirmScreen()));
                      },
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
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
