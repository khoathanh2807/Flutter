import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './platform_alert.dart';

class SettingsScreen extends StatefulWidget {

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();

}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
      return Scaffold(

        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,

          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xff252525),
            title: Text('Settings'),
            actions: [
              IconButton(
                  icon: Icon(Icons.search, size: 26),
                  onPressed: () {

                  },
              )
            ],
          ),

          body: SingleChildScrollView(
            child: Column(
              children: [

                Container(
                  color: Color(0xff181818),
                  padding: const EdgeInsets.only(left: 25,),
                  child: Column(
                    children: [

                      SizedBox(height: 13,),

                      Row(
                          children: const [

                            Icon(Icons.lock_outlined, color: Colors.blue, size: 26,),
                            SizedBox(width: 20,),

                            Text('Privacy', style: TextStyle(fontSize: 15,),),

                          ],
                      ),
                      SizedBox(height: 13,),

                      const Divider(
                        height: 0,
                        color: Colors.grey,
                        thickness: 0.1,
                      ),

                      SizedBox(height: 13,),

                      Row(
                          children: const [

                            Icon(Icons.local_police_outlined, color: Colors.lightGreen, size: 26,),
                            SizedBox(width: 20,),

                            Text('Account and security', style: TextStyle(fontSize: 15,),),

                          ],
                      ),
                      SizedBox(height: 13,),

                      const Divider(
                        height: 0,
                        color: Colors.grey,
                        thickness: 0.1,
                      ),

                      SizedBox(height: 13,),

                      Row(
                          children: const [

                            Icon(Icons.backup_outlined, color: Colors.blue, size: 26,),
                            SizedBox(width: 20,),

                            Text('Backup and restore', style: TextStyle(fontSize: 15,),),

                          ],
                      ),
                      SizedBox(height: 21,),

                    ],
                  ),
                ),

                const Divider(
                  height: 0,
                  color: Colors.black,
                  thickness: 8,
                ),

                Container(
                  color: Color(0xff181818),
                  padding: const EdgeInsets.only(left: 25,),
                  child: Column(
                    children: [

                      SizedBox(height: 13,),

                      Row(
                          children: const [

                            Icon(Icons.palette_outlined, color: Colors.lightGreen, size: 26,),
                            SizedBox(width: 20,),

                            Text('Theme', style: TextStyle(fontSize: 15,),),

                          ],
                      ),
                      SizedBox(height: 13,),

                      const Divider(
                        height: 0,
                        color: Colors.grey,
                        thickness: 0.1,
                      ),

                      SizedBox(height: 13,),

                      Row(
                          children: const [

                            Icon(Icons.notifications_outlined, color: Colors.redAccent, size: 26,),
                            SizedBox(width: 20,),

                            Text('Notifications', style: TextStyle(fontSize: 15,),),

                          ],
                      ),
                      SizedBox(height: 13,),

                      const Divider(
                        height: 0,
                        color: Colors.grey,
                        thickness: 0.1,
                      ),

                      SizedBox(height: 13,),

                      Row(
                          children: const [

                            FaIcon(FontAwesomeIcons.commentDots, color: Colors.blue, size: 26,),
                            SizedBox(width: 20,),

                            Text('Messages', style: TextStyle(fontSize: 15,),),

                          ],
                      ),
                      SizedBox(height: 13,),

                      const Divider(
                        height: 0,
                        color: Colors.grey,
                        thickness: 0.1,
                      ),

                      SizedBox(height: 13,),

                      Row(
                          children: const [

                            Icon(Icons.data_usage_outlined, color: Colors.blue, size: 26,),
                            SizedBox(width: 20,),

                            Text('Data and storage', style: TextStyle(fontSize: 15,),),

                          ],
                      ),
                      SizedBox(height: 13,),

                      const Divider(
                        height: 0,
                        color: Colors.grey,
                        thickness: 0.1,
                      ),

                      SizedBox(height: 13,),

                      Row(
                          children: const [

                            Icon(Icons.call_outlined, color: Colors.green, size: 26,),
                            SizedBox(width: 20,),

                            Text('Call', style: TextStyle(fontSize: 15,),),

                          ],
                      ),
                      SizedBox(height: 13,),

                      const Divider(
                        height: 0,
                        color: Colors.grey,
                        thickness: 0.1,
                      ),

                      SizedBox(height: 13,),

                      Row(
                          children: const [

                            Icon(Icons.access_time_outlined, color: Colors.deepPurple, size: 26,),
                            SizedBox(width: 20,),

                            Text('Timeline and story', style: TextStyle(fontSize: 15,),),

                          ],
                      ),
                      SizedBox(height: 13,),

                      const Divider(
                        height: 0,
                        color: Colors.grey,
                        thickness: 0.1,
                      ),

                      SizedBox(height: 13,),

                      Row(
                          children: const [

                            Icon(Icons.person_outline, color: Colors.orangeAccent, size: 26,),
                            SizedBox(width: 20,),

                            Text('Contact', style: TextStyle(fontSize: 15,),),

                          ],
                      ),
                      SizedBox(height: 13,),

                      const Divider(
                        height: 0,
                        color: Colors.grey,
                        thickness: 0.1,
                      ),

                      SizedBox(height: 13,),

                      Row(
                          children: const [

                            Icon(Icons.text_fields_outlined, color: Colors.greenAccent, size: 26,),
                            SizedBox(width: 20,),

                            Text('Language and text size', style: TextStyle(fontSize: 15,),),

                          ],
                      ),
                      SizedBox(height: 13,),

                      const Divider(
                        height: 0,
                        color: Colors.grey,
                        thickness: 0.1,
                      ),

                      SizedBox(height: 13,),

                      Row(
                          children: const [

                            Icon(Icons.info_outlined, color: Colors.blue, size: 26,),
                            SizedBox(width: 20,),

                            Text('About us', style: TextStyle(fontSize: 15,),),

                          ],
                      ),
                      SizedBox(height: 21,),

                    ],
                  ),
                ),

                const Divider(
                  height: 0,
                  color: Colors.black,
                  thickness: 8,
                ),

                Container(
                  color: Color(0xff181818),
                  padding: const EdgeInsets.only(left: 25,),
                  child: Column(
                    children: [

                      SizedBox(height: 13,),

                      Row(
                          children: const [

                            Icon(Icons.switch_account_outlined, color: Colors.blue, size: 26,),
                            SizedBox(width: 20,),

                            Text('Switch account', style: TextStyle(fontSize: 15,),),

                          ],
                      ),
                      SizedBox(height: 13,),

                      const Divider(
                        height: 0,
                        color: Colors.grey,
                        thickness: 0.1,
                      ),

                      SizedBox(height: 13,),

                      GestureDetector(
                        child: Row(
                            children: const [

                              Icon(Icons.logout, color: Colors.grey, size: 26,),
                              SizedBox(width: 20,),

                              Expanded(child: Text('Sign out', style: TextStyle(fontSize: 15,),),)

                            ],
                        ),
                        onTap: () {

                          print('Sign out');

                          const logoutAlert = PlatformAlert(
                            title: 'Sign Out',
                            message: 'Do you want to sign out of this account?',
                          );
                          logoutAlert.showLogoutAlert(context);

                        },
                      ),
                      SizedBox(height: 21,),

                    ],
                  ),
                ),

                const Divider(
                  height: 0,
                  color: Colors.black,
                  thickness: 8,
                ),

              ],
            ),
          ),

      );
  }

}