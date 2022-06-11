import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/user.dart';

class UserCredentials {

  final currentUser = FirebaseAuth.instance.currentUser;

  FirebaseUser getCredentials() {

    FirebaseUser firebaseUser = FirebaseUser(
      email: '',
      uid: currentUser!.uid,
      photoURL: '',
      displayName: '',
      birthDate: DateFormat('dd.MM.yyyy').format(DateTime.now()).toString(),
      gender: null,
      phoneNumber: '(+84) ',
    );

    // email
    if (currentUser!.email != null) {
      firebaseUser.email = currentUser!.email!;
    }

    // photoURL
    if (currentUser!.photoURL != null) {
      firebaseUser.photoURL = currentUser!.photoURL!;
    }

    // displayName
    if (currentUser!.displayName != null) {
      firebaseUser.displayName = currentUser!.displayName!;
    }
    getName().whenComplete(() {}).then((value) => firebaseUser.displayName = value!);

    // birthDate
    getBirthDate().whenComplete(() {}).then((value) => firebaseUser.birthDate = value!);

    // gender
    getGender().whenComplete(() {}).then((value) => firebaseUser.gender = value!);

    // phoneNumber
    getPhoneNumber().whenComplete(() {}).then((value) => firebaseUser.phoneNumber = value!);

    return firebaseUser;

  }

  Future<String?> getName() async {
    String? _userName;
    await FirebaseFirestore.instance.collection('users').doc(currentUser!.uid).get().then((value) {
      _userName = value.get('username').toString();
    });
    return _userName;
  }

  Future<String?> getBirthDate() async {
    String? _birthDate;
    await FirebaseFirestore.instance.collection('users').doc(currentUser!.uid).get().then((value) {
      _birthDate = value.get('birthDate').toString();
    });
    return _birthDate;
  }

  Future<String?> getGender() async {
    String? _gender;
    await FirebaseFirestore.instance.collection('users').doc(currentUser!.uid).get().then((value) {
      _gender = value.get('gender').toString();
    });
    return _gender;
  }

  Future<String?> getPhoneNumber() async {
    String? _phoneNumber;
    await FirebaseFirestore.instance.collection('users').doc(currentUser!.uid).get().then((value) {
      _phoneNumber = value.get('phoneNumber').toString();
    });
    return _phoneNumber;
  }

}