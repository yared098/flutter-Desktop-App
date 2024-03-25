// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:desktop_chat_ui/custom_widgets/layouts/home_widget.dart';
import 'package:flutter/material.dart';

import 'Left/Home_receive.dart';
import 'Side/sidebar.dart';
// import 'custom_widgets/layouts/chat_ui.dart';
// import 'custom_widgets/layouts/home_widget.dart';
import 'Middle/products_widget.dart';
// import 'custom_widgets/sidebar.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SideBar(),
            const Home_incammingWidget(),
            const ProductsshowWidget(),
            const HomeWidget(),
          ],
        ),
      ),
    );
  }
}
