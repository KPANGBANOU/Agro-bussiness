// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, depend_on_referenced_packages

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Restaurants {
  final String uid;
  final String nom;
  final String description;
  final String localisation;
  final String user_uid;
  final bool desactive;
  final String created_at;
  final String updated_at;
  Restaurants({
    required this.uid,
    required this.nom,
    required this.description,
    required this.localisation,
    required this.user_uid,
    required this.desactive,
    required this.created_at,
    required this.updated_at,
  });

  factory Restaurants.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return Restaurants(
        uid: document.id,
        nom: (document.data() as Map)['nom'],
        description: (document.data() as Map)['description'],
        localisation: (document.data() as Map)['localisation'],
        user_uid: (document.data() as Map)['user_uid'],
        desactive: (document.data() as Map)['desactive'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(created.toDate()),
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(updated.toDate()));
  }

  Restaurants copyWith({
    String? uid,
    String? nom,
    String? description,
    String? localisation,
    String? user_uid,
    bool? desactive,
    String? created_at,
    String? updated_at,
  }) {
    return Restaurants(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      description: description ?? this.description,
      localisation: localisation ?? this.localisation,
      user_uid: user_uid ?? this.user_uid,
      desactive: desactive ?? this.desactive,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'description': description});
    result.addAll({'localisation': localisation});
    result.addAll({'user_uid': user_uid});
    result.addAll({'desactive': desactive});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});

    return result;
  }

  factory Restaurants.fromMap(Map<String, dynamic> map) {
    return Restaurants(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      description: map['description'] ?? '',
      localisation: map['localisation'] ?? '',
      user_uid: map['user_uid'] ?? '',
      desactive: map['desactive'] ?? false,
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurants.fromJson(String source) =>
      Restaurants.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Restaurants(uid: $uid, nom: $nom, description: $description, localisation: $localisation, user_uid: $user_uid, desactive: $desactive, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Restaurants &&
        other.uid == uid &&
        other.nom == nom &&
        other.description == description &&
        other.localisation == localisation &&
        other.user_uid == user_uid &&
        other.desactive == desactive &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        description.hashCode ^
        localisation.hashCode ^
        user_uid.hashCode ^
        desactive.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
