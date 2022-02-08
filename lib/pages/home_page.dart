// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galaxy/models/catalog.dart';
import 'package:galaxy/widgets/drawer.dart';
import 'package:galaxy/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   
  @override
  void initState() {
    
    super.initState();
    loadData();
  }

  loadData() async{
    await Future.delayed(Duration(seconds: 2));
     final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
     final decodeData = jsonDecode(catalogJson);

     var productData = decodeData["products"];

     CatalogModel.items = List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
     setState(() {});
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items.isNotEmpty) ?ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatalogModel.items[index],
            );
          },
        ): Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}