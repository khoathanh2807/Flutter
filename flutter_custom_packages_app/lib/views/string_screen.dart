import 'package:flutter/material.dart';
import 'package:convertstring_util/convertstring_util.dart';

class StringScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return StringScreenState();
  }

}

class StringScreenState extends State<StatefulWidget>{

  final formKey = GlobalKey<FormState>();

  late String inputString;

  // final inputStringController = TextEditingController();

  ConvertString convertString = ConvertString();

  String wordCounterResult = '';
  String convertedString = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        elevation: 0,
        title: const Text('Convert String'),
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: Column(
              children: [

                stringInputField(),
                const SizedBox(height: 35,),

                inputButton(),
                const SizedBox(height: 50,),

                Text(wordCounterResult, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),

                Text(convertedString, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),

              ],
            ),
          ),
        ),
      ),

    );

  }

  Widget stringInputField() {
    return TextFormField(

      // controller: inputStringController,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
          hintText: 'Input String',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),

      validator: (value) {
          if (value == '' || value == ' ' || value == null || value.isEmpty) {
              return 'This field cannot be empty.';
          }
          return null;
      },

      onSaved: (value) {
        inputString = value!.trim() as String;
      },

    );
  }

  Widget inputButton() {
    return ElevatedButton(

        child: const Text('Convert', style: TextStyle(fontWeight: FontWeight.bold,),),

        style: ElevatedButton.styleFrom(
          // elevation: 0,
          padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 15.0),
        ),

        onPressed: () {

            if (formKey.currentState!.validate()) {

              formKey.currentState!.save();

              // inputString = inputStringController.text.trim();

              var wordCounter = convertString.countWord(inputString);
              convertedString = convertString.removeAccents(inputString)!;

              print('Input string: $inputString');
              print('Word counter: $wordCounter');
              print('Converted string: $convertedString');

              setState(() {
                wordCounterResult = 'Word counter: $wordCounter';
                convertedString = 'Converted string: ' + convertedString;
              });

            }

        },

    );
  }


}
