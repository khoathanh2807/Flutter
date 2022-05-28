class Post {

  late String userDisplayName;
  late String userPhotoURL;
  late String postingTime;
  String? contentText;
  String? contentPhotoURL;
  late int likeAmount;
  late int commentAmount;
  bool? isLiked;

  Post.createDefault() {
    userDisplayName = '';
    userPhotoURL = '';
    postingTime = '';
    contentText = '';
    contentPhotoURL = '';
    likeAmount = 0;
    commentAmount = 0;
    isLiked = false;
  }

  Post({
    required this.userDisplayName,
    required this.userPhotoURL,
    required this.postingTime,
    this.contentText,
    this.contentPhotoURL,
    required this.likeAmount,
    required this.commentAmount,
    this.isLiked,
  });

  Post.fromJson(Map<String, dynamic> json){
    userDisplayName = json['displayName'] ?? '';
    userPhotoURL = json['photoURL'] ?? '';
    postingTime = json['postingTime'] ?? '';
    contentText = json['contentText'] ?? '';
    contentPhotoURL = json['contentPhotoURL'] ?? '';
    likeAmount = json['likeAmount'] ?? 0;
    commentAmount = json['commentAmount'] ?? 0;
    isLiked = json['isLiked'] ?? false;
  }

}