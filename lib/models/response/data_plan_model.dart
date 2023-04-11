class DataPlanModel {
  final int? id;
  final String? name;
  final int? price;
  final int? operatorCard;

  DataPlanModel({this.id, this.name, this.price, this.operatorCard});

  factory DataPlanModel.fromJson(Map<String, dynamic> json) => DataPlanModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      operatorCard: json['operator_card']);
}
