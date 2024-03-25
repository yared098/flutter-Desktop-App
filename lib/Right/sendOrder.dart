import 'package:flutter/material.dart';

class Product {
  final String name;

  Product({
    required this.name,
  });
}

class SendOrderPage extends StatefulWidget {
  @override
  _SendOrderPageState createState() => _SendOrderPageState();
}

class _SendOrderPageState extends State<SendOrderPage> {
  List<Product> products = [
    Product(name: 'Product 0'),
    Product(name: 'Product 1'),
    Product(name: 'Product 2'),
    Product(name: 'Product 3'),
    Product(name: 'Product 4'),
    Product(name: 'Product 5'),
  ];

  List<Product> selectedProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Order'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: products.map((product) {
                return Draggable<Product>(
                  data: product,
                  feedback: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(product.name),
                  ),
                  child: Text(product.name),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Selected Products:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ReorderableListView(
              children: selectedProducts.map((product) {
                return ListTile(
                  key: Key(product.name),
                  title: Text(product.name),
                  trailing: Icon(Icons.drag_handle),
                );
              }).toList(),
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  final product = selectedProducts.removeAt(oldIndex);
                  selectedProducts.insert(newIndex, product);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
