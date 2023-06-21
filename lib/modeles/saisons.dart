// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, depend_on_referenced_packages

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Saisons {
  final String uid;
  final String nom;
  final String description;
  final bool cloture;
  final String user_uid;
  final String created_at;
  final String updated_at;
  Saisons({
    required this.uid,
    required this.nom,
    required this.description,
    required this.cloture,
    required this.user_uid,
    required this.created_at,
    required this.updated_at,
  });
  factory Saisons.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return Saisons(
        uid: document.id,
        nom: (document.data() as Map)['nom'],
        description: (document.data() as Map)['description'],
        cloture: (document.data() as Map)['cloture'],
        user_uid: (document.data() as Map)['user_uid'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(created.toDate()),
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(updated.toDate()));
  }

  Saisons copyWith({
    String? uid,
    String? nom,
    String? description,
    bool? cloture,
    String? user_uid,
    String? created_at,
    String? updated_at,
  }) {
    return Saisons(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      description: description ?? this.description,
      cloture: cloture ?? this.cloture,
      user_uid: user_uid ?? this.user_uid,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'description': description});
    result.addAll({'cloture': cloture});
    result.addAll({'user_uid': user_uid});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});

    return result;
  }

  factory Saisons.fromMap(Map<String, dynamic> map) {
    return Saisons(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      description: map['description'] ?? '',
      cloture: map['cloture'] ?? false,
      user_uid: map['user_uid'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Saisons.fromJson(String source) =>
      Saisons.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Saisons(uid: $uid, nom: $nom, description: $description, cloture: $cloture, user_uid: $user_uid, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Saisons &&
        other.uid == uid &&
        other.nom == nom &&
        other.description == description &&
        other.cloture == cloture &&
        other.user_uid == user_uid &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        description.hashCode ^
        cloture.hashCode ^
        user_uid.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
