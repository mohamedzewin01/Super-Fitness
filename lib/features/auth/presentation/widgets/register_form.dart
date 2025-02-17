import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/functions/helper.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../view_model/view_model_register/register_cubit.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key, required this.viewModel});

  final RegisterCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Hey There',
                      style: getMediumStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'create an account',
                      style:
                          getSemiBoldStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ColorManager.primary.withValues(alpha: 0.6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    child: Column(
                      spacing: 16,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Form(
                            key: viewModel.formKey,
                            child: Column(
                              spacing: 16,
                              children: [
                                Text(
                                  'Register',
                                  style: getSemiBoldStyle(
                                      color: ColorManager.white, fontSize: 24),
                                ),
                                CustomTextFormField(
                                  inputAction: TextInputAction.next,
                                  controller: viewModel.firstNameController,
                                  hintText: 'First Name',
                                  validator: (value) => validateString(
                                    value: value!,
                                    messageLength: AppLocalizations.of(context)!
                                        .messageLength3,
                                    messageInvalid:
                                        AppLocalizations.of(context)!
                                            .invalidInput,
                                    message: AppLocalizations.of(context)!
                                        .entervalidLastName,
                                  ),
                                  prefixIcon: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AssetsManager.user,
                                      ),
                                    ),
                                  ),
                                ),
                                CustomTextFormField(
                                  inputAction: TextInputAction.next,
                                  controller: viewModel.lastNameController,
                                  hintText: 'Last Name',
                                  validator: (value) => validateString(
                                    value: value!,
                                    messageLength: AppLocalizations.of(context)!
                                        .messageLength3,
                                    messageInvalid:
                                        AppLocalizations.of(context)!
                                            .invalidInput,
                                    message: AppLocalizations.of(context)!
                                        .entervalidLastName,
                                  ),
                                  prefixIcon: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AssetsManager.user,
                                      ),
                                    ),
                                  ),
                                ),
                                CustomTextFormField(
                                  inputAction: TextInputAction.next,
                                  controller: viewModel.emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  hintText: 'Email',
                                  validator: (value) => validateEmail(
                                    value: value!,
                                    message: AppLocalizations.of(context)!
                                        .emailIsEmpty,
                                    messageInvalid:
                                        AppLocalizations.of(context)!
                                            .enterValidEmail,
                                  ),
                                  prefixIcon: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AssetsManager.mail,
                                      ),
                                    ),
                                  ),
                                ),
                                CustomTextFormField(
                                  inputAction: TextInputAction.go,
                                  controller: viewModel.passwordController,
                                  hintText: 'Password',
                                  obscureText: viewModel.isPassword,
                                  validator: (value) => validatePassword(
                                      password:
                                          viewModel.passwordController.text,
                                      messageInvalid:
                                          AppLocalizations.of(context)!
                                              .passwordInvalidFormat,
                                      messageLength:
                                          AppLocalizations.of(context)!
                                              .passwordCharactersLong,
                                      message: AppLocalizations.of(context)!
                                          .passwordNotMatch),
                                  prefixIcon: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AssetsManager.lock,
                                      ),
                                    ),
                                  ),
                                  suffix: GestureDetector(
                                    onTap: () => viewModel.isPasswordChanged(),
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Center(
                                        child: !viewModel.isPassword
                                            ? SvgPicture.asset(
                                                AssetsManager.eye)
                                            : Icon(
                                                Icons.visibility_off_outlined,
                                                size: 20,
                                                color: ColorManager
                                                    .grey,),
                                      ),
                                    ),
                                  ),
                                ),
                                CustomTextFormField(
                                  inputAction: TextInputAction.go,
                                  controller: viewModel.rePasswordController,
                                  hintText: 'RePassword',
                                  obscureText: viewModel.isRePassword,
                                  validator: (value) => validatePasswordMatch(
                                      messageIsEmpty:
                                          AppLocalizations.of(context)!
                                              .passwordIsEmpty,
                                      password:
                                          viewModel.rePasswordController.text,
                                      confirmPassword:
                                          viewModel.passwordController.text,
                                      message: AppLocalizations.of(context)!
                                          .passwordNotMatch),
                                  prefixIcon: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AssetsManager.lock,
                                      ),
                                    ),
                                  ),
                                  suffix: GestureDetector(
                                    onTap: () =>
                                        viewModel.isRePasswordChanged(),
                                    child: Center(
                                      child: !viewModel.isRePassword
                                          ? SvgPicture.asset(
                                          AssetsManager.eye)
                                          : Icon(
                                        Icons.visibility_off_outlined,
                                        size: 20,
                                        color: ColorManager
                                            .grey,),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: CustomElevatedButton(
                                    buttonColor: ColorManager.orange,
                                    title: 'NEXT',
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      if (viewModel.formKey.currentState!
                                          .validate()) {
                                        viewModel.pageController.nextPage(
                                            duration:
                                                Duration(milliseconds: 1000),
                                            curve: Curves.easeIn);
                                        log('/////////////////////////////');
                                        viewModel.showBack(isShowBack: false);
                                        log(viewModel.pageController.page.toString());
                                        log(viewModel.pageController.initialPage
                                            .toString());
                                        log('/////////////////////////////');
                                      }
                                    }),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already Have An Account ?',
                              style: getRegularStyle(
                                  color: ColorManager.white, fontSize: 14),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutesManager.loginView);
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: ColorManager.orange,
                                    color: ColorManager.orange,
                                    fontSize: 14,
                                    fontFamily: 'BalooThambi800'),
                                //   getBoldStyle(
                                //       color: ColorManager.orange, fontSize: 14,),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SuffixIconPassword extends StatefulWidget {
  const SuffixIconPassword({
    super.key,
  });

  @override
  State<SuffixIconPassword> createState() => _SuffixIconPasswordState();
}

class _SuffixIconPasswordState extends State<SuffixIconPassword> {
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPassword = !isPassword;
          log('$isPassword');
        });
      },
      child: SizedBox(
        height: 20,
        width: 20,
        child: Center(
          child: SvgPicture.asset(
            AssetsManager.eye,
          ),
        ),
      ),
    );
  }
}
