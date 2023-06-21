// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, depend_on_referenced_packages

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class CaracteristiquePlats {
  final String uid;
  final String nom;
  final String photo_url;
  final String description;
  final String user_uid;
  final String created_at;
  final String updated_at;
  CaracteristiquePlats({
    required this.uid,
    required this.nom,
    required this.photo_url,
    required this.description,
    required this.user_uid,
    required this.created_at,
    required this.updated_at,
  });

  factory CaracteristiquePlats.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];

    return CaracteristiquePlats(
        uid: document.id,
        nom: (document.data() as Map)['nom'],
        photo_url: (document.data() as Map)['photo_url'],
        description: (document.data() as Map)['description'],
        user_uid: (document.data() as Map)['user_uid'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(created.toDate()),
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(updated.toDate()));
  }

  CaracteristiquePlats copyWith({
    String? uid,
    String? nom,
    String? photo_url,
    String? description,
    String? user_uid,
    String? created_at,
    String? updated_at,
  }) {
    return CaracteristiquePlats(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      photo_url: photo_url ?? this.photo_url,
      description: description ?? this.description,
      user_uid: user_uid ?? this.user_uid,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'photo_url': photo_url});
    result.addAll({'description': description});
    result.addAll({'user_uid': user_uid});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});

    return result;
  }

  factory CaracteristiquePlats.fromMap(Map<String, dynamic> map) {
    return CaracteristiquePlats(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      photo_url: map['photo_url'] ?? '',
      description: map['description'] ?? '',
      user_uid: map['user_uid'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CaracteristiquePlats.fromJson(String source) =>
      CaracteristiquePlats.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CaracteristiquePlats(uid: $uid, nom: $nom, photo_url: $photo_url, description: $description, user_uid: $user_uid, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CaracteristiquePlats &&
        other.uid == uid &&
        other.nom == nom &&
        other.photo_url == photo_url &&
        other.description == description &&
        other.user_uid == user_uid &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        photo_url.hashCode ^
        description.hashCode ^
        user_uid.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
