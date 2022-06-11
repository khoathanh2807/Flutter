class FirebaseUser {

    String? email;
    late String uid;
    String? photoURL;
    String? displayName;
    String? birthDate;
    String? gender;
    String? phoneNumber;

    FirebaseUser({
        this.email,
        required this.uid,
        this.photoURL,
        this.displayName,
        this.birthDate,
        this.gender,
        this.phoneNumber,
    });

    FirebaseUser.createDefault() {
        email = '';
        uid = '';
        photoURL = '';
        displayName = '';
        birthDate = '';
        gender = null;
        phoneNumber = '';
    }

    FirebaseUser.fromJson(Map<String, dynamic> json) {
        email = json['email'] ?? '';
        uid = json['uid'] ?? '';
        displayName = json['displayName'] ?? '';
        photoURL = json['photoURL'] ?? '';
        birthDate = json['birthDate'] ?? '';
        gender = json['gender'] ?? '';
        phoneNumber = json['phoneNumber'] ?? '';
    }

}