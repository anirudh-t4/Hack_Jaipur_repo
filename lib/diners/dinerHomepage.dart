import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:maps/chefs/orderpages.dart';
import 'package:maps/diners/all_chefs_screen.dart';
import 'package:maps/diners/cart.dart';
import 'package:maps/diners/previousOrders.dart';
import 'package:maps/diners/storePage.dart';
import 'package:maps/services/authservice.dart';
import 'package:theme_provider/theme_provider.dart';
import 'chat.dart';
import 'package:maps/models/feedback.dart';
import 'package:maps/diners/cart/cartPage.dart';
import 'homemade.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class DinerHomePage extends StatefulWidget {
  @override
  _DinerHomePageState createState() => _DinerHomePageState();
}

class _DinerHomePageState extends State<DinerHomePage> {
   final AuthService _auth = AuthService();
   int _page = 0;
 GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
     final List<Widget>pageOption = [
StoresPage(),CartPage(),AllUsersScreen()
];
    return Scaffold(
      //appBar: ,
     
     body: pageOption[_page],

        bottomNavigationBar: CurvedNavigationBar(
        
          backgroundColor: Colors.white,
          color: Colors.redAccent[700],
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.local_dining, size: 30,),
            Icon(Icons.shopping_cart, size: 30),
            Icon(Icons.chat, size: 30),
            
          ],
          onTap:  onTabTapped, // new
            
        ),
        
        );
  }
        void onTabTapped(int index) {
   setState(() {
     _page = index;
   });
  }
}