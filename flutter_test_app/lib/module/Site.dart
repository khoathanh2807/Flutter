const keyId = 'entityId';
const keyTitle = 'entityTitle';
const keyOwner = 'siteOwner';
const keyDisplayName = 'userDisplayName';


class Site{
  late String id;
  late String title;
  late String Owner;

  Site({
    required this.id,
    required this.title,
    required this.Owner
});

  Site.fromJson(Map<String, dynamic> json){
    this.id = json[keyId] ?? '';
    this.title = json[keyTitle] ?? '';
    this.Owner = json[keyOwner][keyDisplayName]?? '';

  }


}