import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness/core/resources/app_constants.dart';
import 'package:super_fitness/core/resources/color_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:super_fitness/core/resources/values_manager.dart';
import '../../../../core/di/di.dart';
import '../../../../core/functions/helper.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/utils/utilss.dart';
import '../../../../core/widgets/fitness_text_form_field.dart';
import '../../../../core/widgets/show_error_dialog.dart';
import '../../../../core/widgets/show_loading_dialog.dart';
import '../view_model/forget_password_view_model/forget_password_cubit.dart';
import '../view_model/forget_password_view_model/forget_password_state.dart';
import 'email_verification_view.dart';
import 'package:super_fitness/core/resources/style_manager.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordScreenState();
}

late ForgetPasswordViewModel _forgetPasswordViewModel;

class _ForgetPasswordScreenState extends State<ForgetPasswordView> {

  @override
  void initState() {
    _forgetPasswordViewModel = getIt.get<ForgetPasswordViewModel>();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  bool isButtonEnabled = false;

  void validateInputs() {
    isButtonEnabled = _formKey.currentState?.validate() ?? false;
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _forgetPasswordViewModel,
        child: BlocListener<ForgetPasswordViewModel, ForgetPasswordState>(
          listenWhen: (previous, current) {
            if (current is LoadingForgetPasswordState ||
                current is ErrorForgetPasswordState ||
                current is SuccessForgetPasswordState) {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            if (state is LoadingForgetPasswordState) {
              showLoadingDialog(context);
            } else if (state is ErrorForgetPasswordState) {
              var message = extractErrorMessage(state.exception);
              Navigator.of(context).pop(); // Close loading dialog
              showErrorDialog(context, message);
            } else if (state is SuccessForgetPasswordState) {
              final email = _emailController.text;
              Navigator.of(context).popUntil((route) =>
                  route.isFirst); // Close dialogs before showing success
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OtpVerificationPage(),
                      settings: RouteSettings(arguments: email)));
            }
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
              key: _formKey,
              onChanged: validateInputs,
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Image.asset(
                         AppConstants.forgetPasswordBGImage,
                          fit: BoxFit.cover)),
                  Positioned.fill(
                      child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: AppConstants.blurConst12, sigmaY: AppConstants.blurConst12),
                    child: Container(
                      color: Colors.black.withAlpha(AppConstants.blurConst50),
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 60, bottom: 24),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppConstants.appLogo,
                          height:AppSize.s80,
                        ),
                        SizedBox(
                          height: AppSize.s120,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(AppPadding.p16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: AppSize.s16),
                                  Text(
                                    AppLocalizations.of(context)!.enterYourEmail,
                                    style: getMediumStyle(
                                        color: Colors.white,
                                        fontSize: FontSize.s20,
                                    ),
                                  ),

                                  const SizedBox(height:AppSize.s8),
                                  Text(
                                    AppLocalizations.of(context)!.forgetPassword,
                                    style: getBoldStyle(
                                    color: Colors.white,
                                    fontSize: AppSize.s26,
                                  ),
                                  ),
                                  const SizedBox(height: AppSize.s16),
                                ],
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(AppSize.s60),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaY: AppConstants.blurConst34, sigmaX: AppConstants.blurConst34),
                                child: Container(
                                  padding: const EdgeInsets.all(AppPadding.p24),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withAlpha(AppConstants.blurConst20),
                                    borderRadius: BorderRadius.circular(AppSize.s20),
                                  ),
                                  child: Column(
                                    children: [
                                      FitnessTextFormField(
                                        prefixIcon: Icon(Icons.email_outlined),
                                        controller: _emailController,
                                        hintText:
                                            AppLocalizations.of(context)!.email,
                                        validator: (value) => validateEmail(
                                          value: value!,
                                          message: AppLocalizations.of(context)!
                                              .emailIsEmpty,
                                          messageInvalid:
                                              AppLocalizations.of(context)!
                                                  .enterValidEmail,
                                        ),
                                      ),
                                      const SizedBox(height: AppSize.s24),
                                      BlocBuilder<ForgetPasswordViewModel, ForgetPasswordState>(
                                        builder: (context, state) {
                                          if (state is LoadingForgetPasswordState) {
                                            return const Center(
                                                child: CircularProgressIndicator());
                                          } else {
                                            return SizedBox(
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  if (isButtonEnabled == true) {
                                                    forgetPassword();
                                                  }
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                  ColorManager.basicColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(AppSize.s30),
                                                  ),
                                                  padding: const EdgeInsets.symmetric(
                                                      vertical:AppPadding.p16),
                                                ),
                                                child:Text(
                                                  AppLocalizations.of(context)!
                                                      .sendOTP,
                                                  style: getBoldStyle(
                                                    color: Colors.white,
                                                    fontSize: FontSize.s14,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void forgetPassword() {
    String email = _emailController.text;
    _forgetPasswordViewModel.doIntent(ForgetPasswordIntent(email));
  }
}
