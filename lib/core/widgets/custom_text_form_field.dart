import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';

import '../resources/style_manager.dart';
import '../resources/theme_manager.dart';
import '../resources/values_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.obscureText,
    this.validator,
    this.suffix,
    this.keyboardType,
    this.enabled,
    this.prefixIcon,
    this.initialValue,
    this.onChanged,
  });

  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final bool? obscureText;
  final bool? enabled;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorManager.placeHolderColor,
      style: const TextStyle(color: ColorManager.placeHolderColor),
      initialValue: initialValue,
      readOnly: enabled ?? false,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconColor: ColorManager.placeHolderColor,
        suffixIcon: suffix != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  suffix!,
                ],
              )
            : null,
        suffixIconColor: ColorManager.placeHolderColor,
        labelText: labelText,
        labelStyle: getRegularStyle(
          color: ColorManager.placeHolderColor,
          fontSize: FontSize.s16,
        ),
        hintText: hintText,
        hintStyle: getRegularStyle(
          color: ColorManager.placeHolderColor,
          fontSize: FontSize.s14,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.all(AppPadding.p18),
        enabledBorder: outLintInputBorderMethod(
          const BorderSide(color: ColorManager.placeHolderColor, width: AppSize.w1_5),
          const BorderRadius.all(Radius.circular(AppSize.s20)),
        ),
        focusedBorder: outLintInputBorderMethod(
          const BorderSide(color: ColorManager.orange, width: AppSize.w1_5),
          const BorderRadius.all(Radius.circular(AppSize.s20)),
        ),
        errorBorder: outLintInputBorderMethod(
          const BorderSide(color: ColorManager.error, width: AppSize.w1_5),
          const BorderRadius.all(Radius.circular(AppSize.s20)),
        ),
        focusedErrorBorder: outLintInputBorderMethod(
          const BorderSide(color: ColorManager.error, width: AppSize.w1_5),
          const BorderRadius.all(Radius.circular(AppSize.s20)),
        ),
        disabledBorder: outLintInputBorderMethod(
          const BorderSide(color: ColorManager.placeHolderColor, width: AppSize.w1_5),
          const BorderRadius.all(Radius.circular(AppSize.s20)),
        ),
      ),
      obscureText: obscureText ?? false,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
