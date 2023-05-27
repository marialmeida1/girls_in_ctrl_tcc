// ignore_for_file: public_member_api_docs, sort_constructors_first
class Initiative {
  int? id;
  String? card;
  String? name;
  String? link;

  Initiative({
    this.id,
    this.card,
    this.name,
    this.link,
  });

  factory Initiative.fromJson(Map<String, dynamic> json) {
    return Initiative(
      id: json['initiative']['id'],
      card: json['initiative']['card'],
      name: json['initiative']['name'],
      link: json['initiative']['link'],
    );
  }
}
