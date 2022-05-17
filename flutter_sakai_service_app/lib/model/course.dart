const keyId = 'entityId';
const keyUrl = 'entityURL';
const keyTitle = 'entityTitle';
const keyOwner = 'siteOwner';
const keyDisplayName = 'userDisplayName';

class Course{

  late String id;
  late String url;
  late String title;
  late String owner;

  Course({
    required this.id,
    required this.url,
    required this.title,
    required this.owner
  });

  Course.fromJson(Map<String, dynamic> json){
    id = json['entityId'] ?? '';
    url = json['entityURL'] ?? '';
    title = json['entityTitle'] ?? '';
    owner = json['siteOwner']['userDisplayName'] ?? '';
  }

}