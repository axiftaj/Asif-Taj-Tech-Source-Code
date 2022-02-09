import 'package:bazar_updated/view/buyer/buyer_dashboard/buyer_home/buyer_home_screen.dart';
import 'package:bazar_updated/view/buyer/buyer_dashboard/buyer_orders/buyer_order_screen.dart';
import 'package:bazar_updated/view/buyer/buyer_dashboard/buyer_profile/buyer_profile_screen.dart';
import 'package:bazar_updated/view/buyer/buyer_dashboard/buyer_upcoming_order/buyer_upcoming_order_screen.dart';
import 'package:bazar_updated/view/utilz/CustomIcons/custom_icons.dart';
import 'package:bazar_updated/view/utilz/colors.dart';
import 'package:flutter/material.dart';

class BuyerDashboardScreen extends StatefulWidget {

  const BuyerDashboardScreen({Key? key}) : super(key: key);

  @override
  _BuyerDashboardScreenState createState() => _BuyerDashboardScreenState();
}

class _BuyerDashboardScreenState extends State<BuyerDashboardScreen> {

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    BuyerHomeScreen(),
    BuyerOrderScreen(),
    BuyerUpComingOrderScreen(),
    Text(
      'Contact on WhatsApp',
    ),
    BuyerProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,

        unselectedItemColor: Color(0xff8F92A1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Custom.homeIcon , size : 20  ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Custom.shoppingCart , size : 20  ),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Custom.orderIcon , size : 20  ),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone , size: 20,),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Custom.profileIcon , size: 20,),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: MyColors.primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
