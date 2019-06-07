import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parl_cuision/authentication/authentication.dart';
import 'package:parl_cuision/common/food_item.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => new _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool _filterItem1 = true;
  bool _filterItem2 = true;
  bool _filterItem3 = true;

  void _filterItem1Changed(bool v) => setState(() => _filterItem1 = v);
  void _filterItem2Changed(bool v) => setState(() => _filterItem2 = v);
  void _filterItem3Changed(bool v) => setState(() => _filterItem3 = v);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 1125, height: 2436, allowFontScaling: true)
          ..init(context);

    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              Container(
                height: ScreenUtil.getInstance().setHeight(280),
                padding: EdgeInsets.only(
                  left: ScreenUtil.getInstance().setWidth(63),
                  top: ScreenUtil.getInstance().setHeight(150),
                ),
                alignment: Alignment.topLeft,
                color: Colors.white,
                child: Text(
                  "Menu",
                  style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
                ),
              ),

              Container(
                padding: EdgeInsets.only(
                  left: ScreenUtil.getInstance().setWidth(63),
                  top: ScreenUtil.getInstance().setHeight(150),
                  bottom: ScreenUtil.getInstance().setHeight(57),
                ),
                alignment: Alignment.topLeft,
                color: Colors.white,
                child: Text(
                  "Filters",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(
                  left: 12.0,
                  top: 0.0,
                ),
                margin: EdgeInsets.all(0.0),
                height: 80,
                alignment: Alignment.centerLeft,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    border: new Border(
                        top: BorderSide(
                      color: Colors.grey[200],
                      width: 0.8,
                    ))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => _filterItem1Changed(!_filterItem1),
                      child: Container(
                        padding: EdgeInsets.only(
                          right: 8.0,
                          left: 8.0,
                        ),
                        decoration: new BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Colors.grey[200],
                              width: 0.8,
                            ),
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 80,
                              width: 60,
                            ),
                            Positioned(
                              top: 4.0,
                              right: 0,
                              child: Image.asset(
                                _filterItem1
                                    ? "assets/images/checked.png"
                                    : "assets/images/unchecked.png",
                                height: 13,
                                width: 13,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                child: Image.asset(
                                  "assets/images/a.png",
                                  height: 55.0,
                                  width: 50.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _filterItem2Changed(!_filterItem2),
                      child: Container(
                        padding: EdgeInsets.only(
                          right: 8.0,
                          left: 8.0,
                        ),
                        decoration: new BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Colors.grey[200],
                              width: 0.8,
                            ),
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 80,
                              width: 60,
                            ),
                            Positioned(
                              top: 4.0,
                              right: 0,
                              child: Image.asset(
                                _filterItem2
                                    ? "assets/images/checked.png"
                                    : "assets/images/unchecked.png",
                                height: 13,
                                width: 13,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                child: Image.asset(
                                  "assets/images/b.png",
                                  height: 55.0,
                                  width: 75.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _filterItem3Changed(!_filterItem3),
                      child: Container(
                        padding: EdgeInsets.only(
                          right: 8.0,
                          left: 8.0,
                        ),
                        // decoration: new BoxDecoration(border: Border(right:BorderSide(color: Colors.grey[200], width:0.8,),),),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 80,
                              width: 60,
                            ),
                            Positioned(
                              top: 4.0,
                              right: 0,
                              child: Image.asset(
                                _filterItem3
                                    ? "assets/images/checked.png"
                                    : "assets/images/unchecked.png",
                                height: 13,
                                width: 13,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                child: Image.asset(
                                  "assets/images/c.png",
                                  height: 45.0,
                                  width: 55.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                  top: 20.0,
                  left: 20.0,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.expand_more),
                    Text(
                      "Appetizers",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  child: FoodCardList(),
                ),
              ),
              // Expanded(child: Container(color: Colors.cyan,),),
            ],
          ),
          Positioned(
            top: 50,
            right: 0.0,
            child: Container(
              child: Image.asset(
                "assets/images/menu_plate.png",
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: Container(
      //   padding: EdgeInsets.only(top: 180.0, right: 0.0),
      //   child: Align(
      //     alignment: Alignment.topRight,
      //     child: Image.asset("assets/images/menu_plate.png", ),
      //   ),
      // ),
    );
  }
}
