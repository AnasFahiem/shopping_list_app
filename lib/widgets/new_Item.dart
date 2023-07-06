import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';
import '../models/category.dart';

class NewItem extends StatelessWidget {
  const NewItem({super.key});

  void _save(context) {}
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.70,
      child: Padding(
        padding: const EdgeInsets.all(12),
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
              maxLength: 50,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: const Text('Quantity'),
                    ),
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<Category>(
                    decoration: InputDecoration(
                      label: const Text('Category'),
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
                                SizedBox(width: 8),
                                Text(category.value.title),
                              ],
                            ))
                    ],
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('reset'),
                ),
                ElevatedButton(
                  onPressed: () => _save(context),
                  child: Text('Add Item'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
