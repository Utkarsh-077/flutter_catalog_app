// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:galaxy/models/catalog.dart';
import 'package:galaxy/utils/routes.dart';
import 'package:galaxy/widgets/drawer.dart';
import 'package:galaxy/widgets/home_widgets/catalog_header.dart';
import 'package:galaxy/widgets/home_widgets/catalog_list.dart';
import 'package:galaxy/widgets/item_widget.dart';
import 'package:galaxy/widgets/themes.dart';

import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        backgroundColor: context.canvasColor,
        floatingActionButton: FloatingActionButton(
          child: Icon(CupertinoIcons.cart),
          backgroundColor: MyTheme.darkBluishColor,
          onPressed:() => Navigator.pushNamed(context, MyRoutes.cartRoute),),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                    CircularProgressIndicator().centered().expand()
                  
              ],
            ),
          ),
        ));
  }
}




