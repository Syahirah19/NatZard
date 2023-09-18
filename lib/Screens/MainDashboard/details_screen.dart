import 'package:flutter/material.dart';
import 'package:natzard/Screens/Donation/home/donor_home.dart';
import 'package:natzard/Screens/Weather/weather_screen.dart';

import '../../contants.dart';
// import 'components/bottom_nav_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //Kotak purple
          Container(
            height: size.height * .28,
            decoration: const BoxDecoration(
              color: kGreenColor,
              image: DecorationImage(
                image: AssetImage("assets/image/top.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),

                    //Title
                    const Text(
                      "Welcome to Natzard",
                      style: TextStyle(
                        fontFamily: "Work Sans",
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        letterSpacing: 0.0,
                        color: Colors.white,
                      ),
                    ),

                    //Heading 1
                    const SizedBox(height: 10),
                    SizedBox(
                      width: size.width * .6, // it just take 60% of total width
                      child: const Text(
                        "Prepare the umbrella before the rain with us! Always be safe",
                      ),
                    ),
                    const SizedBox(height: 30),

                    // SizedBox(
                    //   width: size.width * .5, // it just take the 50% width
                    //   child: const SearchBar(),
                    // ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: <Widget>[
                        SeassionCard(
                          seassionNum: "Impacted\nAreas",
                          isDone: true,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: "Donation",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DonorHomeScreen()),
                            );
                          },
                        ),
                        SeassionCard(
                          seassionNum: "Resources",
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: "Live Stream",
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: "Weather",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                            );
                          },
                        ),
                        SeassionCard(
                          seassionNum: "Share",
                          press: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Activity Wall",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    // Container(
                    //   margin: const EdgeInsets.symmetric(vertical: 20),
                    //   padding: const EdgeInsets.all(10),
                    //   height: 90,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(13),
                    //     boxShadow: const [
                    //       BoxShadow(
                    //         offset: Offset(0, 17),
                    //         blurRadius: 23,
                    //         spreadRadius: -13,
                    //         color: kShadowColor,
                    //       ),
                    //     ],
                    //   ),
                    //   // child: Row(
                    //   //   children: <Widget>[
                    //   //     SvgPicture.asset(
                    //   //       "assets/icons/Meditation_women_small.svg",
                    //   //     ),
                    //   //     const SizedBox(width: 20),
                    //   //     Expanded(
                    //   //       child: Column(
                    //   //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   //         crossAxisAlignment: CrossAxisAlignment.start,
                    //   //         children: <Widget>[
                    //   //           Text(
                    //   //             "Report 1",
                    //   //             style: Theme.of(context).textTheme.titleSmall,
                    //   //           ),
                    //   //           const Text("Snake in my house")
                    //   //         ],
                    //   //       ),
                    //   //     ),
                    //   //     Padding(
                    //   //       padding: const EdgeInsets.all(10),
                    //   //       child: SvgPicture.asset("assets/icons/Lock.svg"),
                    //   //     ),
                    //   //   ],
                    //   // ),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeassionCard extends StatelessWidget {
  final String seassionNum;
  final bool isDone;
  final Function()? press;
  const SeassionCard({
    Key? key,
    required this.seassionNum,
    this.isDone = false,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, // constraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? kGreenColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kGreenColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kGreenColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      seassionNum,
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
