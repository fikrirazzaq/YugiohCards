class CardImages {
  String id;
  String imageUrl;
  String imageUrlSmall;

  CardImages({this.id, this.imageUrl, this.imageUrlSmall});

  CardImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    imageUrlSmall = json['image_url_small'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    data['image_url_small'] = this.imageUrlSmall;
    return data;
  }
}