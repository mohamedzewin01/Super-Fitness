import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

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
        backgroundColor: buttonColor,
        minimumSize: const Size(double.infinity, AppSize.s48),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s24)),
        ),
      ),
      child: Text(
        title,
        style: style ??
            const TextStyle(
              color: ColorManager.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
