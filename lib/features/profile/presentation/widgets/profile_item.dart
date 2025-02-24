import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/color_manager.dart';

class ProfileItem extends StatelessWidget {
  String imagePath;
  String tittle;
  Widget icon;

  ProfileItem(
      {required this.imagePath,
      required this.tittle,
      required this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(imagePath,height: 20,width: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                tittle,
                style: GoogleFonts.balooThambi2(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white),
              ),
            ),
            Spacer(),
            icon
          ],
        ),
        Divider(
          color: ColorManager.fieldTextBorder.withOpacity(0.05),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
