import 'package:flutter/material.dart';

import '../widgets/new_Item.dart';
import './category.dart';

class GroceryItem {
  final String id;
  final String name;
  final int quantity;
  final Category category;

  GroceryItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });
}

class GrocerItemProvider with ChangeNotifier {
  List<GroceryItem> groceryItems = [];

  void addGroceryItem(context) async {
    print("done2");
    final newItem =
        await Navigator.of(context).push<GroceryItem>(MaterialPageRoute(
      builder: (context) => NewItem(),
    ));
    if (newItem == null) {
      return;
    }
    groceryItems.add(newItem);
    notifyListeners();
  }
}
