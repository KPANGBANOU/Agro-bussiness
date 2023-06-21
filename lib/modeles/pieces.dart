// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Pieces {
  final String uid;
  final String type_piece_uid;
  final String numero_piece;
  final String date_delivrance;
  final String date_expiration;
  final String user_uid;
  Pieces({
    required this.uid,
    required this.type_piece_uid,
    required this.numero_piece,
    required this.date_delivrance,
    required this.date_expiration,
    required this.user_uid,
  });

  factory Pieces.FromFirestore(DocumentSnapshot document) {
    return Pieces(
        uid: document.id,
        type_piece_uid: (document.data() as Map)['type_piece_uid'],
        numero_piece: (document.data() as Map)['numero_piece'],
        date_delivrance: (document.data() as Map)['date_delivrance'],
        date_expiration: (document.data() as Map)['date_expiration'],
        user_uid: (document.data() as Map)['user_uid']);
  }

  Pieces copyWith({
    String? uid,
    String? type_piece_uid,
    String? numero_piece,
    String? date_delivrance,
    String? date_expiration,
    String? user_uid,
  }) {
    return Pieces(
      uid: uid ?? this.uid,
      type_piece_uid: type_piece_uid ?? this.type_piece_uid,
      numero_piece: numero_piece ?? this.numero_piece,
      date_delivrance: date_delivrance ?? this.date_delivrance,
      date_expiration: date_expiration ?? this.date_expiration,
      user_uid: user_uid ?? this.user_uid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'type_piece_uid': type_piece_uid});
    result.addAll({'numero_piece': numero_piece});
    result.addAll({'date_delivrance': date_delivrance});
    result.addAll({'date_expiration': date_expiration});
    result.addAll({'user_uid': user_uid});

    return result;
  }

  factory Pieces.fromMap(Map<String, dynamic> map) {
    return Pieces(
      uid: map['uid'] ?? '',
      type_piece_uid: map['type_piece_uid'] ?? '',
      numero_piece: map['numero_piece'] ?? '',
      date_delivrance: map['date_delivrance'] ?? '',
      date_expiration: map['date_expiration'] ?? '',
      user_uid: map['user_uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Pieces.fromJson(String source) => Pieces.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Pieces(uid: $uid, type_piece_uid: $type_piece_uid, numero_piece: $numero_piece, date_delivrance: $date_delivrance, date_expiration: $date_expiration, user_uid: $user_uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pieces &&
        other.uid == uid &&
        other.type_piece_uid == type_piece_uid &&
        other.numero_piece == numero_piece &&
        other.date_delivrance == date_delivrance &&
        other.date_expiration == date_expiration &&
        other.user_uid == user_uid;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        type_piece_uid.hashCode ^
        numero_piece.hashCode ^
        date_delivrance.hashCode ^
        date_expiration.hashCode ^
        user_uid.hashCode;
  }
}
