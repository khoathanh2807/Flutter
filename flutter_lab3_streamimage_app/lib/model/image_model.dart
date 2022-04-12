class ImageModel {

  int? id;
  String? url;

  ImageModel(this.id, this.url);

  ImageModel.fromJson(jsonObject) {
    id = jsonObject['id'];
    url = jsonObject['url'];
  }

  String toString() {

    return '($id, $url)';

  }

}
