import '../../../../core/resources/app_constants.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../pages/reset_password_view.dart';
import '../view_model/verify_password_view_model/verify_password_cubit.dart';
import '../view_model/verify_password_view_model/verify_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/utilss.dart';

class BlocConsumerForOtpVerificationPage extends StatelessWidget {
  final ValueChanged<bool> onCodeInvalid; // Callback for invalid code
  final String email;

  const BlocConsumerForOtpVerificationPage({
    super.key,
    required this.onCodeInvalid, // Required callback
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyPasswordViewModel, VerifyPasswordState>(
        listener: (context, state) {
          if (state is LoadingVerifyPasswordState) {
            // showLoadingDialog(context);
            CustomDialog.showLoadingDialog(context);
          } else if (state is ErrorVerifyPasswordState) {
            var message = extractErrorMessage(state.exception);
            Navigator.of(context).pop(); // Close loading dialog
            //showErrorDialog(context, message);
            CustomDialog.showErrorDialog(context, message: message);
          } else if (state is SuccessVerifyPasswordState) {
            Navigator.of(context).pop();
            Future.delayed(
                Duration(milliseconds: AppConstants.millisecondsDelayed), () {
              if (!context.mounted) return;
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const ResetPasswordView(),
                settings: RouteSettings(arguments: email),
              ));
            });
          }
        },
        listenWhen: (previous, current) {
          if (current is LoadingVerifyPasswordState ||
              current is ErrorVerifyPasswordState ||
              current is SuccessVerifyPasswordState) {
            return true;
          }
          return false;
        },
        child: const SizedBox.shrink() // Placeholder when no loading state

        );
  }
}
