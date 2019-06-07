import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepPage1 extends StatefulWidget {
  // StepPage1({Key key}) : super(key: key);

  Function(String) callback;
  StepPage1(this.callback);

  _StepPage1State createState() => _StepPage1State();
}

class _StepPage1State extends State<StepPage1> {
  int guestsNumber = 3;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
            ),
            child: Text("- STEP 1 -"),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
            child: Text("Pick number of guests"),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
            ),
            child: _buildPickCircle(guestsNumber, 130),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
            ),
            child: Text("8 guests maximum"),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
            ),
            child: ButtonTheme(
              minWidth: ScreenUtil.getInstance().setWidth(850),
              child: RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                child: Text("Next Step"),
                onPressed: () { widget.callback(guestsNumber.toString()); },
              ),
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
      guestsNumber = guestsNumber + add;
      if (guestsNumber < 1) {
        guestsNumber = 1;
      }
      if (guestsNumber > 8) {
        guestsNumber = 8;
      }
    });
  }
}
