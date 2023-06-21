// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class LivreInformations {
  final String uid;
  final String livre_uid;
  final String type_livre_uid;
  final int nombre_initial;
  final int nombre_initial_cumule;
  final int nombre_physique;
  final int seuil_approvisionnement;
  final int benefice;
  final int benefice_cumule;
  final int montant_vendu;
  final int montant_vendu_cumule;
  LivreInformations({
    required this.uid,
    required this.livre_uid,
    required this.type_livre_uid,
    required this.nombre_initial,
    required this.nombre_initial_cumule,
    required this.nombre_physique,
    required this.seuil_approvisionnement,
    required this.benefice,
    required this.benefice_cumule,
    required this.montant_vendu,
    required this.montant_vendu_cumule,
  });

  factory LivreInformations.FromFirestore(DocumentSnapshot document) {
    return LivreInformations(
        uid: document.id,
        livre_uid: (document.data() as Map)['livre_uid'],
        type_livre_uid: (document.data() as Map)['type_livre_uid'],
        nombre_initial: (document.data() as Map)['nombre_initial'],
        nombre_initial_cumule:
            (document.data() as Map)['nombre_initial_cumule'],
        nombre_physique: (document.data() as Map)['nombre_physique'],
        seuil_approvisionnement:
            (document.data() as Map)['seuil_approvisionnement'],
        benefice: (document.data() as Map)['benefice'],
        benefice_cumule: (document.data() as Map)['benefice_cumule'],
        montant_vendu: (document.data() as Map)['montant_vendu'],
        montant_vendu_cumule: (document.data() as Map)['montant_vendu_cumule']);
  }

  LivreInformations copyWith({
    String? uid,
    String? livre_uid,
    String? type_livre_uid,
    int? nombre_initial,
    int? nombre_initial_cumule,
    int? nombre_physique,
    int? seuil_approvisionnement,
    int? benefice,
    int? benefice_cumule,
    int? montant_vendu,
    int? montant_vendu_cumule,
  }) {
    return LivreInformations(
      uid: uid ?? this.uid,
      livre_uid: livre_uid ?? this.livre_uid,
      type_livre_uid: type_livre_uid ?? this.type_livre_uid,
      nombre_initial: nombre_initial ?? this.nombre_initial,
      nombre_initial_cumule:
          nombre_initial_cumule ?? this.nombre_initial_cumule,
      nombre_physique: nombre_physique ?? this.nombre_physique,
      seuil_approvisionnement:
          seuil_approvisionnement ?? this.seuil_approvisionnement,
      benefice: benefice ?? this.benefice,
      benefice_cumule: benefice_cumule ?? this.benefice_cumule,
      montant_vendu: montant_vendu ?? this.montant_vendu,
      montant_vendu_cumule: montant_vendu_cumule ?? this.montant_vendu_cumule,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'livre_uid': livre_uid});
    result.addAll({'type_livre_uid': type_livre_uid});
    result.addAll({'nombre_initial': nombre_initial});
    result.addAll({'nombre_initial_cumule': nombre_initial_cumule});
    result.addAll({'nombre_physique': nombre_physique});
    result.addAll({'seuil_approvisionnement': seuil_approvisionnement});
    result.addAll({'benefice': benefice});
    result.addAll({'benefice_cumule': benefice_cumule});
    result.addAll({'montant_vendu': montant_vendu});
    result.addAll({'montant_vendu_cumule': montant_vendu_cumule});

    return result;
  }

  factory LivreInformations.fromMap(Map<String, dynamic> map) {
    return LivreInformations(
      uid: map['uid'] ?? '',
      livre_uid: map['livre_uid'] ?? '',
      type_livre_uid: map['type_livre_uid'] ?? '',
      nombre_initial: map['nombre_initial']?.toInt() ?? 0,
      nombre_initial_cumule: map['nombre_initial_cumule']?.toInt() ?? 0,
      nombre_physique: map['nombre_physique']?.toInt() ?? 0,
      seuil_approvisionnement: map['seuil_approvisionnement']?.toInt() ?? 0,
      benefice: map['benefice']?.toInt() ?? 0,
      benefice_cumule: map['benefice_cumule']?.toInt() ?? 0,
      montant_vendu: map['montant_vendu']?.toInt() ?? 0,
      montant_vendu_cumule: map['montant_vendu_cumule']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory LivreInformations.fromJson(String source) =>
      LivreInformations.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LivreInformations(uid: $uid, livre_uid: $livre_uid, type_livre_uid: $type_livre_uid, nombre_initial: $nombre_initial, nombre_initial_cumule: $nombre_initial_cumule, nombre_physique: $nombre_physique, seuil_approvisionnement: $seuil_approvisionnement, benefice: $benefice, benefice_cumule: $benefice_cumule, montant_vendu: $montant_vendu, montant_vendu_cumule: $montant_vendu_cumule)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LivreInformations &&
        other.uid == uid &&
        other.livre_uid == livre_uid &&
        other.type_livre_uid == type_livre_uid &&
        other.nombre_initial == nombre_initial &&
        other.nombre_initial_cumule == nombre_initial_cumule &&
        other.nombre_physique == nombre_physique &&
        other.seuil_approvisionnement == seuil_approvisionnement &&
        other.benefice == benefice &&
        other.benefice_cumule == benefice_cumule &&
        other.montant_vendu == montant_vendu &&
        other.montant_vendu_cumule == montant_vendu_cumule;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        livre_uid.hashCode ^
        type_livre_uid.hashCode ^
        nombre_initial.hashCode ^
        nombre_initial_cumule.hashCode ^
        nombre_physique.hashCode ^
        seuil_approvisionnement.hashCode ^
        benefice.hashCode ^
        benefice_cumule.hashCode ^
        montant_vendu.hashCode ^
        montant_vendu_cumule.hashCode;
  }
}
