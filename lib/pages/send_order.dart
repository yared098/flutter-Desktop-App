import 'package:flutter/material.dart';

class SendOrderPage1 extends StatefulWidget {
  @override
  _SendOrderPageState createState() => _SendOrderPageState();
}

class _SendOrderPageState extends State<SendOrderPage1> {
  List<Receiver> receivers = [];

  @override
  void initState() {
    super.initState();
    fetchReceivers();
  }

  void fetchReceivers() {
    // Simulating the fetching of data
    List<Map<String, dynamic>> receiverData = [
      {
        'name': 'John Doe',
        'phone': '1234567890',
        'address': '123 Main St',
        'time': '9:00 AM',
      },
      {
        'name': 'Jane Smith',
        'phone': '9876543210',
        'address': '456 Elm St',
        'time': '10:30 AM',
      },
      // Add more receiver data objects here
    ];

    setState(() {
      receivers =
          receiverData.map((item) => Receiver.fromJson(item)).take(10).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Send Order'),
      // ),
      body: ListView.builder(
        itemCount: receivers.length,
        itemBuilder: (context, index) {
          Receiver receiver = receivers[index];
          return Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: ListTile(
              title: Text(receiver.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Phone: ${receiver.phone}'),
                  Text('Address: ${receiver.address}'),
                  Text('Time: ${receiver.time}'),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showRegistrationForm();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showRegistrationForm() {
    showDialog(
      context: context,
      builder: (context) {
        String name = '';
        String phone = '';
        String address = '';

        return AlertDialog(
          title: Text('Receiver Registration'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                onChanged: (value) {
                  phone = value;
                },
                decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                onChanged: (value) {
                  address = value;
                },
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  receivers.add(Receiver(
                    name: name,
                    phone: phone,
                    address: address,
                    time: DateTime.now().toString(),
                  ));
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class Receiver {
  final String name;
  final String phone;
  final String address;
  final String time;

  Receiver({
    required this.name,
    required this.phone,
    required this.address,
    required this.time,
  });

  factory Receiver.fromJson(Map<String, dynamic> json) {
    return Receiver(
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      time: json['time'],
    );
  }
}
