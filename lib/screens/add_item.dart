// import 'package:flutter/material.dart';
// import 'package:shopping_list_app/data/categories.dart';
// import '../models/category.dart';

// class AddItem extends StatelessWidget {
//   static const routeName = '/add-item';
//   const AddItem({super.key});

//   void _save(context) {}
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Add Item'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   labelText: 'Item Name',
//                 ),
//               ),
//               SizedBox(height: 12),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextFormField(
//                     decoration: InputDecoration(
//                       label: Text('Quantity'),
//                     ),
//                     initialValue: "1",
//                     validator: (value) {
//                       return null;
//                     },
//                   ),
//                   DropdownButtonFormField<Category>(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       label: Text('Category'),
//                     ),
//                     items: [
//                       for (final category in categories.entries)
//                         DropdownMenuItem(
//                             value: category.value,
//                             child: Row(
//                               children: [
//                                 CircleAvatar(
//                                   maxRadius: 16,
//                                   backgroundColor: category.value.color,
//                                   child: Text(category.value.title[0]),
//                                 ),
//                                 SizedBox(width: 12),
//                                 Text(category.value.title),
//                               ],
//                             )),
//                     ],
//                     onChanged: (value) {},
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text('reset'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () => _save(context),
//                     child: Text('Add Item'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
// }
