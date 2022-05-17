import 'package:flutter/material.dart';
import 'package:customsum_util/customsum_util.dart';

class NumberScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return NumberScreenState();
  }

}

class NumberScreenState extends State<StatefulWidget>{

  final formKey = GlobalKey<FormState>();

  late String number1;
  late String number2;

  // final number1Controller = TextEditingController();
  // final number2Controller = TextEditingController();

  CustomSum customSum = CustomSum();

  String sumResult = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        elevation: 0,
        title: const Text('Sum 2 Number'),
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: Column(
              children: [

                number1InputField(),
                const SizedBox(height: 20,),

                number2InputField(),
                const SizedBox(height: 35,),

                sumButton(),
                const SizedBox(height: 50,),

                Text(sumResult, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),

              ],
            ),
          ),
        ),
      ),

    );

  }

  Widget number1InputField() {
    return TextFormField(

      // controller: number1Controller,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
          hintText: 'Input Number 1',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),

      validator: (value) {
        if (value == '' || value == ' ' || value == null || value.isEmpty) {
          return 'This field cannot be empty.';
        }
        return null;
      },

      onSaved: (value) {
        number1 = value!.trim() as String;
      },

    );
  }

  Widget number2InputField() {
    return TextFormField(

      // controller: number2Controller,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
          hintText: 'Input Number 2',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),

      validator: (value) {
        if (value == '' || value == ' ' || value == null || value.isEmpty) {
          return 'This field cannot be empty.';
        }
        return null;
      },

      onSaved: (value) {
        number2 = value!.trim() as String;
      },

    );
  }


  Widget sumButton() {
    return ElevatedButton(

        child: const Text('Sum', style: TextStyle(fontWeight: FontWeight.bold,),),

        style: ElevatedButton.styleFrom(
          // elevation: 0,
          padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 15.0),
        ),

        onPressed: () {

            if (formKey.currentState!.validate()) {

                formKey.currentState!.save();

                // number1 = number1Controller.text.trim();
                // number2 = number2Controller.text.trim();

                var sum = customSum.sum(number1, number2);

                print('Sum result: $number1 + $number2 = $sum');

                setState(() {
                  sumResult = 'Sum result: $number1 + $number2 = $sum';
                });

            }

        },

    );
  }

}
