// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Hotels {
  final String uid;
  final String nom;
  final String localisation;
  final int nombre_chambres;
  final String created_at;
  final String updated_at;
  Hotels({
    required this.uid,
    required this.nom,
    required this.localisation,
    required this.nombre_chambres,
    required this.created_at,
    required this.updated_at,
  });

  factory Hotels.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];

    return Hotels(
        uid: document.id,
        nombre_chambres: (document.data() as Map)['nombre_chambres'],
        nom: (document.data() as Map)['nom'],
        localisation: (document.data() as Map)['localisation'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(created.toDate()),
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(updated.toDate()));
  }

  Hotels copyWith({
    String? uid,
    String? nom,
    String? localisation,
    int? nombre_chambres,
    String? created_at,
    String? updated_at,
  }) {
    return Hotels(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      localisation: localisation ?? this.localisation,
      nombre_chambres: nombre_chambres ?? this.nombre_chambres,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'localisation': localisation});
    result.addAll({'nombre_chambres': nombre_chambres});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});

    return result;
  }

  factory Hotels.fromMap(Map<String, dynamic> map) {
    return Hotels(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      localisation: map['localisation'] ?? '',
      nombre_chambres: map['nombre_chambres']?.toInt() ?? 0,
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Hotels.fromJson(String source) => Hotels.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Hotels(uid: $uid, nom: $nom, localisation: $localisation, nombre_chambres: $nombre_chambres, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Hotels &&
        other.uid == uid &&
        other.nom == nom &&
        other.localisation == localisation &&
        other.nombre_chambres == nombre_chambres &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        localisation.hashCode ^
        nombre_chambres.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
