import 'package:flutter/material.dart';

import '../model/product_model.dart';

// TODO: II. Model connected InheritedWidget

class ProductService extends InheritedWidget {
  ProductService({super.key, required super.child});

  @override
  bool updateShouldNotify(ProductService oldWidget) {
    return items != oldWidget.items;
  }

  static ProductService of(BuildContext context) {
    ProductService? productService = context.dependOnInheritedWidgetOfExactType<ProductService>();
    return productService!;
  }

  final List<Product> items = [];
  int length = 0;

  void getAllProducts() {
    items.addAll([
      Product("1", "Apple", "5000", "https://images.unsplash.com/photo-1619546813926-a78fa6372cd2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
      Product("2", "Peach", "8000", "https://images.unsplash.com/photo-1642372849486-f88b963cb734?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"),
      Product("3", "Apricot", "6000", "https://images.unsplash.com/photo-1624835020714-f9521e3e1421?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"),
      Product("4", "Pear", "7000", "https://images.unsplash.com/photo-1615485925694-a03ef8fd9e12?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
    ]);
  }

  void onChange(Product product) {
    int index = items.indexOf(product);
    items[index].isSelected = !items[index].isSelected;
    length = items.where((product) => product.isSelected).toList().length;
  }

  List<Product> getAllOrders() {
    List<Product> orders = items.where((product) => product.isSelected).toList();
    return orders;
  }
}