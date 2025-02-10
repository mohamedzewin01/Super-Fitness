import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:super_fitness/core/resources/assets_manager.dart';
import 'package:super_fitness/core/resources/color_manager.dart';
import 'package:super_fitness/core/resources/style_manager.dart';

import '../../../core/functions/helper.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child:Scaffold(body: Text(AppLocalizations.of(context)!.appName))  ,
      ),
    );
  }
}
