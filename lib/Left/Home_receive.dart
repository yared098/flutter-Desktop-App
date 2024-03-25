import 'package:desktop_chat_ui/Left/Home_incamming_appbar.dart';
import 'package:desktop_chat_ui/Left/showIncammingOrders.dart';
import 'package:desktop_chat_ui/custom_widgets/chat_list_widget.dart';
import 'package:desktop_chat_ui/custom_widgets/home_widget_app_bar.dart';
import 'package:desktop_chat_ui/custom_widgets/online_now.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';
// import '../chat_list_widget.dart';
// import '../home_widget_app_bar.dart';
// import '../online_now.dart';
// import 'search_bar.dart';

class Home_incammingWidget extends StatefulWidget {
  const Home_incammingWidget({Key? key}) : super(key: key);

  @override
  State<Home_incammingWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<Home_incammingWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.25, //25% of the window width
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: borderColor, width: 2),
          left: BorderSide(color: borderColor, width: 2),
        ),
      ),
      child: Column(
        children: [
          // Text("Incamming"),
          HomeWidget_incammingAppBar(size: size),
          const SearchBar(),
          Expanded(
            child: showincammingCustomerListWidget(),
          )
        ],
      ),
    );
  }
}
