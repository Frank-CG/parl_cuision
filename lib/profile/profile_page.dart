import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parl_cuision/authentication/authentication.dart';

class SettingsPage extends StatefulWidget {
  // const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _defaultFontFamily = "Nunito Sans";
  TextStyle _tileStyle = TextStyle(
    fontSize: ScreenUtil.getInstance().setSp(62.0),
    fontFamily: "Nunito Sans",
    fontWeight: FontWeight.bold,
  );
  TextStyle _subtitleStyle = TextStyle(
    fontSize: ScreenUtil.getInstance().setSp(48.0),
    fontFamily: "Nunito Sans",
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  bool isPickup = true;
  bool isReservation = true;
  AuthenticationBloc atb;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 1125, height: 2436, allowFontScaling: true)
          ..init(context);

    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    this.atb = authenticationBloc;

    return Container(
      // height: ScreenUtil.getInstance().setHeight(800),
      alignment: Alignment.topLeft,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            _pageTop(),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(40),
            ),
            _profileInfo(),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(40),
            ),
            _notification(),
          ],
        ),
      ),
    );
  }

  Widget _pageTop() {
    return Container(
      height: ScreenUtil.getInstance().setHeight(400),
      // color: Colors.yellow,
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil.getInstance().setWidth(680),
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil.getInstance().setWidth(75),
              ),
              child: Text(
                "Settings",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(110.0),
                    fontFamily: _defaultFontFamily,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(445),
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                // Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  "assets/images/nav.png",
                  height: ScreenUtil.getInstance().setHeight(176 * 1.2),
                  width: ScreenUtil.getInstance().setWidth(247 * 1.2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileInfo() {
    TextStyle _labelStyle = TextStyle(
      color: Colors.grey,
      fontSize: 12.0,
      fontFamily: _defaultFontFamily,
      fontWeight: FontWeight.bold,
    );
    TextStyle _inputStyle = TextStyle(
      color: Colors.grey,
      fontSize: 14.0,
      fontFamily: _defaultFontFamily,
      fontWeight: FontWeight.bold,
    );
    return Container(
      height: ScreenUtil.getInstance().setHeight(580),
      alignment: Alignment.topLeft,
      // color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: ScreenUtil.getInstance().setWidth(1125),
            // alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil.getInstance().setWidth(75),
                right: ScreenUtil.getInstance().setWidth(75),
              ),
              child: Text(
                "Profile information",
                style: _tileStyle,
              ),
            ),
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(1125),
            padding: EdgeInsets.only(
              left: ScreenUtil.getInstance().setWidth(75),
              right: ScreenUtil.getInstance().setWidth(75),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: ScreenUtil.getInstance().setWidth(420),
                  child: TextField(
                    style: _inputStyle,
                    controller: _getTextController("Mark"),
                    decoration: InputDecoration(
                      labelText: "FIRST NAME",
                      labelStyle: _labelStyle,
                      isDense: true,
                      contentPadding: EdgeInsets.only(
                        top: 8.0,
                        bottom: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil.getInstance().setWidth(80),
                ),
                Container(
                  width: ScreenUtil.getInstance().setWidth(420),
                  child: TextField(
                    style: _inputStyle,
                    controller: _getTextController("Smith"),
                    decoration: InputDecoration(
                      labelText: "LAST NAME",
                      labelStyle: _labelStyle,
                      isDense: true,
                      contentPadding: EdgeInsets.only(
                        top: 8.0,
                        bottom: 2.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(1125),
            padding: EdgeInsets.only(
              top: ScreenUtil.getInstance().setWidth(20),
              left: ScreenUtil.getInstance().setWidth(75),
              right: ScreenUtil.getInstance().setWidth(75),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: ScreenUtil.getInstance().setWidth(940),
                  child: TextField(
                    style: _inputStyle,
                    controller: _getTextController("msmith@gmail.com"),
                    decoration: InputDecoration(
                      labelText: "EMAIL",
                      labelStyle: _labelStyle,
                      isDense: true,
                      contentPadding: EdgeInsets.only(
                        top: 8.0,
                        bottom: 2.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(1125),
            padding: EdgeInsets.only(
              top: ScreenUtil.getInstance().setWidth(20),
              left: ScreenUtil.getInstance().setWidth(75),
              right: ScreenUtil.getInstance().setWidth(75),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: ScreenUtil.getInstance().setWidth(940),
                  child: TextField(
                    style: _inputStyle,
                    controller: _getTextController("514-999-2464"),
                    decoration: InputDecoration(
                      labelText: "PHONE",
                      labelStyle: _labelStyle,
                      isDense: true,
                      contentPadding: EdgeInsets.only(
                        top: 8.0,
                        bottom: 2.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextEditingController _getTextController(String defaultText) {
    TextEditingController _textController = new TextEditingController();
    _textController.text = defaultText;
    return _textController;
  }

  Widget _notification() {
    TextStyle _labelStyle = TextStyle(
      color: Colors.grey,
      fontSize: 18.0,
      fontFamily: _defaultFontFamily,
      fontWeight: FontWeight.bold,
    );
    return Container(
      height: ScreenUtil.getInstance().setHeight(1100),
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Container(
            width: ScreenUtil.getInstance().setWidth(1125),
            padding: EdgeInsets.only(
              top: ScreenUtil.getInstance().setHeight(75),
              left: ScreenUtil.getInstance().setWidth(75),
              right: ScreenUtil.getInstance().setWidth(75),
            ),
            // alignment: Alignment.bottomLeft,
            child: Text(
              "Notifications",
              style: _tileStyle,
            ),
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(1125),
            // color: Colors.yellow,
            padding: EdgeInsets.only(
              top: ScreenUtil.getInstance().setHeight(30),
              left: ScreenUtil.getInstance().setWidth(75),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: ScreenUtil.getInstance().setWidth(220),
                  child: Text(
                    "Pickup",
                    style: _labelStyle,
                  ),
                ),
                Container(
                  width: ScreenUtil.getInstance().setWidth(160),
                  child: Switch(
                    value: isPickup,
                    onChanged: (value) {
                      setState(() {
                        isPickup = value;
                      });
                    },
                    activeTrackColor: Colors.green,
                    activeColor: Colors.white,
                  ),
                ),
                SizedBox(
                  width: ScreenUtil.getInstance().setWidth(60),
                ),
                Container(
                  width: ScreenUtil.getInstance().setWidth(280),
                  child: Text(
                    "Reservation",
                    style: _labelStyle,
                  ),
                ),
                Container(
                  width: ScreenUtil.getInstance().setWidth(160),
                  child: Switch(
                    value: isReservation,
                    onChanged: (value) {
                      setState(() {
                        isReservation = value;
                      });
                    },
                    activeTrackColor: Colors.green,
                    activeColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey[300],
            margin: EdgeInsets.only(
              top: ScreenUtil.getInstance().setHeight(10),
              left: ScreenUtil.getInstance().setWidth(75),
              right: ScreenUtil.getInstance().setWidth(75),
            ),
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(1125),
            padding: EdgeInsets.only(
              top: ScreenUtil.getInstance().setHeight(20),
              bottom: ScreenUtil.getInstance().setHeight(20),
              left: ScreenUtil.getInstance().setWidth(75),
              right: ScreenUtil.getInstance().setWidth(75),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: ScreenUtil.getInstance().setWidth(750),
                  child: Text(
                    "Payment information",
                    style: _tileStyle,
                  ),
                ),
                Container(
                  width: ScreenUtil.getInstance().setWidth(150),
                  child: Icon(
                    Icons.lock_outline,
                    color: Colors.green,
                    size: 30,
                  ),
                ),
                Container(
                  width: ScreenUtil.getInstance().setWidth(50),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.green,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey[300],
            margin: EdgeInsets.only(
              top: ScreenUtil.getInstance().setHeight(10),
              left: ScreenUtil.getInstance().setWidth(75),
              right: ScreenUtil.getInstance().setWidth(75),
            ),
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(1125),
            padding: EdgeInsets.only(
              top: ScreenUtil.getInstance().setHeight(20),
              bottom: ScreenUtil.getInstance().setHeight(20),
              left: ScreenUtil.getInstance().setWidth(75),
              right: ScreenUtil.getInstance().setWidth(75),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: ScreenUtil.getInstance().setWidth(750),
                  child: Text(
                    "Change password",
                    style: _tileStyle,
                  ),
                ),
                Container(
                  width: ScreenUtil.getInstance().setWidth(150),
                  child: Icon(
                    Icons.lock_outline,
                    color: Colors.green,
                    size: 30,
                  ),
                ),
                Container(
                  width: ScreenUtil.getInstance().setWidth(50),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.green,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey[300],
            margin: EdgeInsets.only(
              top: ScreenUtil.getInstance().setHeight(10),
              left: ScreenUtil.getInstance().setWidth(75),
              right: ScreenUtil.getInstance().setWidth(75),
            ),
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(240),
            padding: EdgeInsets.only(
              top: ScreenUtil.getInstance().setHeight(60),
              bottom: ScreenUtil.getInstance().setHeight(80),
            ),
            child: GestureDetector(
              onTap: _logout,
              child: Container(
                width: ScreenUtil.getInstance().setWidth(300),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.green,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green,
                ),
                child: Text(
                  "Logout",
                  style: _subtitleStyle,
                ),
              ),
            ),
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(160),
            width: ScreenUtil.getInstance().setWidth(900),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.green,
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: GestureDetector(
              onTap: () {
                print("Profile Save");
                // Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment(0, 0),
                color: Colors.green,
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: _defaultFontFamily,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _logout() {
    atb.dispatch(LoggedOut());
    // Navigator.pop(context);
  }
}
