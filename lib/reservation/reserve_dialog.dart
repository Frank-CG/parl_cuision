import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ReserveDialog extends StatelessWidget {
  final String title, reserve_time, buttonText;
  final Image image;

  String _defaultFontFamily = "Nunito Sans";

  Function() callback;

  ReserveDialog({
    @required this.title,
    @required this.reserve_time,
    @required this.buttonText,
    this.image,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            // bottom: Consts.padding,
            // left: Consts.padding,
            // right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: _defaultFontFamily,
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                width: 200,
                child: Text(
                  "Your reservation is accepeted:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: _defaultFontFamily,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Container(
                child: Text(
                  reserve_time,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontFamily: _defaultFontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                  callback();
                },
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(Consts.padding),
                      bottomRight: const Radius.circular(Consts.padding),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: const Offset(0.0, 10.0),
                      ),
                    ],
                  ),
                  child: Container(
                    height: Consts.padding * 3,
                    alignment: Alignment.center,
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: _defaultFontFamily,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: Consts.padding,
          right: Consts.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Consts.avatarRadius,
            child: Image.asset("assets/images/checkout_plate.png"),
          ),
          // child: Container,
        ),
        Positioned(
          top: Consts.padding * 3.5,
          left: Consts.padding * 1.6,
          right: Consts.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Consts.avatarRadius * 0.3,
            child: Image.asset(
              "assets/images/icon_pickuptime.png",
              // width: ScreenUtil.getInstance().setWidth(100),
            ),
          ),
        ),
      ],
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 88.0;
}
