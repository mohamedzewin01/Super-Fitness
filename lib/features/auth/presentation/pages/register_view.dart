
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/assets_manager.dart';
import '../view_model/register_cubit.dart';
import '../widgets/custom_percent_indicator.dart';
import '../widgets/custom_register_pages_view_body.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late RegisterCubit viewModel;

  @override
  void initState() {
    viewModel = RegisterCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Image.asset(
                  AssetsManager.backgroundRegister,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                  child: SizedBox(),
                ),
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Column(
                      spacing: 16,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 16),
                          child: Align(
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                viewModel.currentIndicator == 0||  viewModel.currentIndicator==1
                                    ? Container()
                                    : GestureDetector(
                                        onTap: () {
                                          viewModel.pageController.previousPage(
                                              duration:
                                                  Duration(milliseconds: 1000),
                                              curve: Curves.easeIn);
                                          viewModel.changeIndicator(viewModel.currentIndicator-1);
                                        },
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
                                Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    AssetsManager.logo,
                                    fit: BoxFit.cover,
                                    width: 70,
                                    height: 48,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Visibility(
                          visible: viewModel.currentIndicator != 0,
                            child: CustomPercentIndicator(viewModel: viewModel)),
                        SizedBox(
                          height: 6,
                        ),
                        CustomRegisterPagesView( viewModel: viewModel),
                        // RegisterForm(viewModel: viewModel),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


