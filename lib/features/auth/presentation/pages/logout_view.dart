import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../view_model/logout_view_model/logout_state.dart';
import '../view_model/logout_view_model/logout_view_model.dart';


class LogoutConfirmationDialogue extends StatefulWidget {
  @override
  State<LogoutConfirmationDialogue> createState() => _LogoutConfirmationDialogueState();
}


class _LogoutConfirmationDialogueState extends State<LogoutConfirmationDialogue> {

  late LogoutViewModel viewModel;
  String? _errorMessage;

  @override
  void initState() {
    viewModel = getIt.get<LogoutViewModel>();
    super.initState();
  }







  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => viewModel,
    child: BlocListener<LogoutViewModel, LogoutState>(
    listener: (context, state) {
    if (state is SuccessLogoutState) {
    Navigator.pushReplacementNamed(context, RoutesManager.loginView);
    } else if (state is ErrorLogoutState) {
    setState(() {
    _errorMessage = 'error';
    });
    }
    },




    child:  Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Radius 20px
          ),
          backgroundColor: Color(0xFF242424),//
          child: Container(
            width: 263, // ا
            padding: EdgeInsets.all(16), //
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Are You Sure To Close The Application?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {    Navigator.of(context).pop();}, //
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black, //
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Color(0xFFFF4100)), //
                        ),
                        fixedSize: Size(80, 38), //
                      ),
                      child: Text(
                        "NO",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
    viewModel.logout("Bearer ${CacheService.getData(key: CacheConstants.userToken)}");
    }

    ,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF4100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        fixedSize: Size(80, 38), //
                      ),
                      child: Text(
                        "Yes",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
     )
    )
    );

  }
}