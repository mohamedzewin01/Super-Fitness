import 'package:flutter/material.dart';
<<<<<<< HEAD

=======
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
>>>>>>> origin/forget_password
void showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Row(
          children: [
            Expanded(
              child: Text(message),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
<<<<<<< HEAD
            child: const Text('OK'),
=======
            child: Text( AppLocalizations.of(context)!.ok),
>>>>>>> origin/forget_password
          ),
        ],
      );
    },
  );
<<<<<<< HEAD
}
=======
}
>>>>>>> origin/forget_password
