import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoPage extends StatelessWidget {
  String _pageCommonFontFamily = "Nunito Sans";

  Function() callback;

  InfoPage(this.callback);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 1125, height: 2436, allowFontScaling: true)
          ..init(context);
    print('Device width:${ScreenUtil.screenWidth}'); //Device width
    print('Device height:${ScreenUtil.screenHeight}'); //Device height
    print(
        'Device pixel density:${ScreenUtil.pixelRatio}'); //Device pixel density
    print(
        'Bottom safe zone distance:${ScreenUtil.bottomBarHeight}'); //Bottom safe zone distance，suitable for buttons with full screen
    print(
        'Status bar height:${ScreenUtil.statusBarHeight}px'); //Status bar height , Notch will be higher Unit px
    print(
        'Ratio of actual width dp to design draft px:${ScreenUtil.getInstance().scaleWidth}');
    print(
        'Ratio of actual height dp to design draft px:${ScreenUtil.getInstance().scaleHeight}');
    print(
        'The ratio of font and width to the size of the design:${ScreenUtil.getInstance().scaleWidth * ScreenUtil.pixelRatio}');
    print(
        'The ratio of  height width to the size of the design:${ScreenUtil.getInstance().scaleHeight * ScreenUtil.pixelRatio}');

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          InfoTop(),
          Hours(),
          SizedBox(
            height: 40,
          ),
          Divider(
            color: Colors.grey[500],
            height: 2,
          ),
          SizedBox(
            height: 20,
          ),
          Payment(),
          SizedBox(
            height: 40,
          ),
          Divider(
            color: Colors.grey[500],
            height: 2,
          ),
          SizedBox(
            height: 20,
          ),
          Contact(),
        ],
      ),
    );
  }

  Widget InfoTop() {
    var contentTextStyle = new TextStyle(
      fontSize: 18.0,
      fontFamily: 'Nunito Sans',
    );
    return Container(
      height: ScreenUtil.getInstance().setHeight(933),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: ScreenUtil.getInstance().setWidth(680),
                height: ScreenUtil.getInstance().setHeight(333),
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                  ),
                  child: Text(
                    "Information",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(110.0),
                        fontFamily: _pageCommonFontFamily,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () { callback(); },
                child: Container(
                  width: ScreenUtil.getInstance().setWidth(445),
                  height: ScreenUtil.getInstance().setHeight(333),
                  alignment: Alignment.bottomRight,
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
          Row(
            children: <Widget>[
              Container(
                width: ScreenUtil.getInstance().setWidth(1120),
                height: ScreenUtil.getInstance().setHeight(600),
                padding: EdgeInsets.only(
                  left: 24.0,
                  top: 24.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Canadian dining at its finest.",
                      style: contentTextStyle,
                    ),
                    Text(
                      "Come explore a new,",
                      style: contentTextStyle,
                    ),
                    Text(
                      "completely renovated",
                      style: contentTextStyle,
                    ),
                    Text(
                      "dining room with food",
                      style: contentTextStyle,
                    ),
                    Text(
                      "and drinks.",
                      style: contentTextStyle,
                    ),
                  ],
                ),
              ),
              // Container(
              //   width: ScreenUtil.getInstance().setWidth(445),
              //   height: ScreenUtil.getInstance().setHeight(600),
              //   color: Colors.orange,
              //   child: Align(
              //     alignment: Alignment(1,2),
              //     child: Image.asset("assets/images/plate_info.png"),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Hours() {
    var dataFontStyle = new TextStyle(
        fontFamily: _pageCommonFontFamily,
        fontSize: 14.0,
        fontWeight: FontWeight.w800,
        color: Colors.grey[700]);
    var dataDivider = new Divider(
      color: Colors.grey[300],
      height: 1,
    );
    var blankLine = new SizedBox(
      height: 8.0,
    );
    return Container(
      padding: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(119)),
      width: ScreenUtil.getInstance().setWidth(983),
      // height: ScreenUtil.getInstance().setHeight(1211),
      // alignment: Alignment.center,
      // color: Colors.orangeAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            "assets/images/icon_hours.png",
            width: 54,
            height: 55,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Hours",
              style: TextStyle(
                fontSize: 24.0,
                fontFamily: _pageCommonFontFamily,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          blankLine,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                "assets/images/icon_remove_18dp.png",
                color: Colors.green,
              ),
              Text(
                "  DURING SITTING WEEKS",
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: _pageCommonFontFamily,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          blankLine,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(320),
                child: Text("Breakfast",
                    style: dataFontStyle, textAlign: TextAlign.start),
              ),
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(320),
                child: Text("7am to 9am",
                    style: dataFontStyle, textAlign: TextAlign.start),
              ),
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(320),
                child: Text("Tue to Thu",
                    style: dataFontStyle, textAlign: TextAlign.right),
              ),
            ],
          ),
          dataDivider,
          blankLine,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(320),
                child: Text("Lunch",
                    style: dataFontStyle, textAlign: TextAlign.start),
              ),
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(320),
                child: Text("11am to 1:30pm",
                    style: dataFontStyle, textAlign: TextAlign.start),
              ),
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(320),
                child: Text("Mon to Fri",
                    style: dataFontStyle, textAlign: TextAlign.right),
              ),
            ],
          ),
          dataDivider,
          blankLine,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(320),
                child: Text(
                  "Bar menu",
                  style: dataFontStyle,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(320),
                child: Text("3pm to 5pm",
                    style: dataFontStyle, textAlign: TextAlign.start),
              ),
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(320),
                child: Text("Mon to Thu",
                    style: dataFontStyle, textAlign: TextAlign.right),
              ),
            ],
          ),
          dataDivider,
          blankLine,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(320),
                child: Text("Dinner",
                    style: dataFontStyle, textAlign: TextAlign.start),
              ),
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(320),
                child: Text("5pm to 8pm",
                    style: dataFontStyle, textAlign: TextAlign.start),
              ),
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(320),
                child: Text("Mon to Thu",
                    style: dataFontStyle, textAlign: TextAlign.right),
              ),
            ],
          ),
          dataDivider,
          SizedBox(
            height: 40.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                "assets/images/icon_remove_18dp.png",
                color: Colors.green,
              ),
              Text(
                "  DURING RECESS WEEKS",
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: _pageCommonFontFamily,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          blankLine,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(320),
                child: Text("Lunch",
                    style: dataFontStyle, textAlign: TextAlign.start),
              ),
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(320),
                child: Text("11am to 1:30pm",
                    style: dataFontStyle, textAlign: TextAlign.start),
              ),
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(320),
                child:
                    Text(" ", style: dataFontStyle, textAlign: TextAlign.right),
              ),
            ],
          ),
          dataDivider,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(320),
                child:
                    Text(" ", style: dataFontStyle, textAlign: TextAlign.start),
              ),
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(630),
                child: Text("*Closed during summer brakes",
                    style: dataFontStyle, textAlign: TextAlign.start),
              ),
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(10),
                child:
                    Text(" ", style: dataFontStyle, textAlign: TextAlign.right),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Payment() {
    String title = "Payment";
    String content = "We accept Apple Pay, credit cards, debit cards and cash.";

    var dataFontStyle = new TextStyle(
        fontFamily: _pageCommonFontFamily,
        fontSize: 18.0,
        fontWeight: FontWeight.w300,
        color: Colors.grey[500]);
    var blankLine = new SizedBox(
      height: 8.0,
    );

    return Container(
      width: ScreenUtil.getInstance().setWidth(983),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            "assets/images/icon_payment.png",
            width: 54,
            height: 55,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontFamily: _pageCommonFontFamily,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24.0,
              bottom: 24.0,
            ),
            child: Text(
              content,
              style: dataFontStyle,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                "assets/images/pay-ApplePay-dark.png",
                width: ScreenUtil.getInstance().setWidth(160),
                height: ScreenUtil.getInstance().setHeight(96),
              ),
              Image.asset(
                "assets/images/pay-Visa-dark.png",
                width: ScreenUtil.getInstance().setWidth(160),
                height: ScreenUtil.getInstance().setHeight(96),
              ),
              Image.asset(
                "assets/images/pay-MasterCard-dark.png",
                width: ScreenUtil.getInstance().setWidth(160),
                height: ScreenUtil.getInstance().setHeight(96),
              ),
              Image.asset(
                "assets/images/pay-debit.png",
                width: ScreenUtil.getInstance().setWidth(160),
                height: ScreenUtil.getInstance().setHeight(96),
              ),
              Image.asset(
                "assets/images/pay-cash.png",
                width: ScreenUtil.getInstance().setWidth(160),
                height: ScreenUtil.getInstance().setHeight(96),
              ),
            ],
          ),
          blankLine,
        ],
      ),
    );
  }

  Widget Contact() {
    String addr1 = "Room 139-N, West Block";
    String phone1 = "613-992-2758";
    String addr2 = "Room 130-A, West Block";
    String phone2 = "613-992-1497";
    String phone3 = "613-992-7407";

    var dataFontStyle = new TextStyle(
        fontFamily: _pageCommonFontFamily,
        fontSize: 14.0,
        fontWeight: FontWeight.w800,
        color: Colors.grey[500]);
    var dataDivider = new Divider(
      color: Colors.grey[300],
      height: 1,
    );
    return Container(
      padding: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(119)),
      width: ScreenUtil.getInstance().setWidth(983),
      // height: ScreenUtil.getInstance().setHeight(1211),
      // alignment: Alignment.center,
      // color: Colors.orangeAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            "assets/images/icon_contact.png",
            width: 54,
            height: 55,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Contact",
              style: TextStyle(
                fontSize: 24.0,
                fontFamily: _pageCommonFontFamily,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          blankLine(1),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                "assets/images/icon_remove_18dp.png",
                color: Colors.green,
              ),
              Text(
                "  PARLIAMENTARY DINING ROOM",
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: _pageCommonFontFamily,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          blankLine(3),
          Text(
            addr1,
            style: dataFontStyle,
          ),
          dataDivider,
          blankLine(1),
          Text(
            "Phone: " + phone1,
            style: dataFontStyle,
          ),
          blankLine(3),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                "assets/images/icon_remove_18dp.png",
                color: Colors.green,
              ),
              Text(
                "  WEST BLOCK CAFETERIA",
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: _pageCommonFontFamily,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          blankLine(3),
          Text(
            addr2,
            style: dataFontStyle,
          ),
          dataDivider,
          blankLine(1),
          Text(
            "Phone: " + phone2,
            style: dataFontStyle,
          ),
          blankLine(3),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                "assets/images/icon_remove_18dp.png",
                color: Colors.green,
              ),
              Text(
                "  CATERING SERVICE",
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: _pageCommonFontFamily,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          blankLine(3),
          Text(
            "Phone: " + phone3,
            style: dataFontStyle,
          ),
          blankLine(24),
        ],
      ),
    );
  }

  SizedBox blankLine(int lines) {
    return SizedBox(
      height: 8.0 * lines,
    );
  }
}
