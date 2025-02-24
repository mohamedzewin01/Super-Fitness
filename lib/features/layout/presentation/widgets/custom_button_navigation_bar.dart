import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import '../../../../core/functions/helper.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  final int currentIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 24,
      backgroundColor: ColorManager.primary,
      items: [
        BottomNavigationBarItem(
          icon: buildIcon(AssetsManager.home, 0, currentIndex),
          label: AppLocalizations.of(context)!.home,
        ),
        BottomNavigationBarItem(
          icon: buildIcon(AssetsManager.chatAi, 1, currentIndex),
          label: AppLocalizations.of(context)!.chatAi,
        ),
        BottomNavigationBarItem(
          icon: buildIcon(AssetsManager.gym, 2, currentIndex),
          label: AppLocalizations.of(context)!.gym,
        ),
        BottomNavigationBarItem(
          icon: buildIcon(AssetsManager.profile, 3, currentIndex),
          label: AppLocalizations.of(context)!.profile,
        ),
      ],
      selectedFontSize: AppSize.s12,
      unselectedItemColor: Colors.transparent,
      selectedLabelStyle: getLightStyle(color: ColorManager.basicColor),
      unselectedLabelStyle: getMediumStyle(color: Colors.transparent),
      currentIndex: currentIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorManager.basicColor,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      elevation: 0,
    );
  }
}
