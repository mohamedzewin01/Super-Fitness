import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness/core/resources/color_manager.dart';
import 'package:super_fitness/core/resources/values_manager.dart';

import '../../../../core/resources/app_constants.dart';
import '../../../../core/resources/assets_manager.dart';
import '../cubit/layout_cubit.dart';
import '../widgets/custom_button_navigation_bar.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => LayoutCubit(),
        child: const LayoutBody(),
      ),
    );
  }
}

class LayoutBody extends StatelessWidget {
  const LayoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
         // resizeToAvoidBottomInset: false,
          extendBody: true,
          body: Stack(
           // fit: StackFit.expand,
            children: [
              Positioned.fill(
                  child: Image.asset(AssetsManager.forgetPasswordBGImage,
                      fit: BoxFit.cover)),
              Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: AppConstants.blurConst12,
                        sigmaY: AppConstants.blurConst12),
                    child: Container(
                      color: Colors.black.withAlpha(AppConstants.blurConst50),
                    ),
                  )),
              AppConstants.viewOptions[cubit.index],
            ],
          ),

          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: BorderRadius.circular(AppSize.s20),
            ),
            padding: EdgeInsets.only(left: AppPadding.p10,right:AppPadding.p10,top:AppPadding.p10 ,bottom: AppPadding.p10 ),
            margin: EdgeInsets.symmetric(horizontal:AppPadding.p40,vertical: AppPadding.p20),
            child: CustomBottomNavigationBar(
              currentIndex: cubit.index,
              onItemTapped: (index) {
                cubit.changeIndex(index);
              },
            ),
          ),
        );
      },
    );
  }
}
