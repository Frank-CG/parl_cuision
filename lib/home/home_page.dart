import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:parl_cuision/authentication/authentication.dart';
import 'package:parl_cuision/common/common.dart';
import 'package:parl_cuision/information/information.dart';
import 'package:parl_cuision/menu/menu.dart';
import 'package:parl_cuision/reservation/reservation_page.dart';
//import 'package:parl_cuision/reservation/reservation.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
  
}


class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    MenuPage(),
    ReservationPage(),
    //PlaceholderWidget(Colors.orange),
    InfoPage(),
    PlaceholderWidget(Colors.green)
  ];

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          // iconSize: 18.0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            new BottomNavigationBarItem(icon: getImageIconBox('assets/images/icon_menu.png'), title: Text("Menu")),
            new BottomNavigationBarItem(icon: getImageIconBox("assets/images/icon_reservation.png"),title: Text("Resv")),
            new BottomNavigationBarItem(icon: getImageIconBox("assets/images/icon_info.png"), title: Text("Info")),
            new BottomNavigationBarItem(icon: getImageIconBox("assets/images/icon_cart.png"), title: Text("Cart")),
          ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
     _currentIndex = index;
    });
  }

  Widget getImageIconBox(String path){
    return SizedBox(
      child: Image.asset(path),
      width: 24,
      height: 24,
    );
  }
}
