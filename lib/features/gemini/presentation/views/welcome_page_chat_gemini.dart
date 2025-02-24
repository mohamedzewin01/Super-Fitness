import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_fitness/core/resources/assets_manager.dart';
import 'package:super_fitness/core/resources/color_manager.dart';
import 'package:super_fitness/core/resources/routes_manager.dart';
import 'package:super_fitness/core/widgets/custom_elevated_button.dart';

class WelcomePageChatGemini extends StatefulWidget {
  const WelcomePageChatGemini({super.key});

  @override
  State<WelcomePageChatGemini> createState() => _WelcomePageChatGeminiState();
}

class _WelcomePageChatGeminiState extends State<WelcomePageChatGemini> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPortrait = size.height > size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(AssetsManager.back),
                      Align(
                        alignment: Alignment.center,
                        child: Text.rich(
                          TextSpan(
                            text: "Hi Ahmed ,\n",
                            style: GoogleFonts.balooThambi2(
                              color: ColorManager.offwhite,
                              fontSize: isPortrait ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: "I Am Your Smart Coach",
                                style: GoogleFonts.balooThambi2(
                                  color: ColorManager.white,
                                  fontSize: isPortrait ? 18 : 14,
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
                    height:
                        isPortrait ? size.height * 0.1 : size.height * 0.05),
                Image.asset(
                  AssetsManager.robotGemini,
                  fit: BoxFit.contain,
                  height: isPortrait ? size.height * 0.4 : size.height * 0.3,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 42),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(40),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                    child: Container(
                      height: isPortrait ? 200 : 150,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 30),
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
                              fontSize: isPortrait ? 24 : 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 24),
                          CustomElevatedButton(
                            width: double.infinity,
                            buttonColor: ColorManager.mainColor,
                            title: "Get Started",
                            style: GoogleFonts.balooThambi2(
                              color: ColorManager.white,
                              fontSize: isPortrait ? 16 : 12,
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
        ),
      ),
    );
  }
}
