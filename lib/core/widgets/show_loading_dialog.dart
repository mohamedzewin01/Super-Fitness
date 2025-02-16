import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:super_fitness/core/resources/app_constants.dart';

import '../resources/values_manager.dart';
>>>>>>> origin/forget_password

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
<<<<<<< HEAD
      return const AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 10),
            Text("Loading..."),
=======
      return AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            SizedBox(width: AppSize.s10),
            const Text(AppConstants.loading),
>>>>>>> origin/forget_password
          ],
        ),
      );
    },
  );
<<<<<<< HEAD
}
=======
}
>>>>>>> origin/forget_password
