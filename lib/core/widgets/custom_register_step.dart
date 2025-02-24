import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/style_manager.dart';
import 'custom_elevated_button.dart';


class CustomRegisterStep extends StatelessWidget {
  const CustomRegisterStep(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.isNotShowButton,
      required this.onPressed,
      required this.bodyScreen,
      required this.titleButton

      });

  final String title;
  final String titleButton;
  final String subTitle;
  final bool isNotShowButton;
  final void Function() onPressed;
  final Widget bodyScreen;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    style: getSemiBoldStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    subTitle,
                    style: getMediumStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // spacing: 16,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  // color: ColorManager.white.withValues(alpha: 0.11),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    // spacing: 16,
                    children: [
                      bodyScreen,
                      isNotShowButton
                          ? SizedBox()
                          : Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 16, top: 16),
                                    child: CustomElevatedButton(
                                        buttonColor: ColorManager.orange,
                                        title: titleButton,
                                        onPressed: onPressed),
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
