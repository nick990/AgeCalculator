import 'package:age_calculator/models/MyDate.dart';
import 'package:age_calculator/providers/mydates_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MyDateEditModal extends StatefulWidget {
  final DateFormat formatter;
  final MyDate myDate;

  const MyDateEditModal({Key key, this.formatter, this.myDate})
      : super(key: key);
  @override
  _MyDateEditModalState createState() => _MyDateEditModalState();
}

class _MyDateEditModalState extends State<MyDateEditModal> {
  final nameController = TextEditingController();
  final birthdayController = TextEditingController();
  DateTime birthdayDate;
  DateTime todayDate;

  @override
  void initState() {
    var now = DateTime.now();
    todayDate = new DateTime(now.year, now.month, now.day);
    birthdayDate = widget.myDate.birthday;
    nameController.text = widget.myDate.name;
  }

  void _submitData(BuildContext context) {
    final enteredName = nameController.text;
    if (enteredName.isEmpty) {
      return;
    }
    widget.myDate.Update(enteredName, birthdayDate);
    Provider.of<MyDatesProvider>(context, listen: false).update(widget.myDate);
    Navigator.of(context).pop();
  }

  _selectBirthdayDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: birthdayDate = birthdayDate, // Refer step 1
        firstDate: DateTime(1900),
        lastDate: this.todayDate,
        initialDatePickerMode: DatePickerMode.year,
        helpText: 'Select birthday date',
        fieldLabelText: 'Birthday date');
    if (picked != null && picked != birthdayDate)
      setState(() {
        birthdayDate = picked;
      });
  }

  _setBirthdayController() {
    birthdayController.text = "${widget.formatter.format(birthdayDate)}";
  }

  @override
  Widget build(BuildContext context) {
    _setBirthdayController();
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: const OutlineInputBorder(),
                  ),
                  controller: nameController,
                  onSubmitted: (_) => {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectBirthdayDate(context),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Birthday',
                            border: const OutlineInputBorder(),
                            suffixIcon: Icon(
                              Icons.date_range,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          controller: birthdayController,
                          enabled: false,
                          onSubmitted: (_) {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () => _submitData(context),
                child: Text(
                  'Save',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
