import 'package:flutter/material.dart';
import '../resources/app_constants.dart';

import '../resources/values_manager.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            SizedBox(width: AppSize.s10),
            const Text(AppConstants.loading),
          ],
        ),
      );
    },
  );
}
