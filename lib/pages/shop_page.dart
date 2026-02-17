import 'package:flutter/material.dart';
import '../data/product_loader.dart';
import '../models/product.dart';
import 'product_detail_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String searchText = '';
  String selectedCategory = 'ALL';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Text(
                'دسته‌بندی‌ها',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            categoryItem('ALL'),
            categoryItem('GPU'),
            categoryItem('CPU'),
            categoryItem('SSD'),
            categoryItem('RAM'),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: TextField(
          onChanged: (value) {
            setState(() {
              searchText = value;
            });
          },
          decoration: const InputDecoration(
            hintText: 'جستجوی محصول...',
            border: InputBorder.none,
          ),
        ),
      ),
      body: FutureBuilder<List<Product>>(
        future: ProductLoader.loadProducts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final products = snapshot.data!
              .where((p) =>
          p.name.contains(searchText) &&
              (selectedCategory == 'ALL' ||
                  p.category == selectedCategory))
              .toList();

          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final p = products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ProductDetailPage(product: p),
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.network(
                          p.image,
                          height: 130,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          p.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '${p.price} ریال',
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              );
            },
          );
        },
      ),
    );
  }

  ListTile categoryItem(String name) {
    return ListTile(
      title: Text(name),
      onTap: () {
        setState(() {
          selectedCategory = name;
        });
        Navigator.pop(context);
      },
    );
  }
}
