import 'package:flutter/material.dart';

class Format extends StatefulWidget {
  final String selectedFormat;
  Format({Key key, @required this.selectedFormat}) : super(key: key);
  @override
  _FormatState createState() => _FormatState();
}

class _FormatState extends State<Format> {
  List<String> _formatList = [
    "dd-MM-yyyy",
    "yyyy-MM-dd",
    "MM-dd-yyyy",
  ];

  String _selectedFormat;
  int _radioGroupValue;

  var _radioButtons;

  @override
  void initState() {
    super.initState();
    this._selectedFormat = widget.selectedFormat;
    _radioGroupValue = _formatList.indexOf(_selectedFormat);
    _createRadioButtons();
  }

  void _createRadioButtons() {
    _radioButtons = List<Widget>();
    for (int i = 0; i < _formatList.length; i++) {
      _radioButtons.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Radio(
            value: i,
            groupValue: _radioGroupValue,
            onChanged: (index) => _radioChanged(index),
          ),
          Text(_formatList[i]),
        ],
      ));
    }
  }

  void _radioChanged(int index) {
    setState(() {
      _radioGroupValue = index;
      this._selectedFormat = this._formatList[index];
      _createRadioButtons();
    });
    //Navigator.pop(context, _selectedFormat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date format'),
        actions: [
          IconButton(
              icon: Icon(Icons.check),
              onPressed: () => Navigator.pop(context, _selectedFormat))
        ],
      ),
      body: WillPopScope(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _radioButtons,
              ),
            ),
          ),
          onWillPop: () {
            Navigator.pop(context, _selectedFormat);
            return new Future(() => false);
          }),
    );
  }
}
