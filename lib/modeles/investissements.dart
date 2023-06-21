// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, depend_on_referenced_packages

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Investissements {
  final String uid;
  final String nom;
  final String but;
  final String description;
  final String duree;
  final int montant;
  final String created_at;
  final bool is_updated;
  final String updated_at;
  final String user_uid;
  Investissements({
    required this.uid,
    required this.nom,
    required this.but,
    required this.description,
    required this.duree,
    required this.montant,
    required this.created_at,
    required this.is_updated,
    required this.updated_at,
    required this.user_uid,
  });

  factory Investissements.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return Investissements(
        uid: document.id,
        nom: (document.data() as Map)['nom'],
        but: (document.data() as Map)['but'],
        description: (document.data() as Map)['description'],
        duree: (document.data() as Map)['duree'],
        montant: (document.data() as Map)['montant'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()) +
            " " +
            DateFormat("HH:mm:ss").format(created.toDate()),
        is_updated: (document.data() as Map)['updated'],
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()) +
            " " +
            DateFormat("HH:mm:ss").format(updated.toDate()),
        user_uid: (document.data() as Map)['user_uid']);
  }

  Investissements copyWith({
    String? uid,
    String? nom,
    String? but,
    String? description,
    String? duree,
    int? montant,
    String? created_at,
    bool? is_updated,
    String? updated_at,
    String? user_uid,
  }) {
    return Investissements(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      but: but ?? this.but,
      description: description ?? this.description,
      duree: duree ?? this.duree,
      montant: montant ?? this.montant,
      created_at: created_at ?? this.created_at,
      is_updated: is_updated ?? this.is_updated,
      updated_at: updated_at ?? this.updated_at,
      user_uid: user_uid ?? this.user_uid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'but': but});
    result.addAll({'description': description});
    result.addAll({'duree': duree});
    result.addAll({'montant': montant});
    result.addAll({'created_at': created_at});
    result.addAll({'is_updated': is_updated});
    result.addAll({'updated_at': updated_at});
    result.addAll({'user_uid': user_uid});

    return result;
  }

  factory Investissements.fromMap(Map<String, dynamic> map) {
    return Investissements(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      but: map['but'] ?? '',
      description: map['description'] ?? '',
      duree: map['duree'] ?? '',
      montant: map['montant']?.toInt() ?? 0,
      created_at: map['created_at'] ?? '',
      is_updated: map['is_updated'] ?? false,
      updated_at: map['updated_at'] ?? '',
      user_uid: map['user_uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Investissements.fromJson(String source) =>
      Investissements.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Investissements(uid: $uid, nom: $nom, but: $but, description: $description, duree: $duree, montant: $montant, created_at: $created_at, is_updated: $is_updated, updated_at: $updated_at, user_uid: $user_uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Investissements &&
        other.uid == uid &&
        other.nom == nom &&
        other.but == but &&
        other.description == description &&
        other.duree == duree &&
        other.montant == montant &&
        other.created_at == created_at &&
        other.is_updated == is_updated &&
        other.updated_at == updated_at &&
        other.user_uid == user_uid;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        but.hashCode ^
        description.hashCode ^
        duree.hashCode ^
        montant.hashCode ^
        created_at.hashCode ^
        is_updated.hashCode ^
        updated_at.hashCode ^
        user_uid.hashCode;
  }
}
