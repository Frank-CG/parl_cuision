import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:parl_cuision/authentication/authentication.dart';
import 'package:parl_cuision/checkout/checkout_page.dart';
import 'package:parl_cuision/common/common.dart';
import 'package:parl_cuision/information/information.dart';
import 'package:parl_cuision/menu/menu.dart';
import 'package:parl_cuision/profile/profile.dart';
import 'package:parl_cuision/reservation/reservation_page.dart';
import 'package:parl_cuision/scoped_model/order_model.dart';
//import 'package:parl_cuision/reservation/reservation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');

  int _currentIndex = 0;

  void _orderModelRefresh(){
    OrderModel orderModel = new OrderModel();
    orderModel.refreshOrder();
  }

  void _menuCallback() {
    setState(() {
      _currentIndex = 4;
    });
  }

  void _infoCallback() {
    setState(() {
      _currentIndex = 4;
    });
  }

  void _reserveCallback() {
    setState(() {
      _currentIndex = 0;
    });
  }

  void _checkoutCallback(bool isPlaced) {
    if(isPlaced){
      _orderModelRefresh();
    }
    setState(() {
      _currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 1125, height: 2436, allowFontScaling: true)
          ..init(context);

    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    final List<Widget> _children = [
      MenuPage(_menuCallback),
      ReservationPage(_reserveCallback),
      //PlaceholderWidget(Colors.orange),
      InfoPage(_infoCallback),
      // PlaceholderWidget(Colors.green)
      CheckoutPage(callback: _checkoutCallback,),
      SettingsPage(),
    ];

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
      // if (_currentIndex > 0 && i == 3) {
      //   itemColor = disabledColor;
      // }

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
            // key: globalKey,
          )
        : BottomNavigationBar(
            onTap: onTabTapped,
            currentIndex: 0,
            // iconSize: 18.0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: barItems,
            // key: globalKey,
          );

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        height: ScreenUtil.getInstance().setHeight(180),
        child: bottomBar,
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {},
      //   // icon: Icon(Icons.save),

      //   label: Image.asset(
      //     "assets/images/nav.png",
      //     height: ScreenUtil.getInstance().setHeight(176 * 1.2),
      //     width: ScreenUtil.getInstance().setWidth(247 * 1.2),
      //   ),
      // ),
    );
  }

  void onTabTapped(int index) {
    // if (_currentIndex > 0 && index == 3) {
    //   return;
    // }
    if (index < 3) {
      setState(() {
        _currentIndex = index;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CheckoutPage(callback: _checkoutCallback,)),
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
