import 'package:flutter/material.dart';
import '../resources/style_manager.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.buttonColor,
      required this.title,
      required this.onPressed,
      this.style,
      this.width});

  final Color buttonColor;
  final String title;
  final void Function() onPressed;
  final TextStyle? style;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.orange,
        minimumSize: Size(width ?? 31, 38),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s24)),
        ),
      ),
      child: Text(title,
          style: style ??
              getSemiBoldStyle(color: ColorManager.white, fontSize: 16)),
    );
  }
}
