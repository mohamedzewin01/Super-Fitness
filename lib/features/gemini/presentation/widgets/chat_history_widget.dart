// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:super_fitness/hive/chat_history.dart';
// import 'package:super_fitness/hive/providers/chat_provider.dart';

// class ChatHistoryWidget extends StatelessWidget {
//   const ChatHistoryWidget({
//     super.key,
//     required this.chat,
//   });

//   final ChatHistory chat;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
//         leading: const CircleAvatar(
//           radius: 30,
//           child: Icon(Icons.chat),
//         ),
//         title: Text(
//           chat.prompt,
//           maxLines: 1,
//         ),
//         subtitle: Text(
//           chat.response,
//           maxLines: 2,
//         ),
//         trailing: const Icon(Icons.arrow_forward_ios),
//         onTap: () async {
//           // navigate to chat screen
//           final chatProvider = context.read<ChatProvider>();
//           // prepare chat room
//           await chatProvider.prepareChatRoom(
//             isNewChat: false,
//             chatID: chat.chatId,
//           );
//           chatProvider.setCurrentIndex(newIndex: 1);
//           chatProvider.pageController.jumpToPage(1);
//         },
//         onLongPress: () {
//           // show my animated dialog to delete the chat
//           showMyAnimatedDialog(
//             context: context,
//             title: 'Delete Chat',
//             content: 'Are you sure you want to delete this chat?',
//             actionText: 'Delete',
//             onActionPressed: (value) async {
//               if (value) {
//                 // delete the chat
//                 await context
//                     .read<ChatProvider>()
//                     .deletChatMessages(chatId: chat.chatId);

//                 // delete the chat history
//                 chat.chatId;
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
// }
// // animated dialog

// void showMyAnimatedDialog({
//   required BuildContext context,
//   required String title,
//   required String content,
//   required String actionText,
//   required Function(bool) onActionPressed,
// }) async {
//   showGeneralDialog(
//       context: context,
//       barrierDismissible: true,
//       barrierLabel: '',
//       transitionDuration: const Duration(milliseconds: 200),
//       pageBuilder: (context, animation, seconderyAnimation) {
//         return Container();
//       },
//       transitionBuilder: (context, animation, seconderyAnimation, child) {
//         return ScaleTransition(
//           scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
//           child: FadeTransition(
//             opacity: animation,
//             child: AlertDialog(
//               title: Text(
//                 title,
//                 textAlign: TextAlign.center,
//               ),
//               content: Text(
//                 content,
//                 textAlign: TextAlign.center,
//               ),
//               actions: [
//                 TextButton(
//                     onPressed: () {
//                       onActionPressed(false);
//                       Navigator.of(context).pop();
//                     },
//                     child: const Text('Cancel')),
//                 TextButton(
//                     onPressed: () {
//                       onActionPressed(true);
//                       Navigator.of(context).pop();
//                     },
//                     child: Text(actionText)),
//               ],
//             ),
//           ),
//         );
//       });
// }
