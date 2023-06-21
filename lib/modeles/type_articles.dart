// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class TypeArticles {
  final String uid;
  final String nom;
  final String user_uid;
  final String created_at;
  final String updated_at;
  TypeArticles({
    required this.uid,
    required this.nom,
    required this.user_uid,
    required this.created_at,
    required this.updated_at,
  });

  factory TypeArticles.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return TypeArticles(
        uid: document.id,
        nom: (document.data() as Map)['nom'],
        user_uid: (document.data() as Map)['user_uid'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(created.toDate()),
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(updated.toDate()));
  }

  TypeArticles copyWith({
    String? uid,
    String? nom,
    String? user_uid,
    String? created_at,
    String? updated_at,
  }) {
    return TypeArticles(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      user_uid: user_uid ?? this.user_uid,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'user_uid': user_uid});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});

    return result;
  }

  factory TypeArticles.fromMap(Map<String, dynamic> map) {
    return TypeArticles(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      user_uid: map['user_uid'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeArticles.fromJson(String source) =>
      TypeArticles.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TypeArticles(uid: $uid, nom: $nom, user_uid: $user_uid, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TypeArticles &&
        other.uid == uid &&
        other.nom == nom &&
        other.user_uid == user_uid &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        user_uid.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
