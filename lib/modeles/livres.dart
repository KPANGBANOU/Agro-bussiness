// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Livres {
  final String uid;
  final String numero_sbin;
  final String nom;
  final String edition_uid;
  final String user_uid;
  final String created_at;
  final String updated_at;
  Livres({
    required this.uid,
    required this.numero_sbin,
    required this.nom,
    required this.edition_uid,
    required this.user_uid,
    required this.created_at,
    required this.updated_at,
  });
  factory Livres.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return Livres(
        uid: document.id,
        numero_sbin: (document.data() as Map),
        nom: nom,
        edition_uid: edition_uid,
        user_uid: user_uid,
        created_at: created_at,
        updated_at: updated_at);
  }

  Livres copyWith({
    String? uid,
    String? numero_sbin,
    String? nom,
    String? edition_uid,
    String? user_uid,
    String? created_at,
    String? updated_at,
  }) {
    return Livres(
      uid: uid ?? this.uid,
      numero_sbin: numero_sbin ?? this.numero_sbin,
      nom: nom ?? this.nom,
      edition_uid: edition_uid ?? this.edition_uid,
      user_uid: user_uid ?? this.user_uid,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'numero_sbin': numero_sbin});
    result.addAll({'nom': nom});
    result.addAll({'edition_uid': edition_uid});
    result.addAll({'user_uid': user_uid});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});

    return result;
  }

  factory Livres.fromMap(Map<String, dynamic> map) {
    return Livres(
      uid: map['uid'] ?? '',
      numero_sbin: map['numero_sbin'] ?? '',
      nom: map['nom'] ?? '',
      edition_uid: map['edition_uid'] ?? '',
      user_uid: map['user_uid'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Livres.fromJson(String source) => Livres.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Livres(uid: $uid, numero_sbin: $numero_sbin, nom: $nom, edition_uid: $edition_uid, user_uid: $user_uid, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Livres &&
        other.uid == uid &&
        other.numero_sbin == numero_sbin &&
        other.nom == nom &&
        other.edition_uid == edition_uid &&
        other.user_uid == user_uid &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        numero_sbin.hashCode ^
        nom.hashCode ^
        edition_uid.hashCode ^
        user_uid.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
