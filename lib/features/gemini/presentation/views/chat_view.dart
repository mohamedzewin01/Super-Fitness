import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:super_fitness/core/resources/assets_manager.dart';
import 'package:super_fitness/core/resources/color_manager.dart';
import 'package:super_fitness/features/gemini/presentation/widgets/bottom_chat_field.dart';
import 'package:super_fitness/hive/models/message.dart';
import 'package:super_fitness/hive/providers/chat_provider.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (BuildContext context, chatProvider, Widget? child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToBottom();
        });

        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    AssetsManager.backgroundChat,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                      icon: SvgPicture.asset(AssetsManager.back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    centerTitle: true,
                    title: Text(
                      "Smart Coach",
                      style: GoogleFonts.balooThambi2(
                        color: ColorManager.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    actions: [
                      IconButton(
                        icon: SvgPicture.asset(AssetsManager.vector),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: kToolbarHeight),
                    Expanded(
                      child: chatProvider.inChatMessages.isEmpty
                          ? Center(
                              child: Text(
                                "No Messages Yet",
                                style: GoogleFonts.balooThambi2(
                                  color: ColorManager.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            )
                          : ListView.builder(
                              controller: _scrollController,
                              itemCount: chatProvider.inChatMessages.length,
                              itemBuilder: (context, index) {
                                final message =
                                    chatProvider.inChatMessages[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 16.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: message.role == Role.user
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.start,
                                    children: [
                                      if (message.role != Role.user)
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                              AssetsManager.botUiImage),
                                          radius: 20,
                                        ),
                                      if (message.role != Role.user)
                                        const SizedBox(width: 16),
                                      Container(
                                        padding: const EdgeInsets.all(12.0),
                                        constraints: BoxConstraints(
                                          maxWidth: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                        ),
                                        decoration: BoxDecoration(
                                          color: message.role == Role.user
                                              ? ColorManager
                                                  .userSendMessageColor
                                              : ColorManager
                                                  .assistantGeminiRsponseColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: message.role == Role.user
                                                ? const Radius.circular(16)
                                                : Radius.zero,
                                            topRight: message.role == Role.user
                                                ? Radius.zero
                                                : const Radius.circular(16),
                                            bottomLeft:
                                                const Radius.circular(16),
                                            bottomRight:
                                                const Radius.circular(16),
                                          ),
                                        ),
                                        child: Text(
                                          message.message.toString(),
                                          style: GoogleFonts.balooThambi2(
                                            color: ColorManager.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      if (message.role == Role.user)
                                        const SizedBox(width: 16),
                                      if (message.role == Role.user)
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                              AssetsManager.userImageDefault),
                                          radius: 20,
                                        ),
                                    ],
                                  ),
                                );
                              },
                            ),
                    ),
                    CustomBottomChatField(chatProvider: chatProvider),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
