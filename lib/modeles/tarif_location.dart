// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, depend_on_referenced_packages

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class TarifLocations {
  final String uid;
  final String nom;
  final String user_uid;
  final int montant;
  final String created_at;
  final String updated_at;
  TarifLocations({
    required this.uid,
    required this.nom,
    required this.user_uid,
    required this.montant,
    required this.created_at,
    required this.updated_at,
  });

  factory TarifLocations.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return TarifLocations(
        uid: document.id,
        nom: (document.data() as Map)['nom'],
        user_uid: (document.data() as Map)['user_uid'],
        montant: (document.data() as Map)['montant'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()) +
            " " +
            DateFormat("HH:mm:ss").format(created.toDate()),
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(updated.toDate()));
  }

  TarifLocations copyWith({
    String? uid,
    String? nom,
    String? user_uid,
    int? montant,
    String? created_at,
    String? updated_at,
  }) {
    return TarifLocations(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      user_uid: user_uid ?? this.user_uid,
      montant: montant ?? this.montant,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'user_uid': user_uid});
    result.addAll({'montant': montant});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});

    return result;
  }

  factory TarifLocations.fromMap(Map<String, dynamic> map) {
    return TarifLocations(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      user_uid: map['user_uid'] ?? '',
      montant: map['montant']?.toInt() ?? 0,
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TarifLocations.fromJson(String source) =>
      TarifLocations.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TarifLocations(uid: $uid, nom: $nom, user_uid: $user_uid, montant: $montant, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TarifLocations &&
        other.uid == uid &&
        other.nom == nom &&
        other.user_uid == user_uid &&
        other.montant == montant &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        user_uid.hashCode ^
        montant.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
