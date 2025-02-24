import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/routes_manager.dart';
import '../../../core/widgets/custom_elevated_button.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController nextPage = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": AssetsManager.onBoardingImage1,
      "title": "The Price Of Excellence\nIs Discipline",
      "description":
          "Excellence is earned through discipline—choosing hard work and focus every day. Without it, talent fades and dreams stay distant."
    },
    {
      "image": AssetsManager.onBoardingImage2,
      "title": "Fitness Has Never Been So \n Much Fun",
      "description":
          "Fitness turns into fun when you enjoy the journey—making every workout an adventure and every effort a step toward progress."
    },
    {
      "image": AssetsManager.onBoardingImage3,
      "title": "NO MORE EXCUSES \nDo It Now",
      "description":
          "Enough excuses—start now. Every moment you wait is a moment wasted. Take action today and build the future you deserve."
    },
  ];

  Widget dotPageView() {
    return SmoothPageIndicator(
      onDotClicked: (index) {
        nextPage.animateToPage(
          index,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
        );
      },
      controller: nextPage,
      count: onboardingData.length,
      effect: WormEffect(
        dotHeight: 8,
        dotWidth: 8,
        activeDotColor: ColorManager.mainColor,
        dotColor: ColorManager.offWhite,
        spacing: 8,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              AssetsManager.onBoardingBackGround,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            PageView(
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              controller: nextPage,
              children: onboardingData
                  .map(
                    (data) => Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 17, top: 40),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.pushNamed(
                                //     context, RoutesManager.profileView);

                                Navigator.pushNamed(
                                    context, RoutesManager.loginView);
                              },
                              child: Text(
                                "Skip",
                                style: GoogleFonts.balooThambi2(
                                  color: ColorManager.offWhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 17),
                          child: Image.asset(
                            data["image"]!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    padding:
                        const EdgeInsets.only(top: 30, left: 16, right: 16),
                    decoration: BoxDecoration(
                      // color: Colors.white.withValues(alpha: .08),
                    ),
                    child: Column(
                      children: [
                        Text(
                          onboardingData[currentPage]["title"]!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.balooThambi2(
                            color: ColorManager.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          onboardingData[currentPage]["description"]!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.balooThambi2(
                            color: ColorManager.offWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 24),
                        dotPageView(),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// زر الرجوع "Back"
                            if (currentPage > 0)
                              ElevatedButton(
                                onPressed: () {
                                  nextPage.previousPage(
                                    duration: const Duration(milliseconds: 600),
                                    curve: Curves.easeIn,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  side:
                                      BorderSide(color: ColorManager.mainColor),
                                  minimumSize: const Size(31, 48),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24)),
                                  ),
                                ),
                                child: Text(
                                  "Back",
                                  style: GoogleFonts.balooThambi2(
                                    color: ColorManager.offWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            if (currentPage == 0)
                              Expanded(
                                child: CustomElevatedButton(
                                  buttonColor: ColorManager.mainColor,
                                  title: "Next",
                                  style: GoogleFonts.balooThambi2(
                                    color: ColorManager.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  onPressed: () {
                                    nextPage.nextPage(
                                      duration:
                                          const Duration(milliseconds: 600),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                ),
                              )
                            else
                              CustomElevatedButton(
                                buttonColor: ColorManager.mainColor,
                                title: currentPage == onboardingData.length - 1
                                    ? "Do IT"
                                    : "Next",
                                style: GoogleFonts.balooThambi2(
                                  color: ColorManager.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                ),
                                onPressed: () {
                                  if (currentPage ==
                                      onboardingData.length - 1) {
                                    Navigator.pushNamed(
                                        context, RoutesManager.loginView);
                                  } else {
                                    nextPage.nextPage(
                                      duration:
                                          const Duration(milliseconds: 600),
                                      curve: Curves.easeIn,
                                    );
                                  }
                                },
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}
