// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ProprieteArticles {
  final String uid;
  final String nom;
  final String type_article_uid;
  final String created_at;
  final String updated_at;
  ProprieteArticles({
    required this.uid,
    required this.nom,
    required this.type_article_uid,
    required this.created_at,
    required this.updated_at,
  });

  factory ProprieteArticles.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return ProprieteArticles(
        uid: document.id,
        nom: (document.data() as Map)['nom'],
        type_article_uid: (document.data() as Map)['type_article_uid'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(created.toDate()),
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(updated.toDate()));
  }

  ProprieteArticles copyWith({
    String? uid,
    String? nom,
    String? type_article_uid,
    String? created_at,
    String? updated_at,
  }) {
    return ProprieteArticles(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      type_article_uid: type_article_uid ?? this.type_article_uid,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'type_article_uid': type_article_uid});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});

    return result;
  }

  factory ProprieteArticles.fromMap(Map<String, dynamic> map) {
    return ProprieteArticles(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      type_article_uid: map['type_article_uid'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProprieteArticles.fromJson(String source) =>
      ProprieteArticles.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProprieteArticles(uid: $uid, nom: $nom, type_article_uid: $type_article_uid, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProprieteArticles &&
        other.uid == uid &&
        other.nom == nom &&
        other.type_article_uid == type_article_uid &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        type_article_uid.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
