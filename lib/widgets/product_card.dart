import 'package:flutter/material.dart';
import '../models/product.dart';
import '../pages/product_detail_page.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(child: Image.asset(
              product.image,
              height: 120,
              fit: BoxFit.contain,
            )
            ),
            const SizedBox(height: 8),
            Text(product.name,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('\$${product.price}'),
          ],
        ),
      ),
    );
  }
}
