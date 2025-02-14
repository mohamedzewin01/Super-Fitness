import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_fitness/core/resources/assets_manager.dart';
import 'package:super_fitness/core/widgets/custom_text_form_field.dart';
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
                    color: ColorManager.primary.withAlpha(160),
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
                            key:viewModel.formKey,
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
                                  controller:viewModel.firstNameController,
                                  hintText: 'First Name',
                                  validator: (value) => validateString(
                                    value: value!,
                                    messageLength: AppLocalizations.of(context)!
                                        .messageLength3,
                                    messageInvalid:
                                    AppLocalizations.of(context)!.invalidInput,
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
                                    AppLocalizations.of(context)!.invalidInput,
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
                                    message: AppLocalizations.of(context)!.emailIsEmpty,
                                    messageInvalid:AppLocalizations.of(context)!.enterValidEmail,                       ),
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
                                  validator: (value) => validatePassword(
                                      password:viewModel.passwordController.text,
                                      messageInvalid: AppLocalizations.of(context)!
                                          .passwordInvalidFormat,
                                      messageLength: AppLocalizations.of(context)!
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
                                  suffix: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AssetsManager.eye,
                                      ),
                                    ),
                                  ),
                                ),
                                CustomTextFormField(
                                  inputAction: TextInputAction.go,
                                  controller: viewModel.rePasswordController,
                                  hintText: 'RePassword',
                                  obscureText: true,
                                  validator: (value) => validatePasswordMatch(
                                      messageIsEmpty: AppLocalizations.of(context)!
                                          .passwordIsEmpty,
                                      password: viewModel.rePasswordController.text,
                                      confirmPassword: viewModel.rePasswordController.text,
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
                                  suffix: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AssetsManager.eye,
                                      ),
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
                                    title: 'Register',
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      if (viewModel.formKey.currentState!.validate()) {
                                        viewModel.pageController.nextPage(
                                            duration: Duration(milliseconds: 1000),
                                            curve: Curves.easeIn);
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
                            Text(
                              'Login',
                              style: getBoldStyle(
                                  color: ColorManager.orange, fontSize: 14),
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
