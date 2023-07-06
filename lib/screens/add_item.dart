import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';
import '../models/category.dart';

class AddItem extends StatelessWidget {
  static const routeName = '/add-item';
  const AddItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Item'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Item Name',
                ),
              ),
              SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Quantity',
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {},
                child: Text('Add Item'),
              ),
            ],
          ),
        ));
  }
}
