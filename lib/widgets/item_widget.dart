// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:galaxy/models/catalog.dart';

// ignore: use_key_in_widget_constructors
class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : assert(item != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap:() {
          print("{item.name} is pressed");
        },
        leading: Image.network(item.image),
            title: Text(item.name),
            subtitle: Text(item.desc),
            trailing: Text("\$${item.price}", textScaleFactor: 1.5, style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
            ),
          ),
    );
    
        
}

}