// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, depend_on_referenced_packages

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Articles {
  final String uid;
  final String nom;
  final String description;
  final String user_uid;
  final int prix_unitaire;
  final int prix_unitaire_achat;
  final int benefice;
  final int benefice_cumule;
  final int montant_vendu;
  final int montant_vendu_cumule;
  final int nombre_commande;
  final bool approvisionne;
  final int nombre_initial;
  final int nombre_initial_cumule;
  final int nombre_disponible;
  final String created_at;
  final String updated_at;
  final bool publie;
  Articles({
    required this.uid,
    required this.nom,
    required this.description,
    required this.user_uid,
    required this.prix_unitaire,
    required this.prix_unitaire_achat,
    required this.benefice,
    required this.benefice_cumule,
    required this.montant_vendu,
    required this.montant_vendu_cumule,
    required this.nombre_commande,
    required this.approvisionne,
    required this.nombre_initial,
    required this.nombre_initial_cumule,
    required this.nombre_disponible,
    required this.created_at,
    required this.updated_at,
    required this.publie,
  });

  factory Articles.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return Articles(
        uid: document.id,
        user_uid: (document.data() as Map)['user_uid'],
        nom: (document.data() as Map)['nom'],
        description: (document.data() as Map)['description'],
        prix_unitaire: (document.data() as Map)['prix_unitaire'],
        prix_unitaire_achat: (document.data() as Map)['prix_unitaire_achat'],
        benefice: (document.data() as Map)['benefice'],
        benefice_cumule: (document.data() as Map)['benefice_cumule'],
        montant_vendu: (document.data() as Map)['montant_vendu'],
        montant_vendu_cumule: (document.data() as Map)['montant_vendu_cumule'],
        nombre_commande: (document.data() as Map)['nombre_commande'],
        approvisionne: (document.data() as Map)['approvisionne'],
        nombre_initial: (document.data() as Map)['nombre_initial'],
        nombre_initial_cumule:
            (document.data() as Map)['nombre_initial_cumule'],
        nombre_disponible: (document.data() as Map)['nombre_disponible'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()) +
            " " +
            DateFormat("HH:mm:ss").format(created.toDate()),
        updated_at: DateFormat("HH:mm:ss").format(updated.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(updated.toDate()),
        publie: (document.data() as Map)['publie']);
  }

  Articles copyWith({
    String? uid,
    String? nom,
    String? description,
    String? user_uid,
    int? prix_unitaire,
    int? prix_unitaire_achat,
    int? benefice,
    int? benefice_cumule,
    int? montant_vendu,
    int? montant_vendu_cumule,
    int? nombre_commande,
    bool? approvisionne,
    int? nombre_initial,
    int? nombre_initial_cumule,
    int? nombre_disponible,
    String? created_at,
    String? updated_at,
    bool? publie,
  }) {
    return Articles(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      description: description ?? this.description,
      user_uid: user_uid ?? this.user_uid,
      prix_unitaire: prix_unitaire ?? this.prix_unitaire,
      prix_unitaire_achat: prix_unitaire_achat ?? this.prix_unitaire_achat,
      benefice: benefice ?? this.benefice,
      benefice_cumule: benefice_cumule ?? this.benefice_cumule,
      montant_vendu: montant_vendu ?? this.montant_vendu,
      montant_vendu_cumule: montant_vendu_cumule ?? this.montant_vendu_cumule,
      nombre_commande: nombre_commande ?? this.nombre_commande,
      approvisionne: approvisionne ?? this.approvisionne,
      nombre_initial: nombre_initial ?? this.nombre_initial,
      nombre_initial_cumule:
          nombre_initial_cumule ?? this.nombre_initial_cumule,
      nombre_disponible: nombre_disponible ?? this.nombre_disponible,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      publie: publie ?? this.publie,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'description': description});
    result.addAll({'user_uid': user_uid});
    result.addAll({'prix_unitaire': prix_unitaire});
    result.addAll({'prix_unitaire_achat': prix_unitaire_achat});
    result.addAll({'benefice': benefice});
    result.addAll({'benefice_cumule': benefice_cumule});
    result.addAll({'montant_vendu': montant_vendu});
    result.addAll({'montant_vendu_cumule': montant_vendu_cumule});
    result.addAll({'nombre_commande': nombre_commande});
    result.addAll({'approvisionne': approvisionne});
    result.addAll({'nombre_initial': nombre_initial});
    result.addAll({'nombre_initial_cumule': nombre_initial_cumule});
    result.addAll({'nombre_disponible': nombre_disponible});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});
    result.addAll({'publie': publie});

    return result;
  }

  factory Articles.fromMap(Map<String, dynamic> map) {
    return Articles(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      description: map['description'] ?? '',
      user_uid: map['user_uid'] ?? '',
      prix_unitaire: map['prix_unitaire']?.toInt() ?? 0,
      prix_unitaire_achat: map['prix_unitaire_achat']?.toInt() ?? 0,
      benefice: map['benefice']?.toInt() ?? 0,
      benefice_cumule: map['benefice_cumule']?.toInt() ?? 0,
      montant_vendu: map['montant_vendu']?.toInt() ?? 0,
      montant_vendu_cumule: map['montant_vendu_cumule']?.toInt() ?? 0,
      nombre_commande: map['nombre_commande']?.toInt() ?? 0,
      approvisionne: map['approvisionne'] ?? false,
      nombre_initial: map['nombre_initial']?.toInt() ?? 0,
      nombre_initial_cumule: map['nombre_initial_cumule']?.toInt() ?? 0,
      nombre_disponible: map['nombre_disponible']?.toInt() ?? 0,
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      publie: map['publie'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Articles.fromJson(String source) =>
      Articles.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Articles(uid: $uid, nom: $nom, description: $description, user_uid: $user_uid, prix_unitaire: $prix_unitaire, prix_unitaire_achat: $prix_unitaire_achat, benefice: $benefice, benefice_cumule: $benefice_cumule, montant_vendu: $montant_vendu, montant_vendu_cumule: $montant_vendu_cumule, nombre_commande: $nombre_commande, approvisionne: $approvisionne, nombre_initial: $nombre_initial, nombre_initial_cumule: $nombre_initial_cumule, nombre_disponible: $nombre_disponible, created_at: $created_at, updated_at: $updated_at, publie: $publie)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Articles &&
        other.uid == uid &&
        other.nom == nom &&
        other.description == description &&
        other.user_uid == user_uid &&
        other.prix_unitaire == prix_unitaire &&
        other.prix_unitaire_achat == prix_unitaire_achat &&
        other.benefice == benefice &&
        other.benefice_cumule == benefice_cumule &&
        other.montant_vendu == montant_vendu &&
        other.montant_vendu_cumule == montant_vendu_cumule &&
        other.nombre_commande == nombre_commande &&
        other.approvisionne == approvisionne &&
        other.nombre_initial == nombre_initial &&
        other.nombre_initial_cumule == nombre_initial_cumule &&
        other.nombre_disponible == nombre_disponible &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.publie == publie;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        description.hashCode ^
        user_uid.hashCode ^
        prix_unitaire.hashCode ^
        prix_unitaire_achat.hashCode ^
        benefice.hashCode ^
        benefice_cumule.hashCode ^
        montant_vendu.hashCode ^
        montant_vendu_cumule.hashCode ^
        nombre_commande.hashCode ^
        approvisionne.hashCode ^
        nombre_initial.hashCode ^
        nombre_initial_cumule.hashCode ^
        nombre_disponible.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        publie.hashCode;
  }
}
