import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_fitness/core/functions/helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:super_fitness/core/resources/app_constants.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/utilss.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../../core/widgets/fitness_text_form_field.dart';
import '../../../../core/widgets/show_error_dialog.dart';
import '../../../../core/widgets/show_loading_dialog.dart';
import '../view_model/reset_password_view_model/reset_password_cubit.dart';
import '../view_model/reset_password_view_model/reset_password_state.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

late ResetPasswordViewModel _resetPasswordViewModel;

class _ResetPasswordViewState extends State<ResetPasswordView> {
  @override
  void initState() {
    _resetPasswordViewModel = getIt.get<ResetPasswordViewModel>();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  bool isButtonEnabled = false;

  void validateInputs() {
    isButtonEnabled = _formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final String editEmail =
        ModalRoute.of(context)?.settings.arguments as String;
    return BlocProvider(
        create: (context) => _resetPasswordViewModel,
        child: BlocListener<ResetPasswordViewModel, ResetPasswordState>(
          listenWhen: (previous, current) {
            if (current is LoadingResetPasswordState ||
                current is ErrorResetPasswordState ||
                current is SuccessResetPasswordState) {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            if (state is LoadingResetPasswordState) {
             // showLoadingDialog(context);
              CustomDialog.showLoadingDialog(context);
            } else if (state is ErrorResetPasswordState) {
              var message = extractErrorMessage(state.exception);
              Navigator.of(context).pop(); // Close loading dialog
              //showErrorDialog(context, message);
              CustomDialog.showErrorDialog(context,message: message);
            } else if (state is SuccessResetPasswordState) {
              Navigator.of(context).popUntil((route) =>
                  route.isFirst); // Close dialogs before showing success
              Navigator.pushNamed(context, RoutesManager.loginView);
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
                      child: Image.asset(AppConstants.forgetPasswordBGImage,
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
                  Padding(
                    padding: const EdgeInsets.only(
                        top: AppPadding.p60, bottom: AppPadding.p24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppConstants.appLogo,
                          height: AppSize.s80,
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
                                    AppLocalizations.of(context)!
                                        .makeSureItsOrMore,
                                    style: getMediumStyle(
                                      color: Colors.white,
                                      fontSize: FontSize.s20,
                                    ),
                                  ),
                                  const SizedBox(height: AppSize.s8),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .createNewPassword,
                                    style: getBoldStyle(
                                      color: Colors.white,
                                      fontSize: FontSize.s26,
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
                                    sigmaY: AppConstants.blurConst34,
                                    sigmaX: AppConstants.blurConst34),
                                child: Container(
                                  padding: const EdgeInsets.all(AppPadding.p24),
                                  decoration: BoxDecoration(
                                    color: Colors.white
                                        .withAlpha(AppConstants.blurConst20),
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s20),
                                  ),
                                  child: Column(
                                    children: [
                                      FitnessTextFormField(
                                        obscureText: true,
                                        prefixIcon: SvgPicture.asset(
                                            AppConstants.iconLock,
                                            width: AppSize.s20,
                                            height: AppSize.s20,
                                            fit: BoxFit.scaleDown),
                                        suffix: SvgPicture.asset(
                                            AppConstants.iconEye,
                                            width: AppSize.s20,
                                            height: AppSize.s20,
                                            fit: BoxFit.scaleDown),
                                        controller: _passwordController,
                                        hintText: AppLocalizations.of(context)!
                                            .password,
                                        validator: (value) => validatePassword(
                                            password: _passwordController.text,
                                            messageInvalid:
                                                AppLocalizations.of(context)!
                                                    .passwordInvalidFormat,
                                            messageLength:
                                                AppLocalizations.of(context)!
                                                    .passwordCharactersLong,
                                            message:
                                                AppLocalizations.of(context)!
                                                    .passwordNotMatch),
                                      ),
                                      SizedBox(height: AppSize.s24),
                                      FitnessTextFormField(
                                        obscureText: true,
                                        prefixIcon: SvgPicture.asset(
                                          AppConstants.iconLock,
                                          width: AppSize.s20,
                                          height: AppSize.s20,
                                          fit: BoxFit.scaleDown,
                                        ),
                                        suffix: SvgPicture.asset(
                                            AppConstants.iconEye,
                                            width: AppSize.s20,
                                            height: AppSize.s20,
                                            fit: BoxFit.scaleDown),
                                        controller: _rePasswordController,
                                        hintText: AppLocalizations.of(context)!
                                            .password,
                                        validator: (value) =>
                                            validatePasswordMatch(
                                                messageIsEmpty:
                                                    AppLocalizations.of(
                                                            context)!
                                                        .passwordIsEmpty,
                                                password:
                                                    _passwordController.text,
                                                confirmPassword:
                                                    _rePasswordController.text,
                                                message: AppLocalizations.of(
                                                        context)!
                                                    .passwordNotMatch),
                                      ),
                                      const SizedBox(height: AppSize.s24),
                                      BlocBuilder<ResetPasswordViewModel,
                                          ResetPasswordState>(
                                        builder: (context, state) {
                                          if (state
                                              is LoadingResetPasswordState) {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          } else {
                                            return SizedBox(
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  if (isButtonEnabled == true) {
                                                    resetPassword(editEmail);
                                                  }
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      ColorManager.basicColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            AppSize.s30),
                                                  ),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: AppPadding.p16),
                                                ),
                                                child: Text(
                                                  AppLocalizations.of(context)!
                                                      .done,
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

  void resetPassword(String email) {
    String password = _passwordController.text;

    _resetPasswordViewModel.doIntent(ResetPasswordIntent(email, password));
  }
}
