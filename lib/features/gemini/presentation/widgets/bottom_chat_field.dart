import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_fitness/core/resources/color_manager.dart';
import 'package:super_fitness/hive/providers/chat_provider.dart';

class CustomBottomChatField extends StatefulWidget {
  const CustomBottomChatField({super.key, required this.chatProvider});
  final ChatProvider chatProvider;

  @override
  State<CustomBottomChatField> createState() => _CustomBottomChatFieldState();
}

class _CustomBottomChatFieldState extends State<CustomBottomChatField> {
  // controller for the text field
  final TextEditingController _textController = TextEditingController();
  // focus node for the text field
  final FocusNode _focusNode = FocusNode();
  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> sendChatMessage({
    required String message,
    required ChatProvider chatProvider,
    required bool isTextOnly,
  }) async {
    try {
      await chatProvider.sentMessage(message: message, isTextOnly: isTextOnly);
    } catch (e) {
      log('Error sending message: $e');
    } finally {
      _textController.clear();
      _focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.transparent,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              focusNode: _focusNode,
              onSubmitted: (String value) {
                if (value.isNotEmpty) {
                  sendChatMessage(
                    message: _textController.text,
                    chatProvider: widget.chatProvider,
                    isTextOnly: true,
                  );
                }
              },
              style: TextStyle(color: ColorManager.white),
              decoration: InputDecoration(
                hintText: "Type a message",
                hintStyle: GoogleFonts.balooThambi2(
                  color: ColorManager.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: ColorManager.mainColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: ColorManager.mainColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: ColorManager.mainColor),
                ),
                // filled: true,
                // fillColor: Colors.white24,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.image, color: ColorManager.mainColor),
            onPressed: () {
              // Handle image selection
            },
          ),
          IconButton(
            icon: Icon(Icons.send, color: ColorManager.mainColor),
            onPressed: () {
              if (_textController.text.isNotEmpty) {
                sendChatMessage(
                  message: _textController.text,
                  chatProvider: widget.chatProvider,
                  isTextOnly: true,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
