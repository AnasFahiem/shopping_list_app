import 'package:flutter/material.dart';
import './add_item.dart';
import '../data/dummy_items.dart';

class HomeBage extends StatelessWidget {
  const HomeBage({super.key});
  void _modalBottomSheetMenu(context) {
    Navigator.pushNamed(context, AddItem.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Groceries List'),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                color: ThemeData.dark().colorScheme.surface,
                child: Center(
                  child: Text(
                    'Shopping List',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
            _modalBottomSheetMenu(context);
          },
          child: Icon(Icons.add),
        ));
  }
}
