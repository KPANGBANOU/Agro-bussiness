// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, depend_on_referenced_packages

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Sections {
  final String uid;
  final String nom;
  final String user_uid;
  final String description;
  final String created_at;
  final String updated_at;
  final bool cloture;
  final String but;
  Sections({
    required this.uid,
    required this.nom,
    required this.user_uid,
    required this.description,
    required this.created_at,
    required this.updated_at,
    required this.cloture,
    required this.but,
  });

  factory Sections.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return Sections(
        uid: document.id,
        nom: (document.data() as Map)['nom'],
        user_uid: (document.data() as Map)['user_uid'],
        description: (document.data() as Map)['description'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()) +
            " " +
            DateFormat("HH:mm:ss").format(created.toDate()),
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()) +
            " " +
            DateFormat("HH:mm:ss").format(updated.toDate()),
        cloture: (document.data() as Map)['cloture'],
        but: (document.data() as Map)['but']);
  }

  Sections copyWith({
    String? uid,
    String? nom,
    String? user_uid,
    String? description,
    String? created_at,
    String? updated_at,
    bool? cloture,
    String? but,
  }) {
    return Sections(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      user_uid: user_uid ?? this.user_uid,
      description: description ?? this.description,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      cloture: cloture ?? this.cloture,
      but: but ?? this.but,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'user_uid': user_uid});
    result.addAll({'description': description});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});
    result.addAll({'cloture': cloture});
    result.addAll({'but': but});

    return result;
  }

  factory Sections.fromMap(Map<String, dynamic> map) {
    return Sections(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      user_uid: map['user_uid'] ?? '',
      description: map['description'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      cloture: map['cloture'] ?? false,
      but: map['but'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Sections.fromJson(String source) =>
      Sections.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Sections(uid: $uid, nom: $nom, user_uid: $user_uid, description: $description, created_at: $created_at, updated_at: $updated_at, cloture: $cloture, but: $but)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Sections &&
        other.uid == uid &&
        other.nom == nom &&
        other.user_uid == user_uid &&
        other.description == description &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.cloture == cloture &&
        other.but == but;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        user_uid.hashCode ^
        description.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        cloture.hashCode ^
        but.hashCode;
  }
}
