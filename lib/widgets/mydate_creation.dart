import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDateCreationModal extends StatefulWidget {
  final DateFormat formatter;

  const MyDateCreationModal({Key key, this.formatter}) : super(key: key);
  @override
  _MyDateCreationModalState createState() => _MyDateCreationModalState();
}

class _MyDateCreationModalState extends State<MyDateCreationModal> {
  final nameController = TextEditingController();
  final birthdayController = TextEditingController();
  DateTime birthdayDate;
  DateTime todayDate;

  @override
  void initState() {
    var now = DateTime.now();
    todayDate = new DateTime(now.year, now.month, now.day);
    birthdayDate = todayDate;
  }

  void _submitData() {
    print('submited');
    final enteredName = nameController.text;
    if (enteredName.isEmpty) {
      return;
    }
    print(enteredName);
  }

  _selectBirthdayDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate:
            birthdayDate != null ? birthdayDate : todayDate, // Refer step 1
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
                            // disabledBorder: const OutlineInputBorder(),
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
                    // SizedBox(
                    //   width: 50,
                    // ),
                    // CircleAvatar(
                    //   radius: 20,
                    //   child: IconButton(
                    //     icon: Icon(Icons.date_range),
                    //     onPressed: () => _selectBirthdayDate(context),
                    //   ),
                    // ),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: _submitData,
                child: Text(
                  'Add',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
