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
  late VerifyPasswordViewModel viewModel;
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
    viewModel = getIt.get<VerifyPasswordViewModel>();
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
      editEmail = "default_email@example.com";
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
        create: (context) => viewModel,
        child: SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: Stack(children: [
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
                              height: 60,
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 16),
                                        Text(
                                          AppLocalizations.of(context)!.otpCode,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800,
                                              fontFamily: "BalooThambi800"),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          AppLocalizations.of(context)!
                                              .enterYourOTPCheckYourEmail,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "BalooThambi400"),
                                        ),
                                        const SizedBox(height: 8),
                                      ],
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaY: 34.5, sigmaX: 34.5),
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withAlpha(20),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 8),
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
                                                      viewModel: viewModel,
                                                      isCodeInvalid:
                                                          _isCodeInvalid,
                                                      index: index,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 16),
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
                                            const SizedBox(height: 24),
                                            SizedBox(
                                              width: double.infinity,
                                              child:ElevatedButton(
                                                onPressed: () {
                                                  String enteredOtp = _controllers.map((controller) => controller.text).join();

                                                  if (enteredOtp.length == 6) {
                                                    viewModel.doIntent(VerifyPasswordIntent(enteredOtp));
                                                  } else {
                                                    setState(() {
                                                      _isCodeInvalid = true;
                                                    });
                                                  }
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: ColorManager.basicColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(30),
                                                  ),
                                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                                ),
                                                child: Text(
                                                  AppLocalizations.of(context)!.confirm,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: ColorManager.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "BalooThambi800",
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

                                            const SizedBox(height: 12),
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
                                                        ? ' ($_remainingTime sec)' // Display remaining time
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: FontSize.s16,
                                                      color: ColorManager.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 12),
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
