import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/style_manager.dart';
import '../resources/values_manager.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key, this.onTap, required this.isLogo, this.title,
  });
  final void Function()? onTap;
  final bool isLogo;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.s25, bottom: AppSize.s16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment:AlignmentDirectional.bottomStart,
            child: GestureDetector(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(AppSize.s8),
                child: SvgPicture.asset(
                  AssetsManager.back,
                  fit: BoxFit.cover,
                  width: AppSize.s24,
                  height: AppSize.s24,
                ),
              ),
            ),
          ),
          Center(
            child: isLogo?Image.asset(
              AssetsManager.logo,
              fit: BoxFit.cover,
              width: AppSize.s70,
              height: AppSize.s48,
            ): Text(
              title??'',
              style:
              getSemiBoldStyle(color: ColorManager.white, fontSize: AppSize.s25),
            ),
          ),
        ],
      ),
    );
  }
}