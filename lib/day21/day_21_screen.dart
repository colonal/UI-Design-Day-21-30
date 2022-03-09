import 'package:flutter/material.dart';
import 'package:ui_design_day_21_30/day21/helpers/strings.dart';

import 'helpers/colors_sys.dart';

class Day21Screen extends StatefulWidget {
  const Day21Screen({Key? key}) : super(key: key);

  @override
  State<Day21Screen> createState() => _Day21ScreenState();
}

class _Day21ScreenState extends State<Day21Screen> {
  late PageController _pageController;
  int currentIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25, top: 20),
            child: Text(
              "Skip",
              style: TextStyle(
                color: ColorSys.gray,
                fontSize: 25,
                fontFamily: "Nunito",
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            children: [
              makePage(
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent,
                image: "assets/images/day21/step-one.png",
              ),
              makePage(
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent,
                  image: "assets/images/day21/step-two.png",
                  revers: true),
              makePage(
                title: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
                image: "assets/images/day21/step-three.png",
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_buildIndicator()],
            ),
          ),
        ],
      ),
    );
  }

  makePage({title, content, image, revers = false}) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!revers)
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              color: ColorSys.primary,
              fontSize: 25,
              fontFamily: "Nunito",
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(
              color: ColorSys.gray,
              fontSize: 18,
              fontFamily: "Nunito",
            ),
          ),
          if (revers) const SizedBox(height: 20),
          if (revers)
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
        ],
      ),
    );
  }

  _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          3,
          ((int index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 6,
                width: currentIndex == index ? 30 : 6,
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  color: ColorSys.secoundry,
                  borderRadius: BorderRadius.circular(5),
                ),
              )),
        ),
      ],
    );
  }
}
