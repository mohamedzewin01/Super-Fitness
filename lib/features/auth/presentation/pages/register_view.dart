
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/functions/helper.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Image.asset(
                  AssetsManager.backgroundOnboarding,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // AppLocalizations.of(context)?.name ?? '',
                          'Hey There',
                          style: getMediumStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          // AppLocalizations.of(context)?.name ?? '',
                          'create an account',
                          style: getSemiBoldStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // ShaderMask(
                      //   shaderCallback: (bounds) {
                      //     return RadialGradient(
                      //       // center: Alignment.center,
                      //       // radius: 0.5,
                      //       colors: [
                      //         Colors.transparent,
                      //         ColorManager.white.withAlpha(250),
                      //       ],
                      //
                      //       // stops: const [0.5, 1.0],
                      //     ).createShader(bounds);
                      //   },
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(30),
                      //       color: ColorManager.primary,
                      //     ),
                      //     height: 300,
                      //     width: double.infinity,
                      //
                      //   ),
                      // ),
                      Positioned.fill(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: ColorManager.primary.withOpacity(.6), // لون شفاف لتحسين الوضوح
                            ),

                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          spacing: 16,
                          children: [
                            Text(
                              // AppLocalizations.of(context)?.name ?? '',
                              'Register',
                              style: getSemiBoldStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            CustomTextFormField(
                              controller: TextEditingController(),
                              hintText: 'Email',
                              prefixIcon: Icon(
                                Icons.mail,
                                color: ColorManager.placeHolderColor,
                              ),
                            ),
                            CustomTextFormField(
                              controller: TextEditingController(),
                              hintText: 'Email',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: ColorManager.placeHolderColor,
                              ),
                              suffix: passwordHidden(
                                isPasswordHidden: true,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



