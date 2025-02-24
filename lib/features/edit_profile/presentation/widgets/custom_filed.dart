import 'package:flutter/material.dart';
import 'package:super_fitness/core/resources/values_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class CustomFiled extends StatelessWidget {
  const CustomFiled({
    super.key,
    required this.text,
    required this.title,
    this.onTap,
  });

  final String text;
  final String title;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '$title (',
              style: getBoldStyle(color: ColorManager.white, fontSize: AppSize.s14),
            ),
            GestureDetector(
                onTap: onTap,
                child: Text(
                  AppLocalizations.of(context)!.tapToEdit,
                  style: getBoldStyle(color: ColorManager.orange, fontSize:  AppSize.s14),
                )),
            Text(
              ')',
              style: getBoldStyle(color: ColorManager.white, fontSize:  AppSize.s14),
            ),
          ],
        ),
        SizedBox(
          height:  AppSize.s8,
        ),
        Container(
          height:  AppSize.s40,
          padding: EdgeInsets.symmetric(
            horizontal:  AppSize.s16,
          ),
          decoration: BoxDecoration(
              color: ColorManager.white.withAlpha( AppSizeInt.s50),
              borderRadius: BorderRadius.circular(AppSize.s25),
              border: Border.all(
                  color: ColorManager.placeHolderColor.withAlpha(AppSizeInt.s150),
                  width: AppSize.w1_5)),
          child: Align(
            alignment:AlignmentDirectional.centerStart,
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: getBoldStyle(color: ColorManager.white),
            ),
          ),
        ),
      ],
    );
  }
}