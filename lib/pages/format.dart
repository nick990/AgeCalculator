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

  @override
  void initState() {
    super.initState();
    this._selectedFormat = widget.selectedFormat;
    _radioGroupValue = _formatList.indexOf(_selectedFormat);
  }

  void _radioChanged(int index) {
    setState(() {
      _radioGroupValue = index;
      this._selectedFormat = this._formatList[index];
    });
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
                children: this._formatList.asMap().entries.map((entry) {
                  int index = entry.key;
                  String format = entry.value;
                  return Container(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            groupValue: this._radioGroupValue,
                            onChanged: (index) => _radioChanged(index),
                            value: index,
                          ),
                          Text(
                            format,
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ));
                }).toList(),
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
