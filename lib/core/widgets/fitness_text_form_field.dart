import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';

import '../resources/style_manager.dart';
import '../resources/values_manager.dart';

class FitnessTextFormField extends StatefulWidget {
  const FitnessTextFormField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.obscureText =false,
    this.validator,
    this.suffix,
    this.keyboardType,
    this.enabled,
    this.prefixIcon,
    this.initialValue,
    this.onChanged,
    this.onSuffixTap
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
  final VoidCallback? onSuffixTap;



  @override
  State<FitnessTextFormField> createState() => _FitnessTextFormFieldState();
}


class _FitnessTextFormFieldState extends State<FitnessTextFormField> {
 late bool _isObscure;
  @override
  void initState() {
    super.initState();
    _isObscure=widget.obscureText!;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorManager.fieldTextBorder,
      style: const TextStyle(color: ColorManager.fieldTextBorder),
      initialValue: widget.initialValue,
      readOnly: widget.enabled ?? false,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        prefixIconColor: ColorManager.fieldTextBorder,
        suffixIcon: widget.suffix!=null
        ?GestureDetector(
          onTap: (){
            setState(() {
              _isObscure=!_isObscure;
            });
            if(widget.onSuffixTap!=null){
              widget.onSuffixTap!();
            }
          },
          child: widget.suffix!,
        ):null,
        suffixIconColor: ColorManager.fieldTextBorder,
        labelText: widget.labelText,
        labelStyle: getRegularStyle(
          color: ColorManager.fieldTextBorder,
          fontSize: FontSize.s16,
        ),
        hintText: widget.hintText,
        hintStyle: getRegularStyle(
          color: ColorManager.fieldTextBorder,
          fontSize: FontSize.s12,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: ColorManager.fieldTextBorder,width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: ColorManager.fieldTextBorder,width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: ColorManager.fieldTextBorder,width: 1),
        ),
        focusedErrorBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: ColorManager.fieldTextBorder,width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: ColorManager.fieldTextBorder,width: 1),
        ),
      ),
      obscureText: _isObscure,
      validator: widget.validator,
      onChanged: widget.onChanged,
    );
  }
}
