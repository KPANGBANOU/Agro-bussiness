// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class CaracteristiqueChambres {
  final String uid;
  final String valeur;
  final String propriete_uid;
  final String chambre_uid;
  CaracteristiqueChambres({
    required this.uid,
    required this.valeur,
    required this.propriete_uid,
    required this.chambre_uid,
  });

  factory CaracteristiqueChambres.FromFirestore(DocumentSnapshot document) {
    return CaracteristiqueChambres(
        uid: document.id,
        valeur: (document.data() as Map)['valeur'],
        propriete_uid: (document.data() as Map)['propriete_uid'],
        chambre_uid: (document.data() as Map)['chambre_uid']);
  }

  CaracteristiqueChambres copyWith({
    String? uid,
    String? valeur,
    String? propriete_uid,
    String? chambre_uid,
  }) {
    return CaracteristiqueChambres(
      uid: uid ?? this.uid,
      valeur: valeur ?? this.valeur,
      propriete_uid: propriete_uid ?? this.propriete_uid,
      chambre_uid: chambre_uid ?? this.chambre_uid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'valeur': valeur});
    result.addAll({'propriete_uid': propriete_uid});
    result.addAll({'chambre_uid': chambre_uid});

    return result;
  }

  factory CaracteristiqueChambres.fromMap(Map<String, dynamic> map) {
    return CaracteristiqueChambres(
      uid: map['uid'] ?? '',
      valeur: map['valeur'] ?? '',
      propriete_uid: map['propriete_uid'] ?? '',
      chambre_uid: map['chambre_uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CaracteristiqueChambres.fromJson(String source) =>
      CaracteristiqueChambres.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CaracteristiqueChambres(uid: $uid, valeur: $valeur, propriete_uid: $propriete_uid, chambre_uid: $chambre_uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CaracteristiqueChambres &&
        other.uid == uid &&
        other.valeur == valeur &&
        other.propriete_uid == propriete_uid &&
        other.chambre_uid == chambre_uid;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        valeur.hashCode ^
        propriete_uid.hashCode ^
        chambre_uid.hashCode;
  }
}
