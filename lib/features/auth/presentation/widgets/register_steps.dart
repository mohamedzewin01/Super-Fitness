import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:super_fitness/core/widgets/custom_elevated_button.dart';
import 'package:super_fitness/features/auth/presentation/widgets/custom_step_five.dart';
import 'package:super_fitness/features/auth/presentation/widgets/custom_step_four.dart';
import 'package:super_fitness/features/auth/presentation/widgets/custom_step_one.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../view_model/view_model_cubit.dart';
import 'custom_percent_indicator.dart';
import 'custom_register_step.dart';
import 'custom_step_three.dart';
import 'custom_step_two.dart';

class RegisterSteps extends StatefulWidget {
  const RegisterSteps({super.key});

  @override
  State<RegisterSteps> createState() => _RegisterStepsState();
}

class _RegisterStepsState extends State<RegisterSteps> {
  final PageController _controller = PageController(initialPage: 0);

  late ViewModelCubit viewModel;

  @override
  void initState() {
    viewModel = ViewModelCubit();
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
                BlocConsumer<ViewModelCubit, ViewModelState>(
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
                                viewModel.currentIndicator == 0
                                    ? Container()
                                    : GestureDetector(
                                        onTap: () {
                                          _controller.previousPage(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.easeIn);
                                          setState(() {
                                            viewModel.currentIndicator--;
                                          });
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
                        CustomPercentIndicator(viewModel: viewModel),
                        SizedBox(
                          height: 6,
                        ),
                        Expanded(
                          child: PageView(
                            controller: _controller,
                            children: [
                              CustomRegisterStep(
                                  title: 'TELL US ABOUT YOURSELF',
                                  subTitle: 'We Need To Know Your Gender',
                                  viewModel: viewModel,
                                  bodyScreen: CustomStepOne(
                                    viewModel: viewModel,
                                  ),
                                  onPressed: () {
                                    _controller.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeIn);
                                    viewModel.changeIndicator(2);
                                    log(viewModel.currentIndicator.toString());
                                  }),
                              CustomRegisterStep(
                                  title: 'How Old Are you ?',
                                  subTitle:
                                      'this helps us create Your personalized plan',
                                  viewModel: viewModel,
                                  bodyScreen: CustomStepTwo(
                                    viewModel: viewModel,
                                  ),
                                  onPressed: () {
                                    _controller.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeIn);
                                    viewModel.changeIndicator(3);

                                    log(viewModel.currentIndicator.toString());
                                  }),
                              CustomRegisterStep(
                                title: 'How Old Are you ?',
                                subTitle:
                                    'this helps us create Your personalized plan',
                                viewModel: viewModel,
                                bodyScreen: CustomStepThree(
                                  viewModel: viewModel,
                                ),
                                onPressed: () {
                                  _controller.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeIn);
                                  viewModel.changeIndicator(4);
                                  log(viewModel.currentIndicator.toString());
                                },
                              ),
                              CustomRegisterStep(
                                title: 'How Old Are you ?',
                                subTitle:
                                    'this helps us create Your personalized plan',
                                viewModel: viewModel,
                                bodyScreen: CustomStepFour(
                                  viewModel: viewModel,
                                ),
                                onPressed: () {
                                  _controller.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeIn);
                                  viewModel.changeIndicator(5);
                                  log(viewModel.currentIndicator.toString());
                                },
                              ),
                              CustomRegisterStep(
                                title: 'How Old Are you ?',
                                subTitle:
                                    'this helps us create Your personalized plan',
                                viewModel: viewModel,
                                bodyScreen: CustomStepFive(
                                  viewModel: viewModel,
                                ),
                                onPressed: () {
                                  _controller.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeIn);
                                  viewModel.changeIndicator(6);
                                  log(viewModel.currentIndicator.toString());
                                },
                              ),
                            ],
                          ),
                        ),
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
