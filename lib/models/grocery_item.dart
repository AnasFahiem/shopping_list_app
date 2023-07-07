import 'package:flutter/material.dart';
import 'package:shopping_list_app/screens/new_itemscreen.dart';

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

  void addGroceryItem(GroceryItem it) async {
    print("done2");

    if (it != null) {
      groceryItems.add(it);
      print("done3");
      notifyListeners();
    }
    return;
  }
}
