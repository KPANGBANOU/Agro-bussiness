// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class TypeLivres {
  final String uid;
  final String nom;
  final String created_at;
  final String updated_at;
  TypeLivres({
    required this.uid,
    required this.nom,
    required this.created_at,
    required this.updated_at,
  });

  factory TypeLivres.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return TypeLivres(
        uid: document.id,
        nom: (document.data() as Map)['nom'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(created.toDate()),
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(updated.toDate()));
  }

  TypeLivres copyWith({
    String? uid,
    String? nom,
    String? created_at,
    String? updated_at,
  }) {
    return TypeLivres(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});

    return result;
  }

  factory TypeLivres.fromMap(Map<String, dynamic> map) {
    return TypeLivres(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeLivres.fromJson(String source) =>
      TypeLivres.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TypeLivres(uid: $uid, nom: $nom, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TypeLivres &&
        other.uid == uid &&
        other.nom == nom &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
