class EnfantsModel {
  int? id;
  String? nom;
  String? prenom;
  String? dateNaiss;
  Parent? parent;
  Groupe? groupe;

  EnfantsModel(
      {this.id,
      this.nom,
      this.prenom,
      this.dateNaiss,
      this.parent,
      this.groupe});

  EnfantsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    prenom = json['prenom'];
    dateNaiss = json['dateNaiss'];
    parent = json['parent'] != null ? Parent.fromJson(json['parent']) : null;
    groupe = json['groupe'] != null ? Groupe.fromJson(json['groupe']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nom'] = nom;
    data['prenom'] = prenom;
    data['dateNaiss'] = dateNaiss;
    if (parent != null) {
      data['parent'] = parent!.toJson();
    }
    if (groupe != null) {
      data['groupe'] = groupe!.toJson();
    }
    return data;
  }
}

class Parent {
  int? id;
  String? nom;
  String? prenom;
  String? username;
  String? email;
  String? password;
  String? adresse;
  String? telephone;
  List<String>? enfantsList;
  List<String>? inscriptionsList;
  List<String>? reclamationsList;
  String? fidelite;

  Parent(
      {this.id,
      this.nom,
      this.prenom,
      this.username,
      this.email,
      this.password,
      this.adresse,
      this.telephone,
      this.enfantsList,
      this.inscriptionsList,
      this.reclamationsList,
      this.fidelite});

  Parent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    prenom = json['prenom'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    adresse = json['adresse'];
    telephone = json['telephone'];
    enfantsList = json['enfantsList'].cast<String>();
    inscriptionsList = json['inscriptionsList'].cast<String>();
    reclamationsList = json['reclamationsList'].cast<String>();
    fidelite = json['fidelite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nom'] = nom;
    data['prenom'] = prenom;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['adresse'] = adresse;
    data['telephone'] = telephone;
    data['enfantsList'] = enfantsList;
    data['inscriptionsList'] = inscriptionsList;
    data['reclamationsList'] = reclamationsList;
    data['fidelite'] = fidelite;
    return data;
  }
}

class Groupe {
  int? id;
  String? nom;
  int? nbEnfants;
  Employe? employe;
  List<String>? enfantsList;

  Groupe({this.id, this.nom, this.nbEnfants, this.employe, this.enfantsList});

  Groupe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    nbEnfants = json['nbEnfants'];
    employe =
        json['employe'] != null ? Employe.fromJson(json['employe']) : null;
    enfantsList = json['enfantsList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nom'] = nom;
    data['nbEnfants'] = nbEnfants;
    if (employe != null) {
      data['employe'] = employe!.toJson();
    }
    data['enfantsList'] = enfantsList;
    return data;
  }
}

class Employe {
  int? id;
  String? nom;
  String? prenom;
  String? username;
  String? email;
  String? password;
  String? adresse;
  String? telephone;
  String? poste;
  int? salaire;
  List<String>? groupesList;

  Employe(
      {this.id,
      this.nom,
      this.prenom,
      this.username,
      this.email,
      this.password,
      this.adresse,
      this.telephone,
      this.poste,
      this.salaire,
      this.groupesList});

  Employe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    prenom = json['prenom'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    adresse = json['adresse'];
    telephone = json['telephone'];
    poste = json['poste'];
    salaire = json['salaire'];
    groupesList = json['groupesList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nom'] = nom;
    data['prenom'] = prenom;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['adresse'] = adresse;
    data['telephone'] = telephone;
    data['poste'] = poste;
    data['salaire'] = salaire;
    data['groupesList'] = groupesList;
    return data;
  }
}
