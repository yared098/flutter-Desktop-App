// import 'package:desktop_chat_ui/app.dart';
// import 'package:desktop_chat_ui/resources/colors.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Desktop Chat UI',
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: backgroundColor,
//         appBarTheme: const AppBarTheme(
//           color: appBarColor,
//         ),
//         textTheme: Theme.of(context).textTheme.apply(
//               fontFamily: "Satoshi",
//               bodyColor: Colors.white,
//             ),
//       ),
//       home: const AppWidget(),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:desktop_chat_ui/Right/sendOrder.dart';
import 'package:desktop_chat_ui/pages/receive_order.dart';
import 'package:desktop_chat_ui/pages/send_order.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sidebar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String currentPage = 'Home';

  void navigateToPage(String pageName) {
    setState(() {
      currentPage = pageName;
    });
  }

  Widget buildSidebarItem(String title, IconData icon) {
    return ListTile(
      leading: Icon(
        icon,
        color: currentPage == title ? Colors.blue : Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight:
              currentPage == title ? FontWeight.bold : FontWeight.normal,
          color: currentPage == title ? Colors.blue : Colors.grey,
        ),
      ),
      onTap: () {
        navigateToPage(title);
      },
    );
  }

  Widget buildRightSidePage() {
    switch (currentPage) {
      case 'Home':
        return Container(
          color: Colors.yellow,
          child: Center(
            child: Text('Right Side Page for Home'),
          ),
        );
      case 'Settings':
        return Container(
          color: Colors.green,
          child: Center(
            child: Text('Right Side Page for Settings'),
          ),
        );
      case 'Profile':
        return Container(
          color: Colors.orange,
          child: Center(
            child: Text('Right Side Page for Profile'),
          ),
        );
      case 'receive':
        return ReceiverOrderPage();
      case 'send_order':
        return SendOrderPage1();
      default:
        return Container();
    }
  }

  Widget buildProductCard(int index) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text('Product $index'),
        ),
      ),
    );
  }

  Widget buildProductGrid() {
    return GridView.builder(
      itemCount: 12,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3 / 4,
      ),
      itemBuilder: (BuildContext context, int index) {
        return buildProductCard(index + 1);
      },
    );
  }

  void showAddProductDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Product Name'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
              ),
              // Add image picker widget here
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                // Add product logic here
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentPage),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            // Render three columns
            return Row(
              children: [
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: ListView(
                    children: [
                      buildSidebarItem('Home', Icons.home),
                      buildSidebarItem('Settings', Icons.settings),
                      buildSidebarItem('Profile', Icons.person),
                      buildSidebarItem('send_order', Icons.home),
                      buildSidebarItem('receive', Icons.settings),
                      buildSidebarItem('help', Icons.person),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: buildRightSidePage(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: buildProductGrid(),
                  ),
                ),
              ],
            );
          } else {
            // Render two columns
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      buildSidebarItem('Home', Icons.home),
                      buildSidebarItem('Settings', Icons.settings),
                      buildSidebarItem('Profile', Icons.person),
                      buildSidebarItem('send_order', Icons.home),
                      buildSidebarItem('receive', Icons.settings),
                      buildSidebarItem('help', Icons.person),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: buildProductGrid(),
                  ),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddProductDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
