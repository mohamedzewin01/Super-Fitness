import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

String? validateNotEmpty(String? value, String messageEmpty,
    [String? length, String? format]) {
  if (value?.trim() == null || value!.trim().isEmpty) {
    return messageEmpty;
  } else if (value.length < 6) {
    return length;
  } else if (!RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$')
      .hasMatch(value)) {
    return format;
  }
  return null;
}

String? validateEmail({
  required String value,
  required String message,
  required String messageInvalid,
}) {
  final RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  if (value.trim().isEmpty) {
    return message;
  } else if (!emailRegExp.hasMatch(value)) {
    return messageInvalid;
  }
  return null;
}

String? validatePhone(String? value, String message, String messageLength,
    String messageStartWithZero) {
  if (value?.trim() == null || value!.trim().isEmpty) {
    return message;
  } else if (!RegExp(r'^01[0125][0-9]{8}$').hasMatch(value)) {
    return messageLength;
  }
  return null;
}

String? validatePasswordMatch({
  required String password,
  required String confirmPassword,
  required String message,
  String? messageIsEmpty,
}) {
  if (password.trim().isEmpty) {
    return messageIsEmpty;
  }
  if (password != confirmPassword) {
    return message;
  }
  return null;
}

void validationMethod({
  required GlobalKey<FormState> formKey,
  required Function(Color) updateButtonColor,
  required void Function() actionPress,
}) {
  if (formKey.currentState!.validate()) {
    actionPress();
    updateButtonColor(ColorManager.orange);
  } else {
    updateButtonColor(ColorManager.darkGrey);
  }
}

Widget passwordHidden({
  required bool isPasswordHidden,
  required void Function()? onPressed,
}) {
  return IconButton(
    icon: Icon(
      isPasswordHidden ? Icons.visibility_off : Icons.visibility,
    ),
    onPressed: onPressed,
  );
}

Widget buildIcon(String assetPath, int index, int currentIndex) {
  bool isSelected = index == currentIndex;

  return Container(
    padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20, vertical: AppPadding.p4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
    ),
    child: SvgPicture.asset(
      assetPath,
      width: 24,
      height: 24,
      colorFilter: ColorFilter.mode(
        isSelected ? ColorManager.orange : ColorManager.placeHolderColor,
        BlendMode.srcIn,
      ),
    ),
  );
}

String? validatePassword({
  required String password,
  required String message,
  required String messageLength,
  required String messageInvalid,
}) {
  final RegExp passwordRegExp =
      RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$');
  if (password.trim().isEmpty) {
    return message;
  } else if (password.length < 8) {
    return messageLength;
  } else if (!passwordRegExp.hasMatch(password)) {
    return messageInvalid;
  }
  return null;
}

String? validateString({
  required String value,
  required String message,
  required String messageLength,
  required String messageInvalid,
}) {
  final RegExp valueRegExp = RegExp(r'^[A-Za-z]+$');
  if (value.trim().isEmpty) {
    return message;
  } else if (value.length < 3) {
    return messageLength;
  } else if (!valueRegExp.hasMatch(value)) {
    return messageInvalid;
  }
  return null;
}
