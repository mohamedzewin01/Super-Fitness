import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/functions/extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../view_model/verify_password_view_model/verify_password_cubit.dart';
class CustomFieldForOtpVerification extends StatefulWidget {
  const CustomFieldForOtpVerification({
    super.key,
    required List<TextEditingController> controllers,
    required this.viewModel,
    required bool isCodeInvalid,
    required this.index,
  })  : _controllers = controllers,
        _isCodeInvalid = isCodeInvalid;

  final List<TextEditingController> _controllers;
  final VerifyPasswordViewModel viewModel;
  final bool _isCodeInvalid;
  final int index;

  @override
  State<CustomFieldForOtpVerification> createState() => _CustomFieldForOtpVerificationState();
}

class _CustomFieldForOtpVerificationState extends State<CustomFieldForOtpVerification> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth / 7.4,
      height: context.screenWidth / 6,
      child: TextFormField(
        controller: widget._controllers[widget.index],
        onChanged: (value) {
          setState(() {});
          if (value.isNotEmpty) {
            if (value.length == 1 && widget.index < 5) {
              FocusScope.of(context).nextFocus();
            }
          } else if (value.isEmpty && widget.index > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
        keyboardType: const TextInputType.numberWithOptions(),
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: widget._controllers[widget.index].text.isNotEmpty
                  ? ColorManager.basicColor
                  : ColorManager.white,
              width: AppSize.w2,
            ),
          ),
          focusedBorder:UnderlineInputBorder (
            borderSide: BorderSide(
              color:  ColorManager.basicColor,
              width: AppSize.w2,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: AppPadding.p24,
          ),
        ),
        style: TextStyle(fontSize: FontSize.s20,color: ColorManager.basicColor),
      ),
    );
  }
}
