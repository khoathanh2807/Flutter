import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './settings_screen.dart';

class InfoScreen extends StatefulWidget {

  @override
  State<InfoScreen> createState() => _InfoScreenState();

}

class _InfoScreenState extends State<InfoScreen> {

  final currentUser = FirebaseAuth.instance.currentUser;

  String displayName = '';
  String email = '';
  String photoURL = '';

  Future<String> getUserName() async {
    late String _displayName;
    await FirebaseFirestore.instance.collection('users').doc(currentUser!.uid).get().then((value) {
      _displayName = value.get('username').toString();
    });
    return _displayName;
  }

  @override
  void initState() {
    if (currentUser!.displayName == null) {
      getUserName().then((value) => displayName = value).whenComplete(() {
        setState(() {
        });
      });
      print('displayName = $displayName');
    } else {
      displayName = currentUser!.displayName!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // UserCredentialData userCredentialData = ModalRoute.of(context)!.settings.arguments as UserCredentialData;
    // print('arguments: userCredentialData = $userCredentialData');
    // String uid = userCredentialData.uid ?? '';
    // String displayName = userCredentialData.displayName ?? 'unknown';
    // String email = userCredentialData.email ?? '';
    // String photoURL = userCredentialData.photoURL ?? '';

    print(FirebaseFirestore.instance.collection('users').doc(currentUser!.uid).id);
    print(currentUser!.uid);

    if (currentUser!.email != null) {
      email = currentUser!.email!;
    }

    if (currentUser!.photoURL != null) {
      photoURL = currentUser!.photoURL!;
    }

    return  Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff252525),
        leading: Row(
          children: const [
            SizedBox(width: 25,),
            Icon(Icons.search, size: 26)
          ],
        ),
        title: const TextField(
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(fontSize: 19),
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                color: Color(0xff181818),
                padding: const EdgeInsets.only(top: 14, bottom: 21, left: 18, right: 18,),
                child: Row(
                  children: [

                    Container(
                      decoration: const ShapeDecoration(
                        shape: CircleBorder (
                          side: BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid,),
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: photoURL != '' ? NetworkImage(photoURL) : NetworkImage('http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
                      ),
                    ),
                    SizedBox(width: 20,),

                    Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                                displayName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),
                            ),
                            SizedBox(height: 6,),

                            Text(
                              email,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 13, color: Colors.grey,),
                            ),

                          ],
                        ),
                    ),

                    Container(
                      decoration: const ShapeDecoration(
                        shape: CircleBorder (
                          side: BorderSide(color: Colors.grey, width: 2, style: BorderStyle.solid,),
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 9,
                        backgroundColor: Colors.white70,
                        child: Icon(Icons.people, color: Colors.white, size: 14,),
                      ),
                    ),

                  ],
                ),
              ),

              const Divider(
                height: 0,
                color: Colors.black,
                thickness: 8,
              ),

              // profilePicture(photoURL),
              // const SizedBox(height: 20,),
              // Text('Account Name: $displayName'),
              // const SizedBox(height: 20,),
              // Text('Email: $email'),
              // const SizedBox(height: 20,),
              // Text('User ID: $uid'),

              Container(
                color: Color(0xff181818),
                padding: const EdgeInsets.only(top: 15, bottom: 25, left: 25, right: 25,),
                child: Row(
                  children: [

                      Icon(Icons.qr_code_rounded, color: Colors.blue, size: 26,),
                      SizedBox(width: 20,),

                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [

                            Text("QR Wallet", style: TextStyle(fontSize: 15,),),
                            SizedBox(height: 6,),

                            Text('Save and use important QR codes', style: TextStyle(fontSize: 13, color: Colors.grey,),),

                          ],
                      ),

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
                padding: const EdgeInsets.only(top: 15, bottom: 25, left: 25, right: 25,),
                child: Row(
                  children: [

                      Icon(Icons.cloud_outlined, color: Colors.blue, size: 26,),
                      SizedBox(width: 20,),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [

                          Text("My Cloud", style: TextStyle(fontSize: 15,),),
                          SizedBox(height: 6,),

                          Text('Keep important messages', style: TextStyle(fontSize: 13, color: Colors.grey,),),

                        ],
                      ),

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

                    SizedBox(height: 16,),

                    Row(
                        children: const [

                          Icon(Icons.local_police_outlined, color: Colors.blue, size: 26,),
                          SizedBox(width: 20,),

                          Text('Account and security', style: TextStyle(fontSize: 15,),),

                        ],
                    ),
                    SizedBox(height: 16,),

                    const Divider(
                      height: 0,
                      color: Colors.grey,
                      thickness: 0.1,
                    ),

                    SizedBox(height: 16,),

                    Row(
                        children: const [

                          Icon(Icons.lock_outlined, color: Colors.blue, size: 26,),
                          SizedBox(width: 20,),

                          Text('Privacy', style: TextStyle(fontSize: 15,),),

                        ],
                    ),
                    SizedBox(height: 16,),

                  ],
                ),
              ),

            ],
          ),
      ),

    );

  }

  // Widget profilePicture(String photoURL) {
  //   if (photoURL != '') {
  //     return Image.network(photoURL, width: 100, height: 100,);
  //     // return NetworkImage(photoURL);
  //   } else {
  //     // return Image.network('https://minervastrategies.com/wp-content/uploads/2016/03/default-avatar.jpg');
  //     // return Image.asset('assets/images/default-avatar.jpg', width: 100, height: 100,);
  //     return const Image(image: AssetImage('assets/images/default-avatar.jpg'), width: 100, height: 100,);
  //     // return AssetImage('assets/images/default-avatar.jpg');
  //   }
  // }

}