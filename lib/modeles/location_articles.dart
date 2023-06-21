// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class LocationArticles {
  final String uid;
  final String user_uid;
  final String article_uid;
  final String statut_location_uid;
  final String tarification_uid;
  final String paiement_uid;
  final String photo_url;
  final String article_nom;
  final String created_at;
  final String updated_at;
  LocationArticles({
    required this.uid,
    required this.user_uid,
    required this.article_uid,
    required this.statut_location_uid,
    required this.tarification_uid,
    required this.paiement_uid,
    required this.photo_url,
    required this.article_nom,
    required this.created_at,
    required this.updated_at,
  });

  factory LocationArticles.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return LocationArticles(
        uid: document.id,
        user_uid: (document.data() as Map)['user_uid'],
        article_uid: (document.data() as Map)['article_uid'],
        statut_location_uid: (document.data() as Map)['statut_location_uid'],
        tarification_uid: (document.data() as Map)['tarification_uid'],
        paiement_uid: (document.data() as Map)['paiement_uid'],
        photo_url: (document.data() as Map)['photo_url'],
        article_nom: (document.data() as Map)['article_nom'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(created.toDate()),
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(updated.toDate()));
  }

  LocationArticles copyWith({
    String? uid,
    String? user_uid,
    String? article_uid,
    String? statut_location_uid,
    String? tarification_uid,
    String? paiement_uid,
    String? photo_url,
    String? article_nom,
    String? created_at,
    String? updated_at,
  }) {
    return LocationArticles(
      uid: uid ?? this.uid,
      user_uid: user_uid ?? this.user_uid,
      article_uid: article_uid ?? this.article_uid,
      statut_location_uid: statut_location_uid ?? this.statut_location_uid,
      tarification_uid: tarification_uid ?? this.tarification_uid,
      paiement_uid: paiement_uid ?? this.paiement_uid,
      photo_url: photo_url ?? this.photo_url,
      article_nom: article_nom ?? this.article_nom,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'user_uid': user_uid});
    result.addAll({'article_uid': article_uid});
    result.addAll({'statut_location_uid': statut_location_uid});
    result.addAll({'tarification_uid': tarification_uid});
    result.addAll({'paiement_uid': paiement_uid});
    result.addAll({'photo_url': photo_url});
    result.addAll({'article_nom': article_nom});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});

    return result;
  }

  factory LocationArticles.fromMap(Map<String, dynamic> map) {
    return LocationArticles(
      uid: map['uid'] ?? '',
      user_uid: map['user_uid'] ?? '',
      article_uid: map['article_uid'] ?? '',
      statut_location_uid: map['statut_location_uid'] ?? '',
      tarification_uid: map['tarification_uid'] ?? '',
      paiement_uid: map['paiement_uid'] ?? '',
      photo_url: map['photo_url'] ?? '',
      article_nom: map['article_nom'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationArticles.fromJson(String source) =>
      LocationArticles.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LocationArticles(uid: $uid, user_uid: $user_uid, article_uid: $article_uid, statut_location_uid: $statut_location_uid, tarification_uid: $tarification_uid, paiement_uid: $paiement_uid, photo_url: $photo_url, article_nom: $article_nom, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocationArticles &&
        other.uid == uid &&
        other.user_uid == user_uid &&
        other.article_uid == article_uid &&
        other.statut_location_uid == statut_location_uid &&
        other.tarification_uid == tarification_uid &&
        other.paiement_uid == paiement_uid &&
        other.photo_url == photo_url &&
        other.article_nom == article_nom &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        user_uid.hashCode ^
        article_uid.hashCode ^
        statut_location_uid.hashCode ^
        tarification_uid.hashCode ^
        paiement_uid.hashCode ^
        photo_url.hashCode ^
        article_nom.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
