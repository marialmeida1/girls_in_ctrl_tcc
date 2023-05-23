// Método com os seguintes valores da tabela usuário

class User {
  int? id;
  String? name;
  String? lastname;
  String? email;
  String? image;
  String? token;

  User({
    this.id,
    this.name,
    this.lastname,
    this.email,
    this.image,
    this.token,
  });

  // transforma os valores da tabela em um objeto json

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      name: json['user']['name'],
      lastname: json['user']['lastname'],
      email: json['user']['email'],
      image: json['user']['image'],
      token: json['token'],
    );
  }
}
