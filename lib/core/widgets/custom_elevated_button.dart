import 'package:flutter/material.dart';
import 'package:super_fitness/core/resources/style_manager.dart';
import '../resources/color_manager.dart';

import '../resources/font_manager.dart';
import '../resources/values_manager.dart';
import 'package:google_fonts/google_fonts.dart';



class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.buttonColor,
    required this.title,
    required this.onPressed,
    this.style,
  });

  final Color buttonColor;
  final String title;
  final void Function() onPressed;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.orange,
        minimumSize: const Size(31, 38),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s24)),
        ),
      ),
      child: Text(
        title,
        style: GoogleFonts.balooThambi2(
          color: ColorManager.white,
          fontSize: FontSize.s16,
          fontWeight: FontWeightManager.bold,
        ),
      ),
      child: Text(title,
          style: style ??
              getSemiBoldStyle(color: ColorManager.white, fontSize: 16)),
    );
  }
}
