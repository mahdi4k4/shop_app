import '../models/product.dart';

class CartManager {
  static final List<Product> cartItems = [];

  static void add(Product product) {
    cartItems.add(product);
  }

  static void remove(Product product) {
    cartItems.remove(product);
  }

  static int totalPrice() {
    return cartItems.fold(0, (sum, item) => sum + item.price);
  }
}
