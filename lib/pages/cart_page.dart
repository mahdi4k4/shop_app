import 'package:flutter/material.dart';
import '../data/cart_manager.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = CartManager.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text('سبد خرید'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (_, i) => ListTile(
                title: Text(items[i].name),
                trailing: Text('${items[i].price} ریال'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'جمع کل: ${CartManager.totalPrice()} ریال',
              style:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
