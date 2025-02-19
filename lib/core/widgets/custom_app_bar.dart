import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/style_manager.dart';


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
      padding: const EdgeInsets.only(top: 25, bottom: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: GestureDetector(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  AssetsManager.back,
                  fit: BoxFit.cover,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
          Center(
            child: isLogo?Image.asset(
              AssetsManager.logo,
              fit: BoxFit.cover,
              width: 70,
              height: 48,
            ): Text(
              title??'',
              style:
              getSemiBoldStyle(color: ColorManager.white, fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}