import 'package:flutter/material.dart';
import 'package:string_util/string_util.dart';
import 'package:bignumber_util/bignumber_util.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }

}

class HomeScreenState extends State<StatefulWidget>{

  final formKey = GlobalKey<FormState>();
  final inputController = TextEditingController();
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();
  late String inputString;
  late String num1;
  late String num2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('String'),),
      body: buildLoginForm(),
    );
  }

  Widget buildLoginForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Align(alignment: Alignment.centerLeft, child: new Text("String",textScaleFactor: 1.75 ),),
          inputField(),
          inputButton(),
          Align(alignment: Alignment.centerLeft, child: new Text("number 1",textScaleFactor: 1.75 ),),
          num1Field(),
          Align(alignment: Alignment.centerLeft, child: new Text("number 2",textScaleFactor: 1.75 ),),
          num2Field(),
          sumButton()
        ],
      ),
    );
  }

  Widget inputField() {
    return TextFormField(
      controller: inputController,
      decoration: InputDecoration(
          icon: Icon(Icons.person),
          labelText: 'input'
      ),

      onSaved: (value) {
        inputString = value as String;
      },
    );
  }

  Widget num1Field() {
    return TextFormField(
      controller: num1Controller,
      decoration: InputDecoration(
          icon: Icon(Icons.person),
          labelText: 'input'
      ),
      onSaved: (value) {
        num1 = value as String;
      },
    );
  }

  Widget num2Field() {
    return TextFormField(
      controller: num2Controller,
      decoration: InputDecoration(
          icon: Icon(Icons.person),
          labelText: 'input'
      ),
      onSaved: (value) {
        num2 = value as String;
      },

    );
  }


  Widget sumButton() {
    return ElevatedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            print("--------------------");
            print('add two number :$num1,$num2');
            BigNumberUtil.thirdGradeSum(num1,num2);
            //Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen()));
          }
        },
        child: Text('Sum')
    );
  }


  Widget inputButton() {
    return ElevatedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();

            print("--------------------");
            print('count word :$inputString');
            convertString.countWord(inputString);
            print("--------------------");
            print('normal word :$inputString');
            convertString.removeAccents(inputString);
            //Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen()));
          }
        },
        child: Text('input')
    );
  }


}
