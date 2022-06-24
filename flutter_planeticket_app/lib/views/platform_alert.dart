import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../controllers/notification/notification_controller.dart';
import '../controllers/user_credentials/user_credentials.dart';
import './auth/login_screen.dart';

class PlatformAlert {

  final String? title;
  final String? message;

  const PlatformAlert({@required this.title, @required this.message})
      : assert(title != null),
        assert(message != null);



  void showCancelNotificationAlert(BuildContext context) {

    TargetPlatform platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS) {
      cancelNotificationConfirmCupertinoAlert(context);
    } else {
      cancelNotificationConfirmMaterialAlert(context);
    }

  }

  void cancelNotificationConfirmMaterialAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(title!),
              content: Text(message!),
              actions: [
                TextButton(
                  child: Text('Cancel'.tr, style: TextStyle(color: Colors.red),),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: Text('Confirm'.tr,),
                  onPressed: () {
                    Navigator.of(context).pop();
                    NotificationController().cancelAllNotifications().whenComplete(() {
                      Fluttertoast.showToast(msg: 'SuccessfullyCanceledNotification'.tr, fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue, timeInSecForIosWeb: 3,);
                    });
                  },
                ),
              ],
          );
        }
    );
  }

  void cancelNotificationConfirmCupertinoAlert(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
              title: Text(title!),
              content: Text(message!),
              actions: [
                CupertinoButton(
                  child: Text('Cancel'.tr, style: TextStyle(color: CupertinoColors.destructiveRed),),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                CupertinoButton(
                  child: Text('Confirm'.tr, style: TextStyle(color: CupertinoColors.activeBlue),),
                  onPressed: () {
                    Navigator.of(context).pop();
                    NotificationController().cancelAllNotifications().whenComplete(() {
                      Fluttertoast.showToast(msg: 'SuccessfullyCanceledNotification'.tr, fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue, timeInSecForIosWeb: 3,);
                    });
                  },
                ),
              ],
          );
        }
    );
  }



  void showChangePasswordAlert(BuildContext context, String newPassword) {

    TargetPlatform platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS) {
      changePasswordConfirmCupertinoAlert(context, newPassword);
    } else {
      changePasswordConfirmMaterialAlert(context, newPassword);
    }

  }

  void changePasswordConfirmMaterialAlert(BuildContext context, String newPassword) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title!),
            content: Text(message!),
            actions: [
              TextButton(
                child: Text('Cancel'.tr, style: TextStyle(color: Colors.red),),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text('Confirm'.tr,),
                onPressed: () async {
                  await UserCredentials().updatePassword(newPassword).whenComplete(() {
                    Fluttertoast.showToast(msg: 'SuccessfullyChangedPassword'.tr, fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue, timeInSecForIosWeb: 3,);
                  });
                  await FirebaseAuth.instance.signOut().whenComplete(() {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen()), (_) => false,);
                  });
                },
              ),
            ],
          );
        }
    );
  }

  void changePasswordConfirmCupertinoAlert(BuildContext context, String newPassword) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title!),
            content: Text(message!),
            actions: [
              CupertinoButton(
                child: Text('Cancel'.tr, style: TextStyle(color: CupertinoColors.destructiveRed),),
                onPressed: () => Navigator.of(context).pop(),
              ),
              CupertinoButton(
                child: Text('Confirm'.tr, style: TextStyle(color: CupertinoColors.activeBlue),),
                onPressed: () async {
                  await UserCredentials().updatePassword(newPassword).whenComplete(() {
                    Fluttertoast.showToast(msg: 'SuccessfullyChangedPassword'.tr, fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue, timeInSecForIosWeb: 3,);
                  });
                  await FirebaseAuth.instance.signOut().whenComplete(() {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen()), (_) => false,);
                  });
                },
              ),
            ],
          );
        }
    );
  }



  void showChangeLanguageAlert(BuildContext context, Locale selectedLanguage) {

    TargetPlatform platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS) {
      changeLanguageConfirmCupertinoAlert(context, selectedLanguage);
    } else {
      changeLanguageConfirmMaterialAlert(context, selectedLanguage);
    }

  }

  void changeLanguageConfirmMaterialAlert(BuildContext context, Locale selectedLanguage) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title!),
            content: Text(message!),
            actions: [
              TextButton(
                child: Text('Cancel'.tr, style: TextStyle(color: Colors.red),),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text('Confirm'.tr,),
                onPressed: () {
                  Navigator.of(context).pop();
                  print('Changed language to $selectedLanguage');
                  Get.updateLocale(selectedLanguage).whenComplete(() {
                    Fluttertoast.showToast(msg: 'SuccessfullyChangedLanguage'.tr, fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue, timeInSecForIosWeb: 3,);
                    print('Current language: ${Get.locale}');
                  });
                },
              ),
            ],
          );
        }
    );
  }

  void changeLanguageConfirmCupertinoAlert(BuildContext context, Locale selectedLanguage) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title!),
            content: Text(message!),
            actions: [
              CupertinoButton(
                child: Text('Cancel'.tr, style: TextStyle(color: CupertinoColors.destructiveRed),),
                onPressed: () => Navigator.of(context).pop(),
              ),
              CupertinoButton(
                child: Text('Confirm'.tr, style: TextStyle(color: CupertinoColors.activeBlue),),
                onPressed: () {
                  Navigator.of(context).pop();
                  print('Changed language to $selectedLanguage');
                  Get.updateLocale(selectedLanguage).whenComplete(() {
                    Fluttertoast.showToast(msg: 'SuccessfullyChangedLanguage'.tr, fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue, timeInSecForIosWeb: 3,);
                    print('Current language: ${Get.locale}');
                  });
                },
              ),
            ],
          );
        }
    );
  }



  void showLogoutAlert(BuildContext context) {

    TargetPlatform platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS) {
      logoutConfirmCupertinoAlert(context);
    } else {
      logoutConfirmMaterialAlert(context);
    }

  }

  void logoutConfirmMaterialAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title!),
            content: Text(message!),
            actions: [
              TextButton(
                child: Text('Cancel'.tr, style: TextStyle(color: Colors.red),),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text('Confirm'.tr,),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut().whenComplete(() {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen()), (_) => false,);
                    Fluttertoast.showToast(msg: 'SuccessfullySignedOut'.tr, fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue, timeInSecForIosWeb: 3,);
                  });
                },
              ),
            ],
          );
        }
    );
  }

  void logoutConfirmCupertinoAlert(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title!),
            content: Text(message!),
            actions: [
              CupertinoButton(
                child: Text('Cancel'.tr, style: TextStyle(color: CupertinoColors.destructiveRed),),
                onPressed: () => Navigator.of(context).pop(),
              ),
              CupertinoButton(
                child: Text('Confirm'.tr, style: TextStyle(color: CupertinoColors.activeBlue),),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut().whenComplete(() {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen()), (Route<dynamic> route) => false,);
                    Fluttertoast.showToast(msg: 'SuccessfullySignedOut'.tr, fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue, timeInSecForIosWeb: 3,);
                  });
                },
              ),
            ],
          );
        }
    );
  }



  void showWarningAlert(BuildContext context) {

    TargetPlatform platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS) {
      warningConfirmCupertinoAlert(context);
    } else {
      warningConfirmMaterialAlert(context);
    }

  }

  void warningConfirmMaterialAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(title!),
              content: Text(message!),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
          );
        }
    );
  }

  void warningConfirmCupertinoAlert(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
              title: Text(title!),
              content: Text(message!),
              actions: [
                CupertinoButton(
                  child: Text('OK', style: TextStyle(color: CupertinoColors.activeBlue),),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
          );
        }
    );
  }



}