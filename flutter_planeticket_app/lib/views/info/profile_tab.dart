import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../../controllers/user_credentials/user_credentials.dart';
import '../../models/user.dart';
import '../../models/gender.dart';

class ProfileTab extends StatefulWidget {

  @override
  State<ProfileTab> createState() => _ProfileTabState();

}

class _ProfileTabState extends State<ProfileTab> {

  FirebaseUser firebaseUser = UserCredentials().getCredentials();

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final birthDateController = TextEditingController();
  final phoneNumberController = TextEditingController();

  DateTime birthDatePicker = DateTime.now();

  bool isEditable = false;

  bool accuracyAgreement = false;

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20,),

      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 3,
            offset: Offset(5, 5),
          ),
        ],
      ),

      child: Form(
        key: _formKey,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Center(
                child: profilePicture(),
              ),
              SizedBox(height: 35,),

              nameField(),
              SizedBox(height: 20,),

              birthDateField(),
              SizedBox(height: 20,),

              genderField(),
              SizedBox(height: 20,),

              emailField(),
              SizedBox(height: 20,),

              phoneNumberField(),

              if (!isEditable)
                SizedBox(height: 35,),

              if (isEditable)
                accuracyAgreementCheckbox(),

              isEditable ? saveCancelButtonRow() : editButton(),

            ],
        ),
      ),

    );

  }

  Widget profilePicture() {

      return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 3,),
            borderRadius: BorderRadius.circular(150),
        ),
        // decoration: ShapeDecoration(
        //   shape: CircleBorder (
        //     side: BorderSide(color: Colors.grey, width: 3, style: BorderStyle.solid,),
        //   ),
        // ),
        child: CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(firebaseUser.photoURL != '' ? firebaseUser.photoURL! : 'http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
        ),
      );

      // Image.network(photoURL, width: 100, height: 100,);
      // Image(image: NetworkImage(photoURL), width: 100, height: 100,);
      // Image.asset('assets/images/default-avatar.jpg', width: 100, height: 100,);
      // Image(image: AssetImage('assets/images/default-avatar.jpg'), width: 100, height: 100, fit: BoxFit.fill,);

  }

  Widget nameField() {

    nameController.text = firebaseUser.displayName!;

    return TextFormField(

      readOnly: !isEditable,

      controller: nameController,

      // initialValue: displayName,
      // style: TextStyle(color: Colors.black, fontSize: 15.0,),

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        labelText: 'FullName'.tr,
        hintText: 'FullNameFieldHint'.tr,
        suffixIcon: Visibility(visible: isEditable, child: Icon(Icons.drive_file_rename_outline,),),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
        // border: OutlineInputBorder(borderSide: BorderSide.none,),
        // contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 20,),
      ),

      validator: (value) {
        if (value!.isEmpty || value == '' || value == null) {
          return 'EmptyFieldValidate'.tr;
        }
        return null;
      },

      onChanged: (value) {
        firebaseUser.displayName = value;
      },

    );

  }

  Widget birthDateField() {

    birthDateController.text = firebaseUser.birthDate!;
    birthDatePicker = DateFormat('dd.MM.yyyy').parse(firebaseUser.birthDate!);

    return TextFormField(

      readOnly: true,

      controller: birthDateController,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.date_range,),
        labelText: 'Birthdate'.tr,
        hintText: 'BirthdateFieldHint'.tr,
        suffixIcon: Visibility(visible: isEditable, child: Icon(Icons.drive_file_rename_outline,),),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
      ),

      validator: (value) {
        if (value!.isEmpty || value == '' || value == null || value == DateFormat('dd.MM.yyyy').format(DateTime.now()).toString()) {
          return 'BirthdateFieldValidate'.tr;
        }
        return null;
      },

      onTap: !isEditable ? null : () {
        _selectBirthDate(context);
      },

    );

  }

  // DatePicker type depend on platform
  _selectBirthDate(BuildContext context) async {

    var platform = Theme.of(context).platform;
    assert(platform != null);

    if (platform == TargetPlatform.iOS) {
      return buildCupertinoBirthDatePicker(context);
    } else {
      return buildMaterialBirthDatePicker(context);
    }

  }

  // This builds Material DatePicker for Android
  buildMaterialBirthDatePicker(BuildContext context) async {

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: birthDatePicker,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      // initialEntryMode: DatePickerEntryMode.input,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'BirthdateFieldHint'.tr, // Title of DatePicker
      cancelText: 'Cancel'.tr,
      confirmText: 'OK',
      errorFormatText: 'BirthdateFieldValidate'.tr,
      errorInvalidText: 'BirthdateFieldValidate'.tr,
      fieldLabelText: 'BirthdateFieldHint'.tr,   // Title of input text field
      fieldHintText: 'Month/Day/Year (MM/dd/yyyy)',
    );

    if (pickedDate != null && pickedDate != birthDatePicker) {
      setState(() {
        birthDatePicker = pickedDate;
        firebaseUser.birthDate = DateFormat('dd.MM.yyyy').format(birthDatePicker).toString();
      });
    }

  }

  // This builds Cupertino DatePicker for iOS
  buildCupertinoBirthDatePicker(BuildContext context) {

    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(

            height: MediaQuery.of(context).copyWith().size.height / 3,

            child: CupertinoTheme(

              data: const CupertinoThemeData(
                brightness: Brightness.light,
              ),

              child: CupertinoDatePicker(
                backgroundColor: CupertinoColors.lightBackgroundGray,
                initialDateTime: birthDatePicker,
                minimumYear: 1900,
                maximumYear: 2100,
                mode: CupertinoDatePickerMode.date,
                // use24hFormat: true,
                onDateTimeChanged: (pickedDate) {
                  if (pickedDate != null && pickedDate != birthDatePicker) {
                    setState(() {
                      birthDatePicker = pickedDate;
                      firebaseUser.birthDate = DateFormat('dd.MM.yyyy').format(birthDatePicker).toString();
                    });
                  }
                },
              ),

            ),

          );
        }
    );

  }

  Widget genderField() {

    // var genders = [
    //   'Nam',
    //   'Nữ',
    // ];

    List<Gender> genderList = [
      Gender(genderName: 'Female'.tr, genderID: 'F',),
      Gender(genderName: 'Male'.tr, genderID: 'M',),
    ];

    return DropdownButtonFormField(

      icon: Visibility(visible: isEditable, child: Icon(Icons.drive_file_rename_outline,),),

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.wc),
        labelText: 'Gender'.tr,
        hintText: 'GenderFieldHint'.tr,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
        contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 7,),
      ),
      borderRadius: BorderRadius.circular(12),
      dropdownColor: Colors.grey[200],

      value: firebaseUser.gender,

      // items: genders.map((value) {
      //   return DropdownMenuItem<String>(
      //     child: Text(value),
      //     value: value,
      //   );
      // }).toList(),

      items: genderList.map((Gender gender) {
        return DropdownMenuItem<String>(
          child: Text(genderList.singleWhere((x) => x.genderID == gender.genderID).genderName),
          value: gender.genderID,
        );
      }).toList(),

      validator: (value) {
        if (value == '' || value == null) {
          return 'EmptyFieldValidate'.tr;
        }
        return null;
      },

      onChanged: (value) {
        setState(() {
          firebaseUser.gender = value as String;
        });
        print('Selected: ${firebaseUser.gender}');
      },

    );

  }

  Widget emailField() {

    emailController.text = firebaseUser.email!;

    return TextFormField(

      readOnly: true,
      enabled: false,

      controller: emailController,
      keyboardType: TextInputType.emailAddress,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email,),
        labelText: 'Email',
        hintText: 'EmailFieldHint'.tr,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
      ),

    );

  }

  Widget phoneNumberField() {

    phoneNumberController.text = firebaseUser.phoneNumber!;

    return TextFormField(

      readOnly: !isEditable,

      controller: phoneNumberController,
      keyboardType: TextInputType.phone,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone),
        labelText: 'PhoneNumber'.tr,
        hintText: 'PhoneNumberFieldHint'.tr,
        suffixIcon: Visibility(visible: isEditable, child: Icon(Icons.drive_file_rename_outline,),),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
      ),

      validator: (value) {
        if (value!.isEmpty || value == '' || value == null ||  value == '(+84) ' || value == '(+84)') {
          return 'EmptyFieldValidate'.tr;
        }
        return null;
      },

      onChanged: (value) {
        firebaseUser.phoneNumber = value;
      },

    );

  }

  Widget accuracyAgreementCheckbox() {

    return CheckboxListTile(

      title: Text('AccuracyAgreement'.tr, style: TextStyle(fontSize: 14,),),

      contentPadding: EdgeInsets.only(top: 15, bottom: 25, left: 0, right: 5,),
      activeColor: Theme.of(context).colorScheme.primary,
      controlAffinity: ListTileControlAffinity.leading,
      visualDensity: VisualDensity(horizontal: -4,),

      value: accuracyAgreement,

      onChanged: (newValue) {
        FocusScope.of(context).unfocus();
        setState(() {
          accuracyAgreement = newValue!;
        });
      },

    );

  }

  Widget editButton() {

    return ElevatedButton(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.drive_file_rename_outline),
          SizedBox(width: 10,),
          Text('Edit'.tr, style: TextStyle(fontWeight: FontWeight.bold,),)
        ],
      ),

      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40,),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),
      ),

      onPressed: () {
        FocusScope.of(context).unfocus();
        setState(() {
          isEditable = !isEditable;
        });
      },

    );

  }

  Widget saveCancelButtonRow() {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        ElevatedButton(

          child: Text('Cancel'.tr, style: TextStyle(color: Theme.of(context).primaryColor,),),

          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white,),
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15, horizontal: MediaQuery.of(context).size.width*0.14,),),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.grey, width: 0.1, style: BorderStyle.solid,),
              ),
            ),
          ),

          onPressed: () {
            FocusScope.of(context).unfocus();
            setState(() {
              isEditable = !isEditable;
            });
          },

        ),

        ElevatedButton(

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.save,),
              SizedBox(width: 10,),
              Text('Save'.tr, style: TextStyle(fontWeight: FontWeight.bold,),)
            ],
          ),

          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: MediaQuery.of(context).size.width*0.11,),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),
          ),

          onPressed: !accuracyAgreement && isEditable ? null : () {

            FocusScope.of(context).unfocus();

            if(_formKey.currentState!.validate()) {

              showSaveAlert('EditInformation'.tr, 'EditInformationMessage'.tr,);

              setState(() {
                isEditable = !isEditable;
              });

            }

          },

        ),

      ],
    );

  }

  void showSaveAlert(String title, String message) {

    TargetPlatform platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS) {
      saveConfirmCupertinoAlert(title, message);
    } else {
      saveConfirmMaterialAlert(title, message);
    }

  }

  void saveConfirmMaterialAlert(String title, String message) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('Cancel'.tr, style: TextStyle(color: Colors.red),),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Confirm'.tr,),
              onPressed: () => saveUserInfoToFirebase(),
            ),
          ],
      );
    });
  }

  void saveConfirmCupertinoAlert(String title, String message) {
    showCupertinoDialog(context: context, builder: (context) {
      return CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            CupertinoButton(
              child: Text('Cancel'.tr, style: TextStyle(color: CupertinoColors.destructiveRed),),
              onPressed: () => Navigator.of(context).pop(),
            ),
            CupertinoButton(
              child: Text('Confirm'.tr, style: TextStyle(color: CupertinoColors.activeBlue),),
              onPressed: () => saveUserInfoToFirebase(),
            ),
          ],
      );
    });
  }

  void saveUserInfoToFirebase() async {

    Navigator.of(context, rootNavigator: true).pop();

    // await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).set({
    //   'username': firebaseUser.displayName,
    //   'birthDate': firebaseUser.birthDate,
    //   'gender': firebaseUser.gender,
    //   'email': firebaseUser.email,
    //   'phoneNumber': firebaseUser.phoneNumber,
    // });

    await UserCredentials().updateCredentials(
        displayName: firebaseUser.displayName,
        birthDate: firebaseUser.birthDate,
        gender: firebaseUser.gender,
        email: firebaseUser.email,
        phoneNumber: firebaseUser.phoneNumber,
    ).whenComplete(() {
      Fluttertoast.showToast(msg: 'SuccessfullyEditedInformation'.tr, fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue,);
    });

  }

}