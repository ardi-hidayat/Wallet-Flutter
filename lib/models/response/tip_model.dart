class TipModel {
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnail;

  TipModel({this.id, this.title, this.url, this.thumbnail});

  factory TipModel.fromJson(Map<String, dynamic> json) => TipModel(
      id: json['tip'],
      title: json['title'],
      url: json['url'],
      thumbnail: json['thumbnail']);
}
