import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../resources/color_manager.dart';

void showValidationDialog(BuildContext context){
  showDialog(context: context, builder:(context){
    return AlertDialog(
      title: Center(
          child: Text(
            AppLocalizations.of(context)!.unValidData,
            style: TextStyle(
                color: ColorManager.error,
                fontWeight: FontWeight.bold),)),

      content: Text(AppLocalizations.of(context)!.fillFieldCorrectly),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text(AppLocalizations.of(context)!.ok))
      ],
    );

  });
}