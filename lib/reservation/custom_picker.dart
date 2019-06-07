import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class CustomPicker extends StatefulWidget {
  List<String> _options = <String>[];
  String _title = "";
  Function(String) callback;

  CustomPicker(this._title, this._options, this.callback);
  _CustomPickerState createState() => _CustomPickerState();
}

class _CustomPickerState extends State<CustomPicker> {
  int _selectedIndex = -1;

  TextStyle selectedStyle = TextStyle(
    fontSize: 18.0,
    fontFamily: "Nunito Sans",
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  TextStyle unSelectedStyle = TextStyle(
    fontSize: 18.0,
    fontFamily: "Nunito Sans",
    color: Colors.grey.shade600,
    fontWeight: FontWeight.bold,
  );

  TextStyle titleStyle = TextStyle(
    fontSize: 12.0,
    fontFamily: "Nunito Sans",
    fontWeight: FontWeight.bold,
  );

  void _itemOnSelected(int index) {
    setState(() {
      _selectedIndex = index;
      widget.callback(widget._title+":"+widget._options[index]);
    });
  }

  Widget _getItem(int index) {
    var contentStyle =
        index == _selectedIndex ? selectedStyle : unSelectedStyle;
    Color decorationColor =
        index == _selectedIndex ? Colors.green : Colors.transparent;
    return GestureDetector(
      onTap: () {
        _itemOnSelected(index);
      },
      child: Container(
        decoration: new BoxDecoration(color: decorationColor),
        child: new Text(
          widget._options[index],
          style: contentStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _ops = <Widget>[];
    for (int i = 0; i < widget._options.length; i++) {
      _ops.add(_getItem(i));
    }
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(25, 20, 25, 10),
          child: Text(widget._title,style: titleStyle,),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[300],
              width: 1.0,
            ),
            borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _ops,
          ),
        ),
      ],
    );
  }
}
