// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';

import '../resources/colors.dart';
import '../resources/users.dart';
import 'user_avatar.dart';

class OnlineNowWidget extends StatefulWidget {
  OnlineNowWidget({
    Key? key,
  }) : super(key: key);

  @override
  _OnlineNowWidgetState createState() => _OnlineNowWidgetState();
}

class _OnlineNowWidgetState extends State<OnlineNowWidget> {
  final ScrollController onlineNowController = ScrollController();
  int hoveredIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Online Now",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              Row(
                children: const [
                  Text(
                    "More",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: mutedTextColor,
                    ),
                  ),
                  Icon(
                    CupertinoIcons.chevron_right,
                    size: 14,
                    color: mutedTextColor,
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: onlineNowController,
              child: Row(
                children: users
                    .asMap()
                    .entries
                    .map(
                      (entry) => GestureDetector(
                        onTap: () {
                          // Handle avatar tap event
                        },
                        child: MouseRegion(
                          onEnter: (_) {
                            setState(() {
                              hoveredIndex = entry.key;
                            });
                          },
                          onExit: (_) {
                            setState(() {
                              hoveredIndex = -1;
                            });
                          },
                          child: Column(
                            children: [
                              UserAvatar(avatarUrl: entry.value.avatarUrl),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
