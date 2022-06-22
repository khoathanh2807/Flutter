import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../controllers/notification/notification_controller.dart';
import '../platform_alert.dart';
import './change_password_screen.dart';

class SettingsScreen extends StatefulWidget {

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();

}

class _SettingsScreenState extends State<SettingsScreen> {

  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {

      return Scaffold(

        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[200],

          appBar: AppBar(
            // elevation: 0,
            centerTitle: true,
            title: Text('Settings'.tr, style: TextStyle(fontWeight: FontWeight.w600,),),
          ),

          body: SingleChildScrollView(
            padding: EdgeInsets.only(top: 10,),
            child: Column(
              children: [

                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(left: 30,),
                  child: Column(
                    children: [

                      SizedBox(height: 16,),

                      GestureDetector(
                        child: Row(
                          children: [
                            Icon(Icons.notifications_outlined, size: 27,),
                            SizedBox(width: 20,),
                            Expanded(child: Text('CancelAllFlightNotifications'.tr, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,),),),
                          ],
                        ),
                        onTap: () async {

                          int pendingNotification = await NotificationController().checkPendingNotificationRequests();

                          if (pendingNotification == 0) {

                            var noNotificationAlert = PlatformAlert(
                              title: 'NoNotification'.tr,
                              message: 'NoNotificationMessage'.tr,
                            );
                            noNotificationAlert.showWarningAlert(context);

                          } else {

                            var cancelNotificationAlert = PlatformAlert(
                              title: 'CancelNotification'.tr,
                              message: 'CancelNotificationMessage1'.tr + '($pendingNotification)' + 'CancelNotificationMessage2'.tr,
                            );
                            cancelNotificationAlert.showCancelNotificationAlert(context);

                          }

                        },
                      ),
                      SizedBox(height: 16,),

                      const Divider(
                        height: 0,
                        color: Colors.grey,
                        thickness: 0.1,
                      ),

                      if (currentUser!.providerData[0].providerId == 'password')
                        SizedBox(height: 16,),

                      if (currentUser!.providerData[0].providerId == 'password')
                        GestureDetector(
                          child: Row(
                            children: [
                              Icon(Icons.lock_outline, size: 27,),
                              SizedBox(width: 20,),
                              Expanded(child: Text('ChangeAccountPassword'.tr, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,),),),
                            ],
                          ),
                          onTap: () {

                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangePasswordScreen(),),);

                          },
                        ),
                      if (currentUser!.providerData[0].providerId == 'password')
                        SizedBox(height: 16,),

                      if (currentUser!.providerData[0].providerId == 'password')
                        const Divider(
                          height: 0,
                          color: Colors.grey,
                          thickness: 0.1,
                        ),

                      SizedBox(height: 16,),

                      GestureDetector(
                        child: Row(
                          children: [
                            Icon(Icons.translate, size: 27,),
                            SizedBox(width: 20,),
                            Expanded(child: Text('AppLanguage'.tr, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,),),),
                          ],
                        ),
                        onTap: () {

                          showDialog(context: context, builder: (context) {
                            return AlertDialog(
                              title: Text('SelectLanguage'.tr, style: TextStyle(fontWeight: FontWeight.bold,),),
                              content: SizedBox(
                                height: 113,
                                child: SingleChildScrollView(
                                  padding: EdgeInsets.symmetric(horizontal: 20,),
                                  child: Column(

                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,

                                    children: [

                                      GestureDetector(
                                        child: Container(
                                          padding: const EdgeInsets.only(top: 15, bottom: 20,),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Image.asset('assets/images/uk-flag.png', width: 27,),
                                              SizedBox(width: 20,),
                                              Expanded(child: Text('English'.tr, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,),),),
                                              if (Get.locale == const Locale('English'))
                                                Icon(Icons.check_circle_outline, color: Colors.teal, size: 20,),
                                            ],
                                          ),
                                        ),
                                        onTap: Get.locale == const Locale('English') ? null : () {

                                          print('English');
                                          Navigator.of(context).pop();

                                          var changeLanguageAlert = PlatformAlert(
                                            title: 'ChangeLanguage'.tr,
                                            message: 'ChangeLanguageMessage'.tr,
                                          );
                                          changeLanguageAlert.showChangeLanguageAlert(context, Locale('English'),);

                                        },
                                      ),

                                      const Divider(
                                        height: 0,
                                        color: Colors.grey,
                                        thickness: 0.1,
                                      ),

                                      GestureDetector(
                                        child: Container(
                                          padding: const EdgeInsets.only(top: 20, bottom: 15,),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Image.asset('assets/images/vn-flag.jpg', width: 27,),
                                              SizedBox(width: 20,),
                                              Expanded(child: Text('Vietnamese'.tr, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,),),),
                                              if (Get.locale == const Locale('Vietnamese'))
                                                Icon(Icons.check_circle_outline, color: Colors.teal, size: 20,),
                                            ],
                                          ),
                                        ),
                                        onTap: Get.locale == const Locale('Vietnamese') ? null : () {

                                          print('Vietnamese');
                                          Navigator.of(context).pop();

                                          var changeLanguageAlert = PlatformAlert(
                                            title: 'ChangeLanguage'.tr,
                                            message: 'ChangeLanguageMessage'.tr,
                                          );
                                          changeLanguageAlert.showChangeLanguageAlert(context, Locale('Vietnamese'),);

                                        },
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            );
                          });

                        },
                      ),
                      SizedBox(height: 16,),

                      const Divider(
                        height: 0,
                        color: Colors.grey,
                        thickness: 0.1,
                      ),

                      SizedBox(height: 16,),

                      GestureDetector(
                        child: Row(
                          children: [
                            Icon(Icons.logout, size: 27,),
                            SizedBox(width: 20,),
                            Expanded(child: Text('SignOut'.tr, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,),),),
                          ],
                        ),
                        onTap: () {
                          var logoutAlert = PlatformAlert(
                            title: 'SignOutTitle'.tr,
                            message: 'SignOutMessage'.tr,
                          );
                          logoutAlert.showLogoutAlert(context);
                        },
                      ),
                      SizedBox(height: 22,),

                    ],
                  ),
                ),

              ],
            ),
          ),

      );

  }

}