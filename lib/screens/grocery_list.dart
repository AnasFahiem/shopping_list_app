import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/grocery_item.dart';
import '../widgets/new_Item.dart';
import 'package:provider/provider.dart';

import 'new_itemscreen.dart';

class HomeBage extends StatefulWidget {
  const HomeBage({super.key});

  @override
  State<HomeBage> createState() => _HomeBageState();
}

class _HomeBageState extends State<HomeBage> {
  // void _addItem() async {
  //   print("done2");
  //   final newItem =
  //       await Navigator.of(context).push<GroceryItem>(MaterialPageRoute(
  //     builder: (context) => NewItem(),
  //   ));
  //   if (newItem == null) {
  //     return;
  //   }
  //   setState(() {
  //     groceryItems.add(newItem);
  //   });
  // }

  void _modalBottomSheet(context) async {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => NewItem(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  // final List groceryItems = [
  //   GroceryItem(
  //     id: '1',
  //     name: 'Apple',
  //     quantity: 2,
  //     category: categories[Categories.carbs]!,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Groceries List'),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                color: ThemeData.dark().colorScheme.surface,
                child: const Center(
                  child: Text(
                    'Shopping List',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 147, 229, 250),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Consumer<GrocerItemProvider>(
          builder: (context, groceryitem, child) {
            return ListView.builder(
              itemCount: groceryitem.groceryItems.length,
              itemBuilder: (context, index) {
                final item = groceryitem.groceryItems[index];
                return ListTile(
                  leading: ExcludeSemantics(
                    child: CircleAvatar(
                      backgroundColor: item.category.color,
                      child: Text(item.category.title[0]),
                    ),
                  ),
                  title: Text(item.name),
                  subtitle: Text(item.category.title),
                  trailing: Text('${item.quantity}'),
                );
              },
            );
          },
        ),
        floatingActionButton: Consumer<GrocerItemProvider>(
            builder: (context, groceryitem, child) {
          return FloatingActionButton(
            onPressed: () {
              //_modalBottomSheet(context);
              Navigator.of(context).pushNamed(NewItemScreen.routeName);
            },
            child: const Icon(Icons.add),
          );
        }));
  }
}
