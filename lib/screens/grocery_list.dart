import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/grocery_item.dart';
import '../widgets/new_Item.dart';

class HomeBage extends StatefulWidget {
  HomeBage({super.key});

  @override
  State<HomeBage> createState() => _HomeBageState();
}

class _HomeBageState extends State<HomeBage> {
  void _addItem(context) async {
    final newItem =
        await Navigator.of(context).push<GroceryItem>(MaterialPageRoute(
      builder: (context) => NewItem(),
    ));

    if (newItem != null) {
      groceryItems.add(newItem);
    }
  }

  final List groceryItems = [];

  void _modalBottomSheet(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => NewItem(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

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
        body: ListView.builder(
          itemCount: groceryItems.length,
          itemBuilder: (context, index) {
            final item = groceryItems[index];
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
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _modalBottomSheet(context);
          },
          child: const Icon(Icons.add),
        ));
  }
}
