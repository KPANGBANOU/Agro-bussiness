// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ChambreHotels {
  final String uid;
  final String nom;
  final String description;
  final int nombre_place;
  final String photo_url;
  final String created_at;
  final String updated_at;
  final String user_uid;
  ChambreHotels({
    required this.uid,
    required this.nom,
    required this.description,
    required this.nombre_place,
    required this.photo_url,
    required this.created_at,
    required this.updated_at,
    required this.user_uid,
  });

  factory ChambreHotels.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return ChambreHotels(
        uid: document.id,
        nom: (document.data() as Map)['nom'],
        description: (document.data() as Map)['description'],
        nombre_place: (document.data() as Map)['nombre_place'],
        photo_url: (document.data() as Map)['photo_url'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(created.toDate()),
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(updated.toDate()),
        user_uid: (document.data() as Map)['user_uid']);
  }

  ChambreHotels copyWith({
    String? uid,
    String? nom,
    String? description,
    int? nombre_place,
    String? photo_url,
    String? created_at,
    String? updated_at,
    String? user_uid,
  }) {
    return ChambreHotels(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      description: description ?? this.description,
      nombre_place: nombre_place ?? this.nombre_place,
      photo_url: photo_url ?? this.photo_url,
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
    result.addAll({'nombre_place': nombre_place});
    result.addAll({'photo_url': photo_url});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});
    result.addAll({'user_uid': user_uid});

    return result;
  }

  factory ChambreHotels.fromMap(Map<String, dynamic> map) {
    return ChambreHotels(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      description: map['description'] ?? '',
      nombre_place: map['nombre_place']?.toInt() ?? 0,
      photo_url: map['photo_url'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      user_uid: map['user_uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChambreHotels.fromJson(String source) =>
      ChambreHotels.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChambreHotels(uid: $uid, nom: $nom, description: $description, nombre_place: $nombre_place, photo_url: $photo_url, created_at: $created_at, updated_at: $updated_at, user_uid: $user_uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChambreHotels &&
        other.uid == uid &&
        other.nom == nom &&
        other.description == description &&
        other.nombre_place == nombre_place &&
        other.photo_url == photo_url &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.user_uid == user_uid;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        description.hashCode ^
        nombre_place.hashCode ^
        photo_url.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        user_uid.hashCode;
  }
}
