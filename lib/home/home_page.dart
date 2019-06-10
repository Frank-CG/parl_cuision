import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:parl_cuision/authentication/authentication.dart';
import 'package:parl_cuision/checkout/checkout_page.dart';
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
    // PlaceholderWidget(Colors.green)
    CheckoutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 1125, height: 2436, allowFontScaling: true)
          ..init(context);
          
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);

    Color selectedColor = Colors.green;
    Color unselectedColor = Colors.black;
    Color disabledColor = Colors.grey;

    Color itemColor = unselectedColor;

    List<BottomNavigationBarItem> barItems = <BottomNavigationBarItem>[];
    List<String> barItemsTitle = <String>["Menu", "Resv", "Info", "Cart"];
    List<String> barItemsIcon = <String>[
      'assets/images/icon_menu.png',
      'assets/images/icon_reservation.png',
      'assets/images/icon_info.png',
      'assets/images/icon_cart.png',
    ];
    for (int i = 0; i < 4; i++) {
      if (i == _currentIndex) {
        itemColor = selectedColor;
      } else {
        itemColor = unselectedColor;
      }
      if (_currentIndex > 0 && i == 3) {
        itemColor = disabledColor;
      }

      barItems.add(BottomNavigationBarItem(
          icon: getImageIconBox(barItemsIcon[i], itemColor),
          title: Text(barItemsTitle[i])));
    }

    var bottomBar = _currentIndex < 4
        ? BottomNavigationBar(
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            // iconSize: 18.0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: barItems,
          )
        : null;

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        height: ScreenUtil.getInstance().setHeight(180),
        child: bottomBar,
      ),
    );
  }

  void onTabTapped(int index) {
    if (_currentIndex > 0 && index == 3) {
      return;
    }
    if (index < 3) {
      setState(() {
        _currentIndex = index;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CheckoutPage()),
      );
    }
  }

  Widget getImageIconBox(String path, Color cl) {
    return SizedBox(
      child: Image.asset(
        path,
        color: cl,
      ),
      width: 24,
      height: 24,
    );
  }
}
