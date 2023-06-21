// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ProprieteChambres {
  final String uid;
  final String nom;
  final String user_uid;
  final String updated_at;
  final String created_at;
  final bool estObligatoire;
  ProprieteChambres({
    required this.uid,
    required this.nom,
    required this.user_uid,
    required this.updated_at,
    required this.created_at,
    required this.estObligatoire,
  });

  factory ProprieteChambres.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return ProprieteChambres(
        uid: document.id,
        nom: (document.data() as Map)['nom'],
        user_uid: (document.data() as Map)['user_uid'],
        updated_at: DateFormat("dd-MM-yyyyb").format(updated.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(updated.toDate()),
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(created.toDate()),
        estObligatoire: (document.data() as Map)['estObligatoire']);
  }

  ProprieteChambres copyWith({
    String? uid,
    String? nom,
    String? user_uid,
    String? updated_at,
    String? created_at,
    bool? estObligatoire,
  }) {
    return ProprieteChambres(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      user_uid: user_uid ?? this.user_uid,
      updated_at: updated_at ?? this.updated_at,
      created_at: created_at ?? this.created_at,
      estObligatoire: estObligatoire ?? this.estObligatoire,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'user_uid': user_uid});
    result.addAll({'updated_at': updated_at});
    result.addAll({'created_at': created_at});
    result.addAll({'estObligatoire': estObligatoire});

    return result;
  }

  factory ProprieteChambres.fromMap(Map<String, dynamic> map) {
    return ProprieteChambres(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      user_uid: map['user_uid'] ?? '',
      updated_at: map['updated_at'] ?? '',
      created_at: map['created_at'] ?? '',
      estObligatoire: map['estObligatoire'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProprieteChambres.fromJson(String source) =>
      ProprieteChambres.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProprieteChambres(uid: $uid, nom: $nom, user_uid: $user_uid, updated_at: $updated_at, created_at: $created_at, estObligatoire: $estObligatoire)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProprieteChambres &&
        other.uid == uid &&
        other.nom == nom &&
        other.user_uid == user_uid &&
        other.updated_at == updated_at &&
        other.created_at == created_at &&
        other.estObligatoire == estObligatoire;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        user_uid.hashCode ^
        updated_at.hashCode ^
        created_at.hashCode ^
        estObligatoire.hashCode;
  }
}
