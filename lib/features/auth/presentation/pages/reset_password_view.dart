
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_fitness/core/functions/helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/utilss.dart';
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
late ResetPasswordViewModel resetPasswordViewModel;

class _ResetPasswordViewState extends State<ResetPasswordView> {

  @override
  void initState() {
    resetPasswordViewModel = getIt.get<ResetPasswordViewModel>();
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
        create: (context) => resetPasswordViewModel,
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
              showLoadingDialog(context);
            } else if (state is ErrorResetPasswordState) {
              var message = extractErrorMessage(state.exception);
              Navigator.of(context).pop(); // Close loading dialog
              showErrorDialog(context, message);
            } else if (state is SuccessResetPasswordState) {
              Navigator.of(context).popUntil((route) =>
              route.isFirst); // Close dialogs before showing success
              Navigator.pushNamed(context, RoutesManager.forgetPasswordView);
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
                          "assets/images/background_forget_password.png",
                          fit: BoxFit.cover)),
                  Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 12.5, sigmaY: 12.5),
                        child: Container(
                          color: Colors.black.withAlpha(50),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 60, bottom: 24, left: 0, right: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo_icon.png',
                          height: 80,
                        ),
                        SizedBox(
                          height: 120,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16),
                                  Text(
                                    AppLocalizations.of(context)!.makeSureItsOrMore,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "BalooThambi400"),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    AppLocalizations.of(context)!.createNewPassword,
                                    style: const TextStyle(
                                        fontSize: 26,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "BalooThambi800"),
                                  ),
                                  const SizedBox(height: 16),
                                ],
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaY: 34.5, sigmaX: 34.5),
                                child: Container(
                                  padding: const EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withAlpha(20),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    children: [
                                      FitnessTextFormField(
                                        obscureText: true,
                                       prefixIcon:  SvgPicture.asset("assets/images/locked.svg",width: 20,height: 20,fit: BoxFit.scaleDown),
                                        suffix: SvgPicture.asset("assets/images/eye.svg",width: 20,height: 20,fit: BoxFit.scaleDown),
                                        controller: _passwordController,
                                        hintText:
                                        AppLocalizations.of(context)!.password,
                                        validator:(value) => validatePassword(
                                            password: _passwordController.text,
                                            messageInvalid:
                                            AppLocalizations.of(context)!
                                                .passwordInvalidFormat,
                                            messageLength: AppLocalizations.of(context)!
                                                .passwordCharactersLong,
                                            message: AppLocalizations.of(context)!
                                                .passwordNotMatch),
                                      ),
                                      SizedBox(height: AppSize.s24),
                                      FitnessTextFormField(
                                        obscureText: true,
                                        prefixIcon:  SvgPicture.asset("assets/images/locked.svg",width: 20,height: 20,fit: BoxFit.scaleDown,),
                                        suffix: SvgPicture.asset("assets/images/eye.svg",width: 20,height: 20,fit: BoxFit.scaleDown),
                                        controller: _rePasswordController,
                                        hintText:
                                        AppLocalizations.of(context)!.password,
                                        validator:(value) => validatePasswordMatch(
                                            messageIsEmpty:
                                            AppLocalizations.of(context)!
                                                .passwordIsEmpty,
                                            password: _passwordController.text,
                                            confirmPassword: _rePasswordController.text,
                                            message: AppLocalizations.of(context)!
                                                .passwordNotMatch),
                                      ),
                                      const SizedBox(height: 24),
                                      BlocBuilder<ResetPasswordViewModel, ResetPasswordState>(
                                        builder: (context, state) {
                                          if (state is LoadingResetPasswordState) {
                                            return const Center(
                                                child: CircularProgressIndicator());
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
                                                    BorderRadius.circular(30),
                                                  ),
                                                  padding: const EdgeInsets.symmetric(
                                                      vertical: 16),
                                                ),
                                                child:Text(
                                                  AppLocalizations.of(context)!
                                                      .done,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: ColorManager.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: "BalooThambi800"),
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

    resetPasswordViewModel.doIntent(ResetPasswordIntent(email, password));
  }
}


