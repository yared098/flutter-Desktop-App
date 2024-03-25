// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/charm.dart';

import '../resources/colors.dart';

class HomeWidget_incammingAppBar extends StatefulWidget {
  const HomeWidget_incammingAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _HomeWidgetAppBarState createState() => _HomeWidgetAppBarState();
}

class _HomeWidgetAppBarState extends State<HomeWidget_incammingAppBar> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: widget.size.height * 0.14, //14% of window height
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: borderColor, width: 2),
        ),
      ),
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHovered = false;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                      "https://randomuser.me/api/portraits/men/46.jpg"),
                  radius: 25,
                  backgroundColor: isHovered ? Colors.grey : Colors.transparent,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Incamming Orders",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "New",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: mutedTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                shape: BoxShape.circle,
              ),
              child: const Iconify(
                Charm.menu_kebab,
                color: Colors.white,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
