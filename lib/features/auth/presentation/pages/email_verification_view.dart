import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/app_constants.dart';
import '../../../../core/resources/app_strings.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../view_model/forget_password_view_model/forget_password_cubit.dart';
import '../view_model/verify_password_view_model/verify_password_cubit.dart';
import '../widgets/block_consumer_for_otp.dart';
import '../widgets/custom_field_for_verification.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  late VerifyPasswordViewModel _viewModel;
  late ForgetPasswordViewModel forgetPasswordViewModel;
  late String editEmail;
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  bool _isCodeInvalid = false; // Track invalid code state
  final String _errorMessage = AppStrings.invalidCode;
  bool isButtonDisabled = true; // To track button state
  int _remainingTime = 60; // Timer countdown in seconds
  Timer? timer;


  @override
  void initState() {
    _viewModel = getIt.get<VerifyPasswordViewModel>();
    forgetPasswordViewModel = getIt.get<ForgetPasswordViewModel>();
    startTimer();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is String) {
      editEmail = args;
    } else {
      editEmail = AppConstants.defaultEmail;
    }
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel timer when the widget is disposed
    for (var controller in _controllers) {
      controller.dispose(); // Dispose of the controllers to free resources
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _viewModel,
        child: SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: Stack(children: [
                  Positioned.fill(
                      child: Image.asset(
                         AppConstants.forgetPasswordBGImage,
                          fit: BoxFit.cover)),
                  Positioned.fill(
                      child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX:AppConstants.blurConst12, sigmaY: AppConstants.blurConst12),
                    child: Container(
                      color: Colors.black.withAlpha(AppConstants.blurConst50),
                    ),
                  )),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: AppSize.s60, bottom: AppSize.s24),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppConstants.appLogo,
                              height: AppSize.s80,
                            ),
                            SizedBox(
                              height: AppSize.s60,
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(AppPadding.p16),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: AppSize.s16),
                                        Text(
                                          AppLocalizations.of(context)!.otpCode,
                                          style: getBoldStyle(
                                            color: Colors.white,
                                            fontSize: FontSize.s20,
                                          ),
                                        ),
                                        const SizedBox(height:AppSize.s8),
                                        Text(
                                          AppLocalizations.of(context)!
                                              .enterYourOTPCheckYourEmail,
                                          style:  getRegularStyle(
                                            color: Colors.white,
                                            fontSize: FontSize.s18,
                                          ),
                                        ),
                                        const SizedBox(height: AppSize.s8),
                                      ],
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(AppSize.s60),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaY: AppConstants.blurConst34, sigmaX: AppConstants.blurConst34),
                                      child: Container(
                                        padding: const EdgeInsets.all(AppPadding.p12),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withAlpha(AppConstants.blurConst20),
                                          borderRadius:
                                              BorderRadius.circular(AppSize.s20),
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: AppSize.s8),
                                            Form(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: List.generate(
                                                  AppConstants.listGenerate,
                                                  (index) {
                                                    return CustomFieldForOtpVerification(
                                                      controllers: _controllers,
                                                      viewModel: _viewModel,
                                                      isCodeInvalid:
                                                          _isCodeInvalid,
                                                      index: index,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: AppSize.s16),
                                            if (_isCodeInvalid)
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Icon(
                                                    Icons.error_outline,
                                                    size: AppSize.s16,
                                                    color: ColorManager.error,
                                                  ),
                                                  Text(
                                                    _errorMessage,
                                                    style: const TextStyle(
                                                        color:
                                                            ColorManager.error),
                                                  ),
                                                ],
                                              ),
                                            const SizedBox(height: AppSize.s24),
                                            SizedBox(
                                              width: double.infinity,
                                              child:ElevatedButton(
                                                onPressed: () {
                                                  String enteredOtp = _controllers.map((controller) => controller.text).join();

                                                  if (enteredOtp.length == AppConstants.listGenerate) {
                                                    _viewModel.doIntent(VerifyPasswordIntent(enteredOtp));
                                                  } else {
                                                    setState(() {
                                                      _isCodeInvalid = true;
                                                    });
                                                  }
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: ColorManager.basicColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(AppSize.s30),
                                                  ),
                                                  padding: const EdgeInsets.symmetric(vertical:AppPadding.p16),
                                                ),
                                                child: Text(
                                                  AppLocalizations.of(context)!.confirm,
                                                  style: getBoldStyle(
                                                    color: Colors.white,
                                                    fontSize: FontSize.s14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                         BlocConsumerForOtpVerificationPage(
                                         onCodeInvalid: (isInvalid) {

                                              setState(() {
                                                _isCodeInvalid = isInvalid;
                                              });
                                        },
                                        email: editEmail,
                                      ),

                                            const SizedBox(height: AppSize.s12),
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: AppLocalizations.of(
                                                            context)!
                                                        .doNotReceiveCode,
                                                    style: TextStyle(
                                                      fontSize: FontSize.s16,
                                                      fontWeight:
                                                          FontWeightManager
                                                              .regular,
                                                      color: ColorManager.white,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: isButtonDisabled
                                                        ? ' ($_remainingTime ${AppConstants.timerUnit})' // Display remaining time
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: FontSize.s16,
                                                      color: ColorManager.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height:AppSize.s12),
                                            InkWell(
                                              onTap: isButtonDisabled
                                                  ? null
                                                  : resendOTP, // Disable when button is inactive
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .resend,
                                                style: TextStyle(
                                                  fontSize: FontSize.s16,
                                                  fontWeight: FontWeight.w600,
                                                  color: isButtonDisabled
                                                      ? ColorManager.grey
                                                      : ColorManager.basicColor,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor:
                                                      ColorManager.basicColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ])
                          ]))
                ]))));
  }

  void startTimer() {
    setState(() {
      isButtonDisabled = true; // Disable the button
      _remainingTime = 60; // Reset the timer
    });

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 1) {
        setState(() => _remainingTime--);
      } else {
        timer.cancel();
        setState(() {
          isButtonDisabled = false; // Enable the button
        });
      }
    });
  }

  void resendOTP() {
    startTimer();
    forgetPasswordViewModel.doIntent(ForgetPasswordIntent(
        editEmail)); // Call the ViewModel's resend OTP function
  }



}
