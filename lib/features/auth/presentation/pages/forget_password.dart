import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness/core/resources/color_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/di/di.dart';
import '../../../../core/functions/helper.dart';
import '../../../../core/utils/utilss.dart';
import '../../../../core/widgets/fitness_text_form_field.dart';
import '../../../../core/widgets/show_error_dialog.dart';
import '../../../../core/widgets/show_loading_dialog.dart';
import '../view_model/forget_password_view_model/forget_password_cubit.dart';
import '../view_model/forget_password_view_model/forget_password_state.dart';
import 'email_verification_view.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordScreenState();
}

late ForgetPasswordViewModel forgetPasswordViewModel;

class _ForgetPasswordScreenState extends State<ForgetPasswordView> {

  @override
  void initState() {
    forgetPasswordViewModel = getIt.get<ForgetPasswordViewModel>();
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
        create: (context) => forgetPasswordViewModel,
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
                                    AppLocalizations.of(context)!.enterYourEmail,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "BalooThambi400"),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    AppLocalizations.of(context)!.forgetPassword,
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
                                      const SizedBox(height: 24),
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
                                                    BorderRadius.circular(30),
                                                  ),
                                                  padding: const EdgeInsets.symmetric(
                                                      vertical: 16),
                                                ),
                                                child:Text(
                                                  AppLocalizations.of(context)!
                                                      .sendOTP,
                                                  style: const TextStyle(
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

  void forgetPassword() {
    String email = _emailController.text;
    forgetPasswordViewModel.doIntent(ForgetPasswordIntent(email));
  }
}
