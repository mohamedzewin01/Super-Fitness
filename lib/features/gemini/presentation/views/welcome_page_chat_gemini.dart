import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_fitness/core/resources/assets_manager.dart';
import 'package:super_fitness/core/resources/color_manager.dart';
import 'package:super_fitness/core/resources/routes_manager.dart';
import 'package:super_fitness/core/utils/cashed_data_shared_preferences.dart';
import 'package:super_fitness/core/widgets/custom_elevated_button.dart';

class WelcomePageChatGemini extends StatefulWidget {
  const WelcomePageChatGemini({super.key});

  @override
  State<WelcomePageChatGemini> createState() => _WelcomePageChatGeminiState();
}

class _WelcomePageChatGeminiState extends State<WelcomePageChatGemini> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            final size = MediaQuery.of(context).size;
            final isPortrait = size.height > size.width;

            return Stack(
              children: [
                Image.asset(
                  AssetsManager.backgroundGeminiWelcome,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: constraints.maxWidth * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(AssetsManager.back),
                          Align(
                            alignment: Alignment.center,
                            child: Text.rich(
                              TextSpan(
                                text:
                                    "Hi ${CacheService.getData(key: CacheConstants.userFirstName)} ,\n",
                                style: GoogleFonts.balooThambi2(
                                  color: ColorManager.offWhite,
                                  fontSize: isPortrait
                                      ? constraints.maxWidth * 0.04
                                      : constraints.maxWidth * 0.03,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: [
                                  TextSpan(
                                    text: "I Am Your Smart Coach",
                                    style: GoogleFonts.balooThambi2(
                                      color: ColorManager.white,
                                      fontSize: isPortrait
                                          ? constraints.maxWidth * 0.045
                                          : constraints.maxWidth * 0.035,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SvgPicture.asset(AssetsManager.vector),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: isPortrait
                            ? constraints.maxHeight * 0.1
                            : constraints.maxHeight * 0.05),
                    Image.asset(
                      AssetsManager.robotGemini,
                      fit: BoxFit.contain,
                      height: isPortrait
                          ? constraints.maxHeight * 0.4
                          : constraints.maxHeight * 0.3,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: constraints.maxHeight * 0.05),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(constraints.maxWidth * 0.1),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                        child: Container(
                          height: isPortrait
                              ? constraints.maxHeight * 0.25
                              : constraints.maxHeight * 0.2,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth * 0.04,
                              vertical: constraints.maxHeight * 0.04),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.04),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "How Can I Assist You \nToday? ",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.balooThambi2(
                                  color: ColorManager.white,
                                  fontSize: isPortrait
                                      ? constraints.maxWidth * 0.06
                                      : constraints.maxWidth * 0.045,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: constraints.maxHeight * 0.02),
                              CustomElevatedButton(
                                height: 37,
                                width: double.infinity,
                                buttonColor: ColorManager.mainColor,
                                title: "Get Started",
                                style: GoogleFonts.balooThambi2(
                                  color: ColorManager.white,
                                  fontSize: isPortrait
                                      ? constraints.maxWidth * 0.04
                                      : constraints.maxWidth * 0.03,
                                  fontWeight: FontWeight.w800,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RoutesManager.geminiChatPage);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
