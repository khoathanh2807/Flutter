import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

import './login_screen.dart';

// import '../datetime_util.dart';
// import 'package:common_components/datetime_utility.dart';    // import package từ thư mục 'packages' nằm trong project này
import 'package:datetime_utility/datetime_utility.dart';        // import package từ git đã import link ở file pubspec.yaml

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<StatefulWidget> {

  // final formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();
  TextEditingController dayAddController = TextEditingController();

  String resultTitle = '';
  String finalDateResult = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        backgroundColor: Theme.of(context).colorScheme.background,

        appBar: AppBar(
          title: Text('Datetime Calculate'),
          elevation: 0,
          actions: [
            _logOut()
          ],
        ),

        body: Container(
          padding: EdgeInsets.all(30),
          // child: datetimeForm(),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text(
                '${selectedDate.toLocal()}'.split(' ')[0],
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40.0,),

              datePickerButton(),
              SizedBox(height: 40.0,),

              dayAddField(),
              SizedBox(height: 40.0,),

              confirmButton(),
              SizedBox(height: 50.0,),

              Text(resultTitle, style: TextStyle(color: Colors.pink, fontSize: 25, fontWeight: FontWeight.bold)),
              SizedBox(height: 20.0,),

              Text(finalDateResult, style: TextStyle(color: Colors.pink, fontSize: 40, fontWeight: FontWeight.bold)),

            ],
          ),
        ),

      );

  }

  // Widget datetimeForm() {
  //
  //   return Form(
  //     key: formKey,
  //
  //   );
  //
  // }

  Widget datePickerButton() {

    return ElevatedButton(

      child: Text('Select date'),

      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 15.0),
      ),

      onPressed: () => _selectDate(context),

    );

  }

  // DatePicker type depend on platform
  _selectDate(BuildContext context) async {

    var platform = Theme.of(context).platform;
    assert(platform != null);

    if (platform == TargetPlatform.iOS) {
      return buildCupertinoDatePicker(context);
    } else {
      return buildMaterialDatePicker(context);
    }

  }

  // This builds Material DatePicker for Android
  buildMaterialDatePicker(BuildContext context) async {

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1999),
      lastDate: DateTime(2099),
      // initialEntryMode: DatePickerEntryMode.input,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select Start Date', // Title of DatePicker
      cancelText: 'Not Okay',
      confirmText: 'Okay',
      errorFormatText: 'You enter invalid format date',
      errorInvalidText: 'You enter out of range date value',
      fieldLabelText: 'Enter Start Date',   // Title ò iput text field
      fieldHintText: 'Month/Day/Year',
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }

  }

  // This builds Cupertino DatePicker for iOS
  buildCupertinoDatePicker(BuildContext context) {

    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(

            height: MediaQuery.of(context).copyWith().size.height / 3,

            child: CupertinoTheme(

              data: CupertinoThemeData(
                brightness: Brightness.dark,
              ),

              child: CupertinoDatePicker(
                initialDateTime: selectedDate,
                minimumYear: 2000,
                maximumYear: 2025,
                mode: CupertinoDatePickerMode.date,
                // use24hFormat: true,
                onDateTimeChanged: (pickedDate) {
                  if (pickedDate != null && pickedDate != selectedDate) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
                backgroundColor: CupertinoColors.darkBackgroundGray,
              ),

            ),

          );
        }
     );

  }

  Widget dayAddField() {

    dayAddController.text = '0';

    return TextFormField(

      controller: dayAddController,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        labelText: 'Amount of day to add',
        hintText: 'Input amount of day you want to add',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
      ),

    );

  }

  Widget confirmButton() {

    return ElevatedButton(

      child: Text('Add day to selected date'),

      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 15.0),
      ),

      onPressed: calculateDate,

    );

  }

  void calculateDate() {

    int amountDayAdd = int.parse(dayAddController.text);

    DateTime dateResult = DatetimeUtility.addWorkingDay(selectedDate, amountDayAdd);
    print('dateResult = $dateResult');

    // var myTimeFormat = DateFormat('dd/MM/yyyy HH:mm');   // 02/02/2022 14:02 (24H format)

    String formatedDateResult = DateFormat('dd/MM/yyyy hh:mm a').format(dateResult);   // 02/02/2022 02:02 PM (12H format)
    print('formatedDateResult = $formatedDateResult');

    setState(() {

      resultTitle = 'Date Result';

      // finalDateResult = '$dateResult'.split(' ')[0];
      finalDateResult = formatedDateResult.split(' ')[0];

      Fluttertoast.showToast(msg: 'Calculate complete.', fontSize: 15, backgroundColor: Colors.blue);

    });

  }

  Widget _logOut() {

    return IconButton(

      icon: Icon(Icons.logout),
      tooltip: 'Log Out',
      onPressed: () {
        // Navigator.of(context).pushReplacementNamed('/login');
        // Navigator.pushReplacementNamed(context, '/login');
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },

    );

  }

}