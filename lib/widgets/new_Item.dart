import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';
import 'package:shopping_list_app/models/grocery_item.dart';
import '../models/category.dart';

class NewItem extends StatefulWidget {
  NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();

  var _itemName = "";
  var _itemQuantity = 1;
  var _itemCategory = categories[Categories.vegetables]!;

  void _save(context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.of(context).pop(GroceryItem(
        id: DateTime.now().toString(),
        name: _itemName,
        quantity: _itemQuantity,
        category: _itemCategory,
      ));
      print(_itemName);
    }
  }

  void _reset(context) {
    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.70,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "+ Add New Item +",
                  style: TextStyle(
                    color: Color.fromARGB(255, 147, 229, 250),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Item Name',
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'must be between 1 and 50 characters';
                  }
                  return null;
                },
                maxLength: 50,
                keyboardType: TextInputType.name,
                onSaved: (value) {
                  _itemName = value!;
                },
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      initialValue: "1",
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'must be a (+ve) number';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        _itemQuantity = int.tryParse(val!)!;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<Category>(
                      onSaved: (value) {
                        _itemCategory = value!;
                      },
                      decoration: const InputDecoration(
                        label: Text('Category'),
                      ),
                      items: [
                        for (final category in categories.entries)
                          DropdownMenuItem(
                              value: category.value,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    maxRadius: 16,
                                    backgroundColor: category.value.color,
                                    child: Text(category.value.title[0]),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(category.value.title),
                                ],
                              ))
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => _reset(context),
                    child: const Text('reset'),
                  ),
                  ElevatedButton(
                    onPressed: () => _save(context),
                    child: const Text('Add Item'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
