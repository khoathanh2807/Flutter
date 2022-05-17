class UserCredentialData {

  late String? uid;
  late String? displayName;
  late String? email;
  late String? photoURL;

  UserCredentialData.createDefault() {
    uid = '';
    displayName = '';
    email = '';
    photoURL = '';
  }

  UserCredentialData({
    this.uid,
    this.displayName,
    this.email,
    this.photoURL,
  });

  UserCredentialData.fromJson(Map<String, dynamic> json){
    uid = json['uid'] ?? '';
    displayName = json['displayName'] ?? '';
    email = json['email'] ?? '';
    photoURL = json['photoURL'] ?? '';
  }

}