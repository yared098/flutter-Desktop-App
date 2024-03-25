// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/jam.dart';
import 'package:iconify_flutter/icons/mi.dart';

import '../models/navigation.dart';
import '../resources/colors.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final List<Navigation> _navigations = [
    Navigation(icon: Eva.message_circle_outline),
    Navigation(icon: Mi.users),
    Navigation(icon: Mi.users),
    Navigation(icon: Jam.video_camera),
    Navigation(icon: Jam.bookmark_minus),
    Navigation(icon: Mi.users)
  ];

  int selectedIndex = 0;
  int hoveredIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/logo.png"),
            radius: 25,
          ),
          IntrinsicHeight(
            child: Column(
              children: _navigations
                  .asMap()
                  .entries
                  .map(
                    (entry) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = entry.key;
                        });
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
                        child: CircleAvatar(
                          backgroundColor: selectedIndex == entry.key
                              ? primaryParticipantColor
                              : hoveredIndex == entry.key
                                  ? Colors.grey.withOpacity(0.3)
                                  : Colors.transparent,
                          radius: 25,
                          child: Iconify(
                            _navigations[entry.key].icon,
                            size: 30,
                            color: selectedIndex == entry.key
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Column(
            children: const [
              CircleAvatar(
                backgroundColor: Color.fromRGBO(94, 17, 17, 1),
                radius: 25,
                child: Iconify(
                  Ic.baseline_add,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  "https://randomuser.me/api/portraits/men/46.jpg",
                ),
                radius: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
