import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;

import 'package:parl_cuision/common/common.dart';
import 'package:parl_cuision/reservation/reservation.dart';
import 'package:parl_cuision/reservation/steps_page.dart';

class ReservSteps extends StatefulWidget {
  @override
  _ReservStepsState createState() => new _ReservStepsState();
}

class _ReservStepsState extends State<ReservSteps> {
  String _pageCommonFontFamily = "Nunito Sans";

  final int steps_count = 4;
  int current_step = 0;
  double _kStepSize = 24.0;
  int _guestNumber = 1;
  String _dateValue = '';
  DateTime _selectedDate;
  DateTime _firstDate;
  DateTime _lastDate;

  @override
  void initState() {
    super.initState();

    _selectedDate = DateTime.now();
    _firstDate = DateTime.now().subtract(Duration(days: 45));
    _lastDate = DateTime.now().add(Duration(days: 45));
  }

  List<String> _stepTitles = <String>["GUESTS", "DATE", "TIME", "SUMMARY"];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 1125, height: 2436, allowFontScaling: true)
          ..init(context);

    return Container(
      width: ScreenUtil.getInstance().setWidth(1125),
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil.getInstance().setHeight(300),
            color: Colors.white,
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 14.0),
            child: _buildTopPath(steps_count),
          ),
          _getStepPage(current_step),
          _getNextButton(),
        ],
      ),
    );
  }

  // Widget _getNextButton() {
  //   return Container(
  //     child: Padding(
  //       padding: const EdgeInsets.only(
  //         top: 50.0,
  //       ),
  //       child: ButtonTheme(
  //         minWidth: ScreenUtil.getInstance().setWidth(850),
  //         child: RaisedButton(
  //           color: Colors.green,
  //           textColor: Colors.white,
  //           shape: new RoundedRectangleBorder(
  //               borderRadius: new BorderRadius.circular(10.0)),
  //           child: Text("Next Step"),
  //           onPressed: () {
  //             nextStep();
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _getNextButton() {
    return Container(
      child: ButtonTheme(
        minWidth: ScreenUtil.getInstance().setWidth(850),
        child: RaisedButton(
          color: Colors.green,
          textColor: Colors.white,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0)),
          child: Text("Next Step"),
          onPressed: () {
            nextStep();
          },
        ),
      ),
    );
  }

  Widget _buildTopPath(int stepCount) {
    List<Widget> children = <Widget>[];
    for (int i = 0; i < stepCount; i++) {
      children.add(_buildStep(i));
    }
    // children.add( _buildStep(stepCount-1, true) );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _buildStep(int index) {
    var stepTextStyle = TextStyle(
        fontSize: 10.0,
        fontFamily: "Nunito Sans",
        fontWeight: FontWeight.w700,
        color: _circleColor(index));
    List<Widget> step = <Widget>[];
    step.add(_buildLine(index, true));
    step.add(_buildCircle(index));
    step.add(_buildLine(index, false));
    // if(isLast){
    //   step.add(_buildLine(index+1));
    // }
    return Column(
      children: <Widget>[
        Row(
          children: step,
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          _stepTitles[index],
          style: stepTextStyle,
        ),
      ],
    );
  }

  Widget _buildLine(int index, bool isLeft) {
    int comp_num = 0;
    if (isLeft) {
      comp_num = current_step;
    } else {
      comp_num = current_step - 1;
    }
    return Container(
      width: ScreenUtil.getInstance().setWidth(85),
      height: 1.0,
      color: index <= comp_num ? Colors.green : Colors.grey.shade400,
    );
  }

  Color _circleColor(int index) {
    return index <= current_step ? Colors.green : Colors.grey.shade400;
  }

  Widget _buildCircle(int index) {
    return Container(
      width: _kStepSize,
      height: _kStepSize,
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: kThemeAnimationDuration,
        decoration: BoxDecoration(
          color: _circleColor(index),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 4,
          ),
          child: Text(
            (index + 1).toString(),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _getStepPage(int current_step) {
    Widget pageContent = null;
    int index = current_step + 1;
    String title = "-  STEP  $index  -";
    List<String> subtitles = <String>[
      "Pick number of guests",
      "Select the date",
      "Select time",
      "Summary"
    ];

    Color unSelectedTextColor = Colors.grey.shade600;
    TextStyle titleStyle = TextStyle(
      fontSize: 14,
      fontFamily: _pageCommonFontFamily,
      color: unSelectedTextColor,
      fontWeight: FontWeight.bold,
    );

    TextStyle subTitleStyle = TextStyle(
      fontSize: 20,
      fontFamily: _pageCommonFontFamily,
      color: unSelectedTextColor,
      fontWeight: FontWeight.bold,
    );

    switch (current_step) {
      case 0:
        pageContent = _getStepPageContent1();
        break;
      case 1:
        pageContent = _getStepPageContent2();
        break;
      case 2:
        pageContent = _getStepPageContent3();
        break;
      case 3:
        pageContent = _getStepPageContent4();
        break;
      default:
        break;
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
            ),
            child: Text(
              title,
              style: titleStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
            child: Text(
              subtitles[current_step],
              style: subTitleStyle,
            ),
          ),
          pageContent,
        ],
      ),
    );
  }

  Widget _getStepPageContent1() {
    TextStyle contentStyle = TextStyle(
      fontSize: 18.0,
      fontFamily: _pageCommonFontFamily,
      color: Colors.grey.shade600,
      fontWeight: FontWeight.bold,
    );

    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
            ),
            child: _buildPickCircle(_guestNumber, 130),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
              bottom: 50,
            ),
            child: Text(
              "8 guests maximum",
              style: contentStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPickCircle(int number, double diameter) {
    return Container(
      width: diameter + 60,
      height: diameter,
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: kThemeAnimationDuration,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.blueGrey,
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ButtonTheme(
              minWidth: 60,
              child: RaisedButton(
                color: Colors.green,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                textColor: Colors.white,
                child: Text(
                  "-",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                onPressed: () {
                  guestsPickOnTab(-1);
                },
              ),
            ),
            Text(
              number.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 60.0,
              ),
            ),
            ButtonTheme(
              minWidth: 60,
              child: RaisedButton(
                color: Colors.green,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                textColor: Colors.white,
                child: Text(
                  "+",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                onPressed: () {
                  guestsPickOnTab(1);
                },
              ),
            ),
          ],
        ),
        // child: Padding(
        //   padding: const EdgeInsets.only(top: 30,),
        //   child: Text(number.toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 60.0,),),
        // ),
      ),
    );
  }

  void guestsPickOnTab(int add) {
    setState(() {
      _guestNumber = _guestNumber + add;
      if (_guestNumber < 1) {
        _guestNumber = 1;
      }
      if (_guestNumber > 8) {
        _guestNumber = 8;
      }
    });
  }

  void _onSelectedDateChanged(DateTime newDate) {
    setState(() {
      _selectedDate = newDate;
      print(newDate);
    });
  }

  Widget _getStepPageContent2() {
    dp.DatePickerStyles styles = dp.DatePickerStyles(
      displayedPeriodTitle: TextStyle(
        color: Colors.green,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      defaultDateTextStyle: TextStyle(
        fontSize: 14.0,
      ),
      selectedDateStyle:
          Theme.of(context).accentTextTheme.body2.copyWith(color: Colors.white),
      selectedSingleDateDecoration:
          BoxDecoration(color: Colors.green, shape: BoxShape.circle),
    );

    return Container(
      height: 250,
      width: 330,
      margin: EdgeInsets.only(
        bottom: 20,
        top: 10,
      ),
      child: dp.DayPicker(
        selectedDate: _selectedDate,
        onChanged: _onSelectedDateChanged,
        firstDate: _firstDate,
        lastDate: _lastDate,
        datePickerStyles: styles,
      ),
    );
  }

  Widget _getStepPageContent3() {
    return Container(
      height: 250,
      width: 330,
      margin: EdgeInsets.only(
        bottom: 20,
        top: 10,
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top:20,),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[300],
                width: 1.0,
              ),
              borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
            ),
            // child: ButtonTheme(
            //   minWidth: 260,
            //   child: RaisedButton(
            //     color: Colors.transparent,
            //     shape: new RoundedRectangleBorder(
            //         borderRadius: new BorderRadius.circular(30.0)),
            //     onPressed: () {},
            //   ),
            // ),
          ),
        ],
      ),
    );
  }

  Widget _getStepPageContent4() {
    return PlaceholderWidget(Colors.green[300]);
  }

  void nextStep() {
    setState(() {
      current_step++;
    });
  }
}
