import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_fitness/core/di/di.dart';
import 'package:super_fitness/core/resources/color_manager.dart';
import 'package:super_fitness/core/resources/style_manager.dart';
import 'package:super_fitness/core/widgets/custom_dialog.dart';
import 'package:super_fitness/features/auth/presentation/pages/login_view.dart';
import '../../../../core/resources/assets_manager.dart';
import '../view_model/view_model_register/register_cubit.dart';
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
    viewModel = getIt<RegisterCubit>();
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
//               ),
//             ),
//             Scaffold(
//               backgroundColor: Colors.transparent,
//               body: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,

//                 //spacing: 16,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           // AppLocalizations.of(context)?.name ?? '',
//                           'Hey There',
//                           style: getMediumStyle(
//                               color: Colors.white, fontSize: 18),
//                         ),
//                         Text(
//                           // AppLocalizations.of(context)?.name ?? '',
//                           'create an account',
//                           style: getSemiBoldStyle(
//                               color: Colors.white, fontSize: 20),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                  child: SizedBox(),
                ),
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is SuccessRegisterState) {
                      Navigator.pop(context);
                      CustomDialog.showSuccessDialog(context, goto: LoginView());
                    }
                    if (state is LoadingRegisterState) {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: Colors.transparent,
                          content: Center(
                              child: CircularProgressIndicator(
                            color: ColorManager.orange,
                          )),
                        ),
                      );
                    }
                    if (state is ErrorRegisterState) {
                      Navigator.pop(context);
                      CustomDialog.showErrorDialog(context,
                          message: state.exception.toString());
                    }
                  },
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
                                          viewModel.pageController.previousPage(
                                              duration:
                                                  Duration(milliseconds: 1000),
                                              curve: Curves.easeIn);
                                          viewModel.changeIndicator(
                                              viewModel.currentIndicator - 1);
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
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                          // spacing: 16,
//                           children: [
//                             Text(
//                               // AppLocalizations.of(context)?.name ?? '',
//                               'Register',
//                               style: getSemiBoldStyle(
//                                   color: Colors.white, fontSize: 20),
//                             ),
//                             CustomTextFormField(
//                               controller: TextEditingController(),
//                               hintText: 'Email',
//                               prefixIcon: Icon(
//                                 Icons.mail,
//                                 color: ColorManager.placeHolderColor,
//                               ),
//                             ),
//                             CustomTextFormField(
//                               controller: TextEditingController(),
//                               hintText: 'Email',
//                               prefixIcon: Icon(
//                                 Icons.lock,
//                                 color: ColorManager.placeHolderColor,
//                               ),
//                               suffix: passwordHidden(
//                                 isPasswordHidden: true,
//                                 onPressed: () {},
//                               ),
//                             ),
//                           ],
                        SizedBox(
                          height: 6,
                        ),
                        Visibility(
                            visible: viewModel.currentIndicator != 0,
                            child:
                                CustomPercentIndicator(viewModel: viewModel)),
                        CustomRegisterPagesView(viewModel: viewModel),
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
