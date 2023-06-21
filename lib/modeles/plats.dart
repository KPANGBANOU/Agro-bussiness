// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, depend_on_referenced_packages

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Plats {
  final String uid;
  final String nom;
  final int prix_unitaire;
  final int montant_vendu;
  final int montant_vendu_cumule;
  final int nombre_initial;
  final int nombre_initial_cumule;
  final int nombre_disponible;
  final String user_uid;
  final bool approvisionne;
  final String created_at;
  final String updated_at;
  final int nombre_commande;
  final bool desactive;
  Plats({
    required this.uid,
    required this.nom,
    required this.prix_unitaire,
    required this.montant_vendu,
    required this.montant_vendu_cumule,
    required this.nombre_initial,
    required this.nombre_initial_cumule,
    required this.nombre_disponible,
    required this.user_uid,
    required this.approvisionne,
    required this.created_at,
    required this.updated_at,
    required this.nombre_commande,
    required this.desactive,
  });

  factory Plats.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return Plats(
        uid: document.id,
        nom: (document.data() as Map)['nom'],
        prix_unitaire: (document.data() as Map)['prix_unitaire'],
        montant_vendu: (document.data() as Map)['montant_vendu'],
        montant_vendu_cumule: (document.data() as Map)['montant_vendu_cumule'],
        nombre_initial: (document.data() as Map)['nombre_initial'],
        nombre_initial_cumule:
            (document.data() as Map)['nombre_initial_cumule'],
        nombre_disponible: (document.data() as Map)['nombre_disponible'],
        user_uid: (document.data() as Map)['user_uid'],
        approvisionne: (document.data() as Map)['approvisionne'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(created.toDate()),
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(updated.toDate()),
        nombre_commande: (document.data() as Map)['nombre_commande'],
        desactive: (document.data() as Map)['desactive']);
  }

  Plats copyWith({
    String? uid,
    String? nom,
    int? prix_unitaire,
    int? montant_vendu,
    int? montant_vendu_cumule,
    int? nombre_initial,
    int? nombre_initial_cumule,
    int? nombre_disponible,
    String? user_uid,
    bool? approvisionne,
    String? created_at,
    String? updated_at,
    int? nombre_commande,
    bool? desactive,
  }) {
    return Plats(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      prix_unitaire: prix_unitaire ?? this.prix_unitaire,
      montant_vendu: montant_vendu ?? this.montant_vendu,
      montant_vendu_cumule: montant_vendu_cumule ?? this.montant_vendu_cumule,
      nombre_initial: nombre_initial ?? this.nombre_initial,
      nombre_initial_cumule:
          nombre_initial_cumule ?? this.nombre_initial_cumule,
      nombre_disponible: nombre_disponible ?? this.nombre_disponible,
      user_uid: user_uid ?? this.user_uid,
      approvisionne: approvisionne ?? this.approvisionne,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      nombre_commande: nombre_commande ?? this.nombre_commande,
      desactive: desactive ?? this.desactive,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'prix_unitaire': prix_unitaire});
    result.addAll({'montant_vendu': montant_vendu});
    result.addAll({'montant_vendu_cumule': montant_vendu_cumule});
    result.addAll({'nombre_initial': nombre_initial});
    result.addAll({'nombre_initial_cumule': nombre_initial_cumule});
    result.addAll({'nombre_disponible': nombre_disponible});
    result.addAll({'user_uid': user_uid});
    result.addAll({'approvisionne': approvisionne});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});
    result.addAll({'nombre_commande': nombre_commande});
    result.addAll({'desactive': desactive});

    return result;
  }

  factory Plats.fromMap(Map<String, dynamic> map) {
    return Plats(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      prix_unitaire: map['prix_unitaire']?.toInt() ?? 0,
      montant_vendu: map['montant_vendu']?.toInt() ?? 0,
      montant_vendu_cumule: map['montant_vendu_cumule']?.toInt() ?? 0,
      nombre_initial: map['nombre_initial']?.toInt() ?? 0,
      nombre_initial_cumule: map['nombre_initial_cumule']?.toInt() ?? 0,
      nombre_disponible: map['nombre_disponible']?.toInt() ?? 0,
      user_uid: map['user_uid'] ?? '',
      approvisionne: map['approvisionne'] ?? false,
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      nombre_commande: map['nombre_commande']?.toInt() ?? 0,
      desactive: map['desactive'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Plats.fromJson(String source) => Plats.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Plats(uid: $uid, nom: $nom, prix_unitaire: $prix_unitaire, montant_vendu: $montant_vendu, montant_vendu_cumule: $montant_vendu_cumule, nombre_initial: $nombre_initial, nombre_initial_cumule: $nombre_initial_cumule, nombre_disponible: $nombre_disponible, user_uid: $user_uid, approvisionne: $approvisionne, created_at: $created_at, updated_at: $updated_at, nombre_commande: $nombre_commande, desactive: $desactive)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Plats &&
        other.uid == uid &&
        other.nom == nom &&
        other.prix_unitaire == prix_unitaire &&
        other.montant_vendu == montant_vendu &&
        other.montant_vendu_cumule == montant_vendu_cumule &&
        other.nombre_initial == nombre_initial &&
        other.nombre_initial_cumule == nombre_initial_cumule &&
        other.nombre_disponible == nombre_disponible &&
        other.user_uid == user_uid &&
        other.approvisionne == approvisionne &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.nombre_commande == nombre_commande &&
        other.desactive == desactive;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        prix_unitaire.hashCode ^
        montant_vendu.hashCode ^
        montant_vendu_cumule.hashCode ^
        nombre_initial.hashCode ^
        nombre_initial_cumule.hashCode ^
        nombre_disponible.hashCode ^
        user_uid.hashCode ^
        approvisionne.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        nombre_commande.hashCode ^
        desactive.hashCode;
  }
}
