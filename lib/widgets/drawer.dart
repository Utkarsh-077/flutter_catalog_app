// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_declarations

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final imageurl = "https://i.pinimg.com/originals/e5/dc/0f/e5dc0f26b9b76eb812df50644a23e873.jpg";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
               
              ),
              child: UserAccountsDrawerHeader(accountName: Text("Utkarsh Gupta", style: TextStyle(color: Colors.white,),), 
            accountEmail: Text("guptaji8840@gmail.com", style: TextStyle(color: Colors.white,),),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(imageurl),
            ),
            ),
            ),
            
            ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white,),
              title: Text("Home", textScaleFactor: 1.2, style: TextStyle(color: Colors.white ),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled, color: Colors.white,),
              title: Text("Profile", textScaleFactor: 1.2, style: TextStyle(color: Colors.white ),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail, color: Colors.white,),
              title: Text("Email", textScaleFactor: 1.2, style: TextStyle(color: Colors.white ),),
            ),
          ],
        ),
      ),
    );
  }
}