import 'package:flutter/cupertino.dart';
import 'package:natzard/contants.dart';

class ListTitle extends StatelessWidget {
  final String leftText;
  ListTitle(this.leftText);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500,
        padding:
            const EdgeInsets.only(top: kDefaultPadding, left: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              leftText,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, color: kFont),
            ),
            Container(
              padding: const EdgeInsets.only(top: kDefaultPadding - 10),
              child: const Text(
                'Choose a nonprofit organization below to make a donation.',
                style: TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 16, color: kFont),
              ),
            ),
          ],
        ));
  }
}
