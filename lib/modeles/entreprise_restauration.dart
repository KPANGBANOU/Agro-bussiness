// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, depend_on_referenced_packages

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class EntrepriseRestaurations {
  final String uid;
  final String nom;
  final String description;
  final String siege;
  final String localisation;
  final int nombre_restaurants;
  final bool desactive;
  final String created_at;
  final String updated_at;
  final String user_uid;
  EntrepriseRestaurations({
    required this.uid,
    required this.nom,
    required this.description,
    required this.siege,
    required this.localisation,
    required this.nombre_restaurants,
    required this.desactive,
    required this.created_at,
    required this.updated_at,
    required this.user_uid,
  });

  factory EntrepriseRestaurations.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return EntrepriseRestaurations(
        uid: document.id,
        nom: (document.data() as Map)['nom'],
        description: (document.data() as Map)['description'],
        siege: (document.data() as Map)['siege'],
        localisation: (document.data() as Map)['localisation'],
        nombre_restaurants: (document.data() as Map)['nombre_restaurants'],
        desactive: (document.data() as Map)['desactive'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(created.toDate()),
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(updated.toDate()),
        user_uid: (document.data() as Map)['user_uid']);
  }

  EntrepriseRestaurations copyWith({
    String? uid,
    String? nom,
    String? description,
    String? siege,
    String? localisation,
    int? nombre_restaurants,
    bool? desactive,
    String? created_at,
    String? updated_at,
    String? user_uid,
  }) {
    return EntrepriseRestaurations(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      description: description ?? this.description,
      siege: siege ?? this.siege,
      localisation: localisation ?? this.localisation,
      nombre_restaurants: nombre_restaurants ?? this.nombre_restaurants,
      desactive: desactive ?? this.desactive,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      user_uid: user_uid ?? this.user_uid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'description': description});
    result.addAll({'siege': siege});
    result.addAll({'localisation': localisation});
    result.addAll({'nombre_restaurants': nombre_restaurants});
    result.addAll({'desactive': desactive});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});
    result.addAll({'user_uid': user_uid});

    return result;
  }

  factory EntrepriseRestaurations.fromMap(Map<String, dynamic> map) {
    return EntrepriseRestaurations(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      description: map['description'] ?? '',
      siege: map['siege'] ?? '',
      localisation: map['localisation'] ?? '',
      nombre_restaurants: map['nombre_restaurants']?.toInt() ?? 0,
      desactive: map['desactive'] ?? false,
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      user_uid: map['user_uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EntrepriseRestaurations.fromJson(String source) =>
      EntrepriseRestaurations.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EntrepriseRestaurations(uid: $uid, nom: $nom, description: $description, siege: $siege, localisation: $localisation, nombre_restaurants: $nombre_restaurants, desactive: $desactive, created_at: $created_at, updated_at: $updated_at, user_uid: $user_uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EntrepriseRestaurations &&
        other.uid == uid &&
        other.nom == nom &&
        other.description == description &&
        other.siege == siege &&
        other.localisation == localisation &&
        other.nombre_restaurants == nombre_restaurants &&
        other.desactive == desactive &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.user_uid == user_uid;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        description.hashCode ^
        siege.hashCode ^
        localisation.hashCode ^
        nombre_restaurants.hashCode ^
        desactive.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        user_uid.hashCode;
  }
}
