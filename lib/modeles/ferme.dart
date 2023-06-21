// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, depend_on_referenced_packages

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Fermes {
  final String uid;
  final String nom;
  final String created_at;
  final String updated_at;
  final bool fermee;
  final String user_uid;
  final String description;
  final String localisation;
  Fermes({
    required this.uid,
    required this.nom,
    required this.created_at,
    required this.updated_at,
    required this.fermee,
    required this.user_uid,
    required this.description,
    required this.localisation,
  });

  factory Fermes.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return Fermes(
        uid: document.id,
        nom: (document.data() as Map)['nom'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()) +
            " " +
            DateFormat("HH:mm:ss").format(created.toDate()),
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()) +
            " " +
            DateFormat("HH:mm:ss").format(updated.toDate()),
        fermee: (document.data() as Map)['fermee'],
        user_uid: (document.data() as Map)['user_uid'],
        description: (document.data() as Map)['description'],
        localisation: (document.data() as Map)['localisation']);
  }

  Fermes copyWith({
    String? uid,
    String? nom,
    String? created_at,
    String? updated_at,
    bool? fermee,
    String? user_uid,
    String? description,
    String? localisation,
  }) {
    return Fermes(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      fermee: fermee ?? this.fermee,
      user_uid: user_uid ?? this.user_uid,
      description: description ?? this.description,
      localisation: localisation ?? this.localisation,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});
    result.addAll({'fermee': fermee});
    result.addAll({'user_uid': user_uid});
    result.addAll({'description': description});
    result.addAll({'localisation': localisation});

    return result;
  }

  factory Fermes.fromMap(Map<String, dynamic> map) {
    return Fermes(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      fermee: map['fermee'] ?? false,
      user_uid: map['user_uid'] ?? '',
      description: map['description'] ?? '',
      localisation: map['localisation'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Fermes.fromJson(String source) => Fermes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Fermes(uid: $uid, nom: $nom, created_at: $created_at, updated_at: $updated_at, fermee: $fermee, user_uid: $user_uid, description: $description, localisation: $localisation)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Fermes &&
        other.uid == uid &&
        other.nom == nom &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.fermee == fermee &&
        other.user_uid == user_uid &&
        other.description == description &&
        other.localisation == localisation;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        fermee.hashCode ^
        user_uid.hashCode ^
        description.hashCode ^
        localisation.hashCode;
  }
}
