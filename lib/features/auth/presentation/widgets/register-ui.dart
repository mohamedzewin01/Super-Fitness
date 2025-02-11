



import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:super_fitness/core/resources/values_manager.dart';

import '../../../../core/functions/helper.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class RegisterUi extends StatelessWidget {
  const RegisterUi({super.key});

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
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: ColorManager.primary.withAlpha(220),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          spacing: 16,
                          children: [
                            Text(
                              // AppLocalizations.of(context)?.name ?? '',
                              'Register',
                              style: getSemiBoldStyle(
                                  color: Colors.white, fontSize: AppSize.s24),
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
