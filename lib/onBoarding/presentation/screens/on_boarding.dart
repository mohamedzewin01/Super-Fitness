import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_fitness/core/resources/assets_manager.dart';
import 'package:super_fitness/core/resources/color_manager.dart';
import 'package:super_fitness/core/widgets/custom_elevated_button.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  Widget dotPageView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 3; i++)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            width: currentPage == i ? 25 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: i == currentPage
                  ? ColorManager.mainColor
                  : ColorManager.offwhite,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
      ],
    );
  }

  PageController nextPage = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetsManager.onBoardingBackGround,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          PageView(
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            controller: nextPage,
            children: [
              Stack(
                children: [
                  Column(
                    spacing: 16,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 17, top: 40),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(context, RoutesManager.loginView);
                            },
                            child: Text(
                              "Skip",
                              style: GoogleFonts.balooThambi2(
                                color: ColorManager.offwhite,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Image.asset(
                        AssetsManager.onBoardingImage1,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                        child: Container(
                          height: 300,
                          width: double.infinity,
                          padding:
                              EdgeInsets.only(top: 30, left: 16, right: 16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.04),
                          ),
                          child: Column(
                            spacing: 4,
                            children: [
                              Text(
                                "The Price Of Excellence\nIs Discipline",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.balooThambi2(
                                  color: ColorManager.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                "Excellence is earned through discipline—choosing hard work and focus every day. Without it, talent fades and dreams stay distant.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.balooThambi2(
                                  color: ColorManager.offwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 24),
                              dotPageView(),
                              SizedBox(height: 24),
                              CustomElevatedButton(
                                buttonColor: ColorManager.mainColor,
                                title: "Next",
                                style: GoogleFonts.balooThambi2(
                                  color: ColorManager.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                ),
                                onPressed: () {
                                  nextPage.nextPage(
                                      duration: Duration(milliseconds: 600),
                                      curve: Curves.easeIn);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Column(
                    spacing: 16,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 17, top: 40),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(context, RoutesManager.loginView);
                            },
                            child: Text(
                              "Skip",
                              style: GoogleFonts.balooThambi2(
                                color: ColorManager.offwhite,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Image.asset(
                        AssetsManager.onBoardingImage2,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                        child: Container(
                          height: 300,
                          width: double.infinity,
                          padding:
                              EdgeInsets.only(top: 30, left: 16, right: 16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.04),
                          ),
                          child: Column(
                            spacing: 4,
                            children: [
                              Text(
                                "Fitness Has Never Been So \n Much Fun",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.balooThambi2(
                                  color: ColorManager.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                "Fitness turns into fun when you enjoy the journey—making every workout an adventure and every effort a step toward progress.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.balooThambi2(
                                  color: ColorManager.offwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 24),
                              dotPageView(),
                              SizedBox(height: 24),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      nextPage.previousPage(
                                          duration: Duration(milliseconds: 600),
                                          curve: Curves.easeIn);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      side: BorderSide(
                                          color: ColorManager.mainColor),
                                      minimumSize: const Size(31, 48),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(24)),
                                      ),
                                    ),
                                    child: Text(
                                      "Back",
                                      style: GoogleFonts.balooThambi2(
                                        color: ColorManager.offwhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      nextPage.nextPage(
                                          duration: Duration(milliseconds: 600),
                                          curve: Curves.easeIn);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorManager.mainColor,
                                      minimumSize: const Size(31, 48),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(24)),
                                      ),
                                    ),
                                    child: Text(
                                      "Next",
                                      style: GoogleFonts.balooThambi2(
                                        color: ColorManager.offwhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Column(
                    spacing: 16,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 78),
                        child: Image.asset(
                          AssetsManager.onBoardingImage3,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                        child: Container(
                          height: 300,
                          width: double.infinity,
                          padding:
                              EdgeInsets.only(top: 30, left: 16, right: 16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.03),
                          ),
                          child: Column(
                            spacing: 4,
                            children: [
                              Text(
                                "NO MORE EXCUSES \nDo It Now",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.balooThambi2(
                                  color: ColorManager.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                "Enough excuses—start now. Every moment you wait is a moment wasted. Take action today and build the future you deserve.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.balooThambi2(
                                  color: ColorManager.offwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 24),
                              dotPageView(),
                              SizedBox(height: 24),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      nextPage.previousPage(
                                          duration: Duration(milliseconds: 600),
                                          curve: Curves.easeIn);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      side: BorderSide(
                                          color: ColorManager.mainColor),
                                      minimumSize: const Size(31, 48),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(24)),
                                      ),
                                    ),
                                    child: Text(
                                      "Back",
                                      style: GoogleFonts.balooThambi2(
                                        color: ColorManager.offwhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Navigator.pushNamed(context, RoutesManager.loginView);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorManager.mainColor,
                                      minimumSize: const Size(31, 48),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(24)),
                                      ),
                                    ),
                                    child: Text(
                                      "Do IT",
                                      style: GoogleFonts.balooThambi2(
                                        color: ColorManager.offwhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ));
  }
}
