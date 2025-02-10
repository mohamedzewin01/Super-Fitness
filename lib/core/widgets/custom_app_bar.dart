// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import '../resources/assets_manager.dart';
// import '../resources/font_manager.dart';
// import '../resources/values_manager.dart';
//
// class CustomAppBar extends StatelessWidget {
//   const CustomAppBar({
//     super.key,
//     this.title,
//     this.onTap,
//     this.color,
//   });
//
//   final String? title;
//   final void Function()? onTap;
//   final Color? color;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         if (onTap != null)
//           GestureDetector(
//             onTap: onTap,
//             child: SvgPicture.asset(AssetsManager.vector),
//           ),
//         const SizedBox(width: AppSize.s8),
//         if (title != null)
//           Text(
//             title!,
//             style: TextStyle(
//               fontSize: FontSize.s20,
//               color: color ?? Colors.black,
//               fontWeight: FontWeightManager.bold,
//             ),
//           ),
//       ],
//     );
//   }
// }
