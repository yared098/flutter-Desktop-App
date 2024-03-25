// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:desktop_chat_ui/Left/orders_widget.dart';
import 'package:desktop_chat_ui/custom_widgets/badge.dart';
import 'package:desktop_chat_ui/custom_widgets/chat_preview_widget.dart';
import 'package:flutter/material.dart';

import '../resources/chat_previews.dart';
import '../resources/colors.dart';

class showincammingCustomerListWidget extends StatefulWidget {
  showincammingCustomerListWidget({Key? key}) : super(key: key);

  @override
  _ChatListWidgetState createState() => _ChatListWidgetState();
}

class _ChatListWidgetState extends State<showincammingCustomerListWidget> {
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
                "Incamming Orders",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Badgee(
                caption: "280",
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
              child: OrderPreviewWidget(
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
