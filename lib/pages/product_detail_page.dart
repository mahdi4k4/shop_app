import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/cart_manager.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product.image,
                height: 220,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.name,
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '${product.price} ریال',
              style: const TextStyle(
                  fontSize: 18, color: Colors.red),
            ),
            const SizedBox(height: 20),
            const Text(
              'توضیحات محصول',
              style:
              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16, height: 1.6),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black),
                onPressed: () {
                  CartManager.add(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('به سبد خرید اضافه شد')),
                  );
                },
                child: const Text('افزودن به سبد خرید'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
