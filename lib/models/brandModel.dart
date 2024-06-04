class BrandModel {
  String id;
  String title;
  String img;

  BrandModel({
    required this.id,
    required this.title,
    required this.img,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'],
      title: json['title'],
      img: json['img'],
    );
  }
}
