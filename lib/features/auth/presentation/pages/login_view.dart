import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/di/di.dart';
import '../../../../core/functions/helper.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/utils/utilss.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/show_error_dialog.dart';
import '../../../../core/widgets/show_loading_dialog.dart';
import '../view_model/login_view_model/login_cubit.dart';
import '../view_model/login_view_model/login_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late LoginViewModel viewModel;

  bool isSecure = false;

  @override
  void initState() {
    viewModel = getIt.get<LoginViewModel>();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/login_background.png")),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocListener<LoginViewModel, LoginState>(
            listener: (context, state) {
              if (state is LoadingLoginState) {
                showLoadingDialog(context);
              } else if (state is SuccessLoginState) {
                Navigator.pushNamed(context, RoutesManager.layOutView);
              } else if (state is ErrorLoginState) {
                var message = extractErrorMessage(state.exception);
                Navigator.of(context).pop();
                showErrorDialog(context, message);
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Center(child: Image.asset("assets/images/icon.png")),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    AppLocalizations.of(context)!.helloWorld,
                    style: GoogleFonts.balooThambi2(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    AppLocalizations.of(context)!.welcomeBack,
                    style: GoogleFonts.balooThambi2(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                    child: Form(
                      key: _formKey,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                AppLocalizations.of(context)!.login,
                                style: GoogleFonts.balooThambi2(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomTextFormField(
                              controller: emailController,
                              prefixIcon: Icon(Icons.mail_outline_rounded),
                              hintText: AppLocalizations.of(context)!.email,
                              keyboardType: TextInputType.text,
                              validator: (value) => validateNotEmpty(
                                  value,
                                  AppLocalizations.of(context)!
                                      .enterValidEmail),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            CustomTextFormField(
                              controller: passwordController,
                              prefixIcon: Icon(Icons.lock_outline),
                              hintText: AppLocalizations.of(context)!.password,
                              keyboardType: TextInputType.text,
                              obscureText: isSecure,
                              validator: (value) => validatePassword(
                                  password: passwordController.text,
                                  messageInvalid: AppLocalizations.of(context)!
                                      .enterValidPassword,
                                  messageLength: AppLocalizations.of(context)!
                                      .enterValidPassword,
                                  message: AppLocalizations.of(context)!
                                      .enterValidPassword),
                              suffix: InkWell(
                                  onTap: () {
                                    isSecure = !isSecure;
                                    setState(() {});
                                  },
                                  child: isSecure
                                      ? Icon(Icons.visibility_off_outlined)
                                      : Icon(Icons.visibility_outlined)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 230),
                              child: InkWell(
                                child: Column(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!
                                          .forgetPassword,
                                      style: GoogleFonts.balooThambi2(
                                          color: ColorManager.orange,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Container(
                                      height: 1,
                                      width: 100,
                                      color: ColorManager.orange,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            CustomElevatedButton(
                              title: AppLocalizations.of(context)!.login,
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  viewModel.login(emailController.text,
                                      passwordController.text);
                                }

                                // if (isButtonEnabled == true) {
                                //   viewModel.login(emailController.text,
                                //       passwordController.text);
                                // }
                              },
                              buttonColor: ColorManager.orange,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.donHaveAccount,
                                  style: GoogleFonts.balooThambi2(
                                      color: ColorManager.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RoutesManager.registerView);
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.register,
                                        style: GoogleFonts.balooThambi2(
                                            color: ColorManager.orange,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Container(
                                        height: 1,
                                        width: 55,
                                        color: ColorManager.orange,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
