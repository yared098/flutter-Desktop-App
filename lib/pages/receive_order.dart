import 'package:flutter/material.dart';

class ReceiverOrderPage extends StatelessWidget {
  // final List<ReceiverOrder> receiverOrders;

  // ReceiverOrderPage({required this.receiverOrders});

  List<ReceiverOrder> receiverOrders = [
    ReceiverOrder(
      customerName: 'John Doe',
      customerPhone: '1234567890',
      customerAddress: '123 Main St',
      orderTime: '2024-03-25 10:30 AM',
      orders: ['Product 1', 'Product 2', 'Product 3'],
    ),
    ReceiverOrder(
      customerName: 'Jane Smith',
      customerPhone: '9876543210',
      customerAddress: '456 Elm St',
      orderTime: '2024-03-25 11:45 AM',
      orders: ['Product 4', 'Product 5'],
    ),
    ReceiverOrder(
      customerName: 'Dessalew Doe',
      customerPhone: '1234567890',
      customerAddress: '123 Main St',
      orderTime: '2024-03-25 10:30 AM',
      orders: ['Product 1', 'Product 2', 'Product 3'],
    ),
    ReceiverOrder(
      customerName: 'Miki Doe',
      customerPhone: '1234567890',
      customerAddress: '123 Main St',
      orderTime: '2024-03-25 10:30 AM',
      orders: ['Product 1', 'Product 2', 'Product 3'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Receiver Orders'),
      // ),
      body: ListView.builder(
        itemCount: receiverOrders.length,
        itemBuilder: (context, index) {
          ReceiverOrder receiverOrder = receiverOrders[index];
          return Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: ListTile(
              title: Text(receiverOrder.customerName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Phone: ${receiverOrder.customerPhone}'),
                  Text('Address: ${receiverOrder.customerAddress}'),
                  Text('Order Time: ${receiverOrder.orderTime}'),
                  SizedBox(height: 10.0),
                  Text('Orders:'),
                  SizedBox(height: 5.0),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: receiverOrder.orders.length,
                    itemBuilder: (context, index) {
                      String order = receiverOrder.orders[index];
                      return Text(order);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ReceiverOrder {
  final String customerName;
  final String customerPhone;
  final String customerAddress;
  final String orderTime;
  final List<String> orders;

  ReceiverOrder({
    required this.customerName,
    required this.customerPhone,
    required this.customerAddress,
    required this.orderTime,
    required this.orders,
  });
}
