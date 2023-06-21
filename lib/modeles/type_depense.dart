// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, depend_on_referenced_packages

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class TypeDepenses {
  final String uid;
  final String nom;
  final String description;
  final String created_at;
  final String updated_at;
  TypeDepenses({
    required this.uid,
    required this.nom,
    required this.description,
    required this.created_at,
    required this.updated_at,
  });

  factory TypeDepenses.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return TypeDepenses(
        uid: document.id,
        nom: (document.data() as Map)['nom'],
        description: (document.data() as Map)['description'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(created.toDate()),
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(updated.toDate()));
  }

  TypeDepenses copyWith({
    String? uid,
    String? nom,
    String? description,
    String? created_at,
    String? updated_at,
  }) {
    return TypeDepenses(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      description: description ?? this.description,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'description': description});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});

    return result;
  }

  factory TypeDepenses.fromMap(Map<String, dynamic> map) {
    return TypeDepenses(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      description: map['description'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeDepenses.fromJson(String source) =>
      TypeDepenses.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TypeDepenses(uid: $uid, nom: $nom, description: $description, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TypeDepenses &&
        other.uid == uid &&
        other.nom == nom &&
        other.description == description &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        description.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
