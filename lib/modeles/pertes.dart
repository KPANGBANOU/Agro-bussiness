// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, depend_on_referenced_packages

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Pertes {
  final String uid;
  final String description;
  final String created_at;
  final bool is_updated;
  final String updated_at;
  final int montant;
  final String user_uid;
  Pertes({
    required this.uid,
    required this.description,
    required this.created_at,
    required this.is_updated,
    required this.updated_at,
    required this.montant,
    required this.user_uid,
  });

  factory Pertes.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return Pertes(
        uid: document.id,
        description: (document.data() as Map)['description'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()) +
            " " +
            DateFormat("HH:mm:ss").format(created.toDate()),
        is_updated: (document.data() as Map)['updated'],
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()) +
            " " +
            DateFormat("HH:mm:ss").format(updated.toDate()),
        montant: (document.data() as Map)['montant'],
        user_uid: (document.data() as Map)['user_uid']);
  }

  Pertes copyWith({
    String? uid,
    String? description,
    String? created_at,
    bool? is_updated,
    String? updated_at,
    int? montant,
    String? user_uid,
  }) {
    return Pertes(
      uid: uid ?? this.uid,
      description: description ?? this.description,
      created_at: created_at ?? this.created_at,
      is_updated: is_updated ?? this.is_updated,
      updated_at: updated_at ?? this.updated_at,
      montant: montant ?? this.montant,
      user_uid: user_uid ?? this.user_uid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'description': description});
    result.addAll({'created_at': created_at});
    result.addAll({'is_updated': is_updated});
    result.addAll({'updated_at': updated_at});
    result.addAll({'montant': montant});
    result.addAll({'user_uid': user_uid});

    return result;
  }

  factory Pertes.fromMap(Map<String, dynamic> map) {
    return Pertes(
      uid: map['uid'] ?? '',
      description: map['description'] ?? '',
      created_at: map['created_at'] ?? '',
      is_updated: map['is_updated'] ?? false,
      updated_at: map['updated_at'] ?? '',
      montant: map['montant']?.toInt() ?? 0,
      user_uid: map['user_uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Pertes.fromJson(String source) => Pertes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Pertes(uid: $uid, description: $description, created_at: $created_at, is_updated: $is_updated, updated_at: $updated_at, montant: $montant, user_uid: $user_uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pertes &&
        other.uid == uid &&
        other.description == description &&
        other.created_at == created_at &&
        other.is_updated == is_updated &&
        other.updated_at == updated_at &&
        other.montant == montant &&
        other.user_uid == user_uid;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        description.hashCode ^
        created_at.hashCode ^
        is_updated.hashCode ^
        updated_at.hashCode ^
        montant.hashCode ^
        user_uid.hashCode;
  }
}
