class UserLoginModel {
  String? role;
  String? success;
  String? adresse;
  String? telephone;
  String? id;
  String? nom;
  String? prenom;
  String? email;
  String? username;

  UserLoginModel(
      {this.role,
      this.success,
      this.adresse,
      this.telephone,
      this.id,
      this.nom,
      this.prenom,
      this.email,
      this.username});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    success = json['success'];
    adresse = json['adresse'];
    telephone = json['telephone'];
    id = json['id'];
    nom = json['nom'];
    prenom = json['prenom'];
    email = json['email'];
    username = json['username'];
  }
}
