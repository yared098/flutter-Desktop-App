// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProductsshowWidget extends StatelessWidget {
  const ProductsshowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.25, // 25% of the window width
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.grey, width: 2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(1),
            child: Text(
              'Products',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Display 3 columns
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 20, // Total number of products
                    itemBuilder: (BuildContext context, int index) {
                      return Draggable<ProductItemData>(
                        data: ProductItemData(
                          icon: Icons.abc, // Replace with the actual image path
                          price: 19.99, // Replace with the actual price
                          quantity: 10, // Replace with the actual quantity
                        ),
                        feedback: Material(
                          child: ProductItem(
                            icon:
                                Icons.abc, // Replace with the actual image path
                            price: 19.99, // Replace with the actual price
                            quantity: 10, // Replace with the actual quantity
                            draggable: false,
                          ),
                        ),
                        child: ProductItem(
                          icon: Icons.abc, // Replace with the actual image path
                          price: 19.99, // Replace with the actual price
                          quantity: 10, // Replace with the actual quantity
                          draggable: true,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductItemData {
  final IconData icon;
  final double price;
  final int quantity;

  const ProductItemData({
    required this.icon,
    required this.price,
    required this.quantity,
  });
}

class ProductItem extends StatelessWidget {
  final IconData icon;
  final double price;
  final int quantity;
  final bool draggable;

  const ProductItem({
    required this.icon,
    required this.price,
    required this.quantity,
    required this.draggable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 10, color: Colors.black), // Display the product icon
          const SizedBox(height: 10),
          Text(
            'Price: \$${price.toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ), // Display the product price
          const SizedBox(height: 5),
          Text(
            'Quantity: $quantity',
            style: TextStyle(
              color: Colors.grey,
            ),
          ), // Display the product quantity
          if (draggable) const SizedBox(height: 10),
          if (draggable)
            Text(
              'Drag me',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ), // Display the draggable text
        ],
      ),
    );
  }
}
