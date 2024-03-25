import 'package:desktop_chat_ui/custom_widgets/badge.dart';
import 'package:desktop_chat_ui/custom_widgets/status_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/chat_preview.dart';
import '../resources/colors.dart';

class OrderPreviewWidget extends StatelessWidget {
  const OrderPreviewWidget({
    Key? key,
    required this.chat,
    this.isSelected = false,
  }) : super(key: key);

  final ChatPreviewModel chat;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? const Color(0xff252b2e) : Colors.transparent,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              child: Text(chat.user.name[0]),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  print("Welcome");
                  // Navigator.pop(context);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.user.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    chat.isTyping
                        ? const Text(
                            "Sending...",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              color: primaryParticipantColor,
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        : Text(
                            chat.message ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              color: greyColor,
                            ),
                          ),
                    const SizedBox(height: 8),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Handle accept button press
                          },
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.green,
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                          ),
                          child: const Text(
                            'Accept',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        // const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            // Handle decline button press
                          },
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.red,
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                          ),
                          child: const Text(
                            'Decline',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            statusBuilder(chat.stage),
            Column(
              children: [
                Text(
                  chat.time,
                  style: const TextStyle(fontSize: 12, color: greyColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                chat.unreadCount > 0
                    ? Badgee(
                        caption: chat.unreadCount.toString(),
                        color: primaryParticipantColor,
                        fontSize: 8,
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
