import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:super_fitness/core/resources/assets_manager.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // درجة التشويش
            child: Image.asset(
              AssetsManager.backgroundOnboarding,
              fit: BoxFit.fill,

            ),
          ),
        ),

        Scaffold(
          backgroundColor: Colors.transparent,

         body: Text(AppLocalizations.of(context)?.name ?? ''),
        ),
      ],
    );
  }
}
