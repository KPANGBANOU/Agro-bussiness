// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, depend_on_referenced_packages

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

// ignore_for_file: camel_case_types

class donneUtilisateur {
  final String uid;
  final String nom;
  final String prenom;
  final String email;
  final String telephone;
  final String numero_watsapp;
  final String password;
  final String date_naissance;
  final String date_inscription;
  donneUtilisateur({
    required this.uid,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.telephone,
    required this.numero_watsapp,
    required this.password,
    required this.date_naissance,
    required this.date_inscription,
  });

  factory donneUtilisateur.FromFirestore(DocumentSnapshot document) {
    Timestamp date = (document.data() as Map)['created_at'];
    return donneUtilisateur(
        uid: document.id,
        nom: (document.data() as Map)['nom'],
        prenom: (document.data() as Map)['prenom'],
        email: (document.data() as Map)['email'],
        telephone: (document.data() as Map)['telephone'],
        numero_watsapp: (document.data() as Map)['numero_watsapp'],
        password: (document.data() as Map)['password'],
        date_naissance: (document.data() as Map)['date_naissance'],
        date_inscription: DateFormat("dd-MM-yyyy").format(date.toDate()) +
            " " +
            DateFormat("HH:mm:ss").format(date.toDate()));
  }

  donneUtilisateur copyWith({
    String? uid,
    String? nom,
    String? prenom,
    String? email,
    String? telephone,
    String? numero_watsapp,
    String? password,
    String? date_naissance,
    String? date_inscription,
  }) {
    return donneUtilisateur(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      email: email ?? this.email,
      telephone: telephone ?? this.telephone,
      numero_watsapp: numero_watsapp ?? this.numero_watsapp,
      password: password ?? this.password,
      date_naissance: date_naissance ?? this.date_naissance,
      date_inscription: date_inscription ?? this.date_inscription,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'prenom': prenom});
    result.addAll({'email': email});
    result.addAll({'telephone': telephone});
    result.addAll({'numero_watsapp': numero_watsapp});
    result.addAll({'password': password});
    result.addAll({'date_naissance': date_naissance});
    result.addAll({'date_inscription': date_inscription});

    return result;
  }

  factory donneUtilisateur.fromMap(Map<String, dynamic> map) {
    return donneUtilisateur(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      prenom: map['prenom'] ?? '',
      email: map['email'] ?? '',
      telephone: map['telephone'] ?? '',
      numero_watsapp: map['numero_watsapp'] ?? '',
      password: map['password'] ?? '',
      date_naissance: map['date_naissance'] ?? '',
      date_inscription: map['date_inscription'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory donneUtilisateur.fromJson(String source) =>
      donneUtilisateur.fromMap(json.decode(source));

  @override
  String toString() {
    return 'donneUtilisateur(uid: $uid, nom: $nom, prenom: $prenom, email: $email, telephone: $telephone, numero_watsapp: $numero_watsapp, password: $password, date_naissance: $date_naissance, date_inscription: $date_inscription)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is donneUtilisateur &&
        other.uid == uid &&
        other.nom == nom &&
        other.prenom == prenom &&
        other.email == email &&
        other.telephone == telephone &&
        other.numero_watsapp == numero_watsapp &&
        other.password == password &&
        other.date_naissance == date_naissance &&
        other.date_inscription == date_inscription;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        prenom.hashCode ^
        email.hashCode ^
        telephone.hashCode ^
        numero_watsapp.hashCode ^
        password.hashCode ^
        date_naissance.hashCode ^
        date_inscription.hashCode;
  }
}
