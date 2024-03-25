import 'package:desktop_chat_ui/custom_widgets/badge.dart';
import 'package:flutter/material.dart';

import '../resources/chat_previews.dart';
import '../resources/colors.dart';
import 'badge.dart';
import 'chat_preview_widget.dart';

class ChatListWidget extends StatefulWidget {
  ChatListWidget({Key? key}) : super(key: key);

  @override
  _ChatListWidgetState createState() => _ChatListWidgetState();
}

class _ChatListWidgetState extends State<ChatListWidget> {
  int selectedIndex = 1;
  int hoveredIndex = -1;
  final ScrollController chatListController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Customers",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Badgee(
                caption: "28",
                color: primaryParticipantColor,
                fontSize: 10,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: chatListController,
            itemCount: chatPreviews.length,
            itemBuilder: (context, index) => MouseRegion(
              onEnter: (_) {
                setState(() {
                  hoveredIndex = index;
                });
              },
              onExit: (_) {
                setState(() {
                  hoveredIndex = -1;
                });
              },
              child: ChatPreviewWidget(
                chat: chatPreviews[index],
                isSelected: selectedIndex == index || hoveredIndex == index,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
