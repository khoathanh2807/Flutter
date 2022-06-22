import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/validation/mixin_login_validation.dart';
import '../../controllers/user_credentials/user_credentials.dart';
import '../platform_alert.dart';

class ChangePasswordScreen extends StatefulWidget {

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();

}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> with LoginValidation {

  final _formKey = GlobalKey<FormState>();
  var showPassword = false;

  String currentPassword = '';
  String newPassword = '';
  String confirmNewPassword = '';

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  var currentPasswordClearButtonVisible = false;
  var newPasswordClearButtonVisible = false;
  var confirmNewPasswordClearButtonVisible = false;

  bool checkCurrentPasswordValid = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        // elevation: 0,
        centerTitle: true,
        title: Text('ChangePassword'.tr, style: TextStyle(fontWeight: FontWeight.w600,),),
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(

              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [

                currentPasswordField(),
                const SizedBox(height: 20,),

                newPasswordField(),
                const SizedBox(height: 20,),

                comfirmNewPasswordField(),

                showPasswordCheckbox(),
                const SizedBox(height: 20,),

                changePasswordButton(),
                const SizedBox(height: 50,),

              ],

            ),
          ),
        ),
      ),

    );

  }

  Widget currentPasswordField() {

    return TextFormField(

      controller: currentPasswordController,
      obscureText: !showPassword,
      maxLines: 1,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: currentPasswordClearButtonVisible,
          child: IconButton(
            icon: const Icon(Icons.cancel, color: Colors.grey, size: 17,),
            onPressed: () {
              setState(() {
                currentPasswordController.clear();
                currentPasswordClearButtonVisible = false;
              });
            },
          ),
        ),
        // alignLabelWithHint: true,
        // floatingLabelAlignment: FloatingLabelAlignment.start,
        labelText: 'CurrentPassword'.tr,
        hintText: 'CurrentPasswordFieldHint'.tr,
        // errorText: checkCurrentPasswordValid ? null : 'Invalid password!',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: EdgeInsets.only(left: 30, right: 5, top: 21, bottom: 21,),
      ),

      onChanged: (value) {
        setState(() {
          currentPassword = value;
          currentPassword.isNotEmpty ? currentPasswordClearButtonVisible = true : currentPasswordClearButtonVisible = false;
        });
      },

      validator: (value) {
        return checkCurrentPasswordValid ? null : 'CurrentPasswordFieldValidate'.tr;
      },

    );

  }

  Widget newPasswordField() {

    return TextFormField(

      controller: newPasswordController,
      obscureText: !showPassword,
      maxLines: 1,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: newPasswordClearButtonVisible,
          child: IconButton(
            icon: const Icon(Icons.cancel, color: Colors.grey, size: 17,),
            onPressed: () {
              setState(() {
                newPasswordController.clear();
                newPasswordClearButtonVisible = false;
              });
            },
          ),
        ),
        labelText: 'NewPassword'.tr,
        hintText: 'NewPasswordFieldHint'.tr,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: EdgeInsets.only(left: 30, right: 5, top: 21, bottom: 21,),
      ),

      onChanged: (value) {
        setState(() {
          newPassword = value;
          newPassword.isNotEmpty ? newPasswordClearButtonVisible = true : newPasswordClearButtonVisible = false;
        });
      },

      validator: validatePassword,

    );

  }

  Widget comfirmNewPasswordField() {

    return TextFormField(

      controller: confirmNewPasswordController,
      obscureText: !showPassword,
      maxLines: 1,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: confirmNewPasswordClearButtonVisible,
          child: IconButton(
            icon: const Icon(Icons.cancel, color: Colors.grey, size: 17,),
            onPressed: () {
              setState(() {
                confirmNewPasswordController.clear();
                confirmNewPasswordClearButtonVisible = false;
              });
            },
          ),
        ),
        labelText: 'ConfirmNewPassword'.tr,
        hintText: 'ConfirmNewPasswordFieldHint'.tr,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: EdgeInsets.only(left: 30, right: 5, top: 21, bottom: 21,),
      ),

      onChanged: (value) {
        setState(() {
          confirmNewPassword = value;
          confirmNewPassword.isNotEmpty ? confirmNewPasswordClearButtonVisible = true : confirmNewPasswordClearButtonVisible = false;
        });
      },

      validator: (value) {
        if (value!.isEmpty || value == '' || value == null) {
          return 'ConfirmPasswordCannotEmpty'.tr;
        } else if (value != newPasswordController.text) {
          return 'ConfirmPasswordDidntMatch'.tr;
        }
        return null;
      },

    );

  }

  Widget showPasswordCheckbox() {

    return CheckboxListTile(

      title: Text('ShowPassword'.tr),

      // contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.14,),
      activeColor: Theme.of(context).colorScheme.primary,
      controlAffinity: ListTileControlAffinity.leading,

      value: showPassword,

      onChanged: (newValue) {
        FocusScope.of(context).unfocus();
        setState(() {
          showPassword = newValue!;
        });
      },

    );

  }

  Widget changePasswordButton() {

    return ElevatedButton(

      child: Text('Confirm'.tr, style: TextStyle(fontWeight: FontWeight.bold,),),

      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 15.0,),
      ),

      onPressed: () async {

        FocusScope.of(context).unfocus();

        currentPassword = currentPasswordController.text;
        newPassword = newPasswordController.text;

        await UserCredentials().validateCurrentPassword(currentPassword).whenComplete(() {}).then((value) {
          setState(() {
            checkCurrentPasswordValid = value;
          });
        });
        print('checkCurrentPasswordValid: $checkCurrentPasswordValid');

        if (!checkCurrentPasswordValid) {
          var warningAlert = PlatformAlert(
            title: 'WrongPassword'.tr,
            message: 'WrongPasswordMessage'.tr,
          );
          warningAlert.showWarningAlert(context);
        }

        if(_formKey.currentState!.validate() && checkCurrentPasswordValid) {

          var changePasswordAlert = PlatformAlert(
            title: 'ChangePasswordTitle'.tr,
            message: 'ChangePasswordMessage'.tr,
          );
          changePasswordAlert.showChangePasswordAlert(context, newPassword,);

        }

      },

    );

  }

}