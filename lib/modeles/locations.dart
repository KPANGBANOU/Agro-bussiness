// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, depend_on_referenced_packages

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Locations {
  final String uid;
  final String appartement_uid;
  final String tarif_uid;
  final String locateur_uid;
  final String created_at;
  final String updated_at;
  final bool annule;
  final String appartement_nom;
  String photo_url;
  Locations({
    required this.uid,
    required this.appartement_uid,
    required this.tarif_uid,
    required this.locateur_uid,
    required this.created_at,
    required this.updated_at,
    required this.annule,
    required this.appartement_nom,
    required this.photo_url,
  });
  factory Locations.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return Locations(
        uid: document.id,
        appartement_nom: (document.data() as Map)['appartement_nom'],
        photo_url: (document.data() as Map)['photo_url'],
        appartement_uid: (document.data() as Map)['appartement_uid'],
        tarif_uid: (document.data() as Map)['tarif_uid'],
        locateur_uid: (document.data() as Map)['locateur_uid'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(created.toDate()),
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(updated.toDate()),
        annule: (document.data() as Map)['annule']);
  }
  Locations copyWith({
    String? uid,
    String? appartement_uid,
    String? tarif_uid,
    String? locateur_uid,
    String? created_at,
    String? updated_at,
    bool? annule,
    String? appartement_nom,
    String? photo_url,
  }) {
    return Locations(
      uid: uid ?? this.uid,
      appartement_uid: appartement_uid ?? this.appartement_uid,
      tarif_uid: tarif_uid ?? this.tarif_uid,
      locateur_uid: locateur_uid ?? this.locateur_uid,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      annule: annule ?? this.annule,
      appartement_nom: appartement_nom ?? this.appartement_nom,
      photo_url: photo_url ?? this.photo_url,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'appartement_uid': appartement_uid});
    result.addAll({'tarif_uid': tarif_uid});
    result.addAll({'locateur_uid': locateur_uid});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});
    result.addAll({'annule': annule});
    result.addAll({'appartement_nom': appartement_nom});
    result.addAll({'photo_url': photo_url});

    return result;
  }

  factory Locations.fromMap(Map<String, dynamic> map) {
    return Locations(
      uid: map['uid'] ?? '',
      appartement_uid: map['appartement_uid'] ?? '',
      tarif_uid: map['tarif_uid'] ?? '',
      locateur_uid: map['locateur_uid'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      annule: map['annule'] ?? false,
      appartement_nom: map['appartement_nom'] ?? '',
      photo_url: map['photo_url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Locations.fromJson(String source) =>
      Locations.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Locations(uid: $uid, appartement_uid: $appartement_uid, tarif_uid: $tarif_uid, locateur_uid: $locateur_uid, created_at: $created_at, updated_at: $updated_at, annule: $annule, appartement_nom: $appartement_nom, photo_url: $photo_url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Locations &&
        other.uid == uid &&
        other.appartement_uid == appartement_uid &&
        other.tarif_uid == tarif_uid &&
        other.locateur_uid == locateur_uid &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.annule == annule &&
        other.appartement_nom == appartement_nom &&
        other.photo_url == photo_url;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        appartement_uid.hashCode ^
        tarif_uid.hashCode ^
        locateur_uid.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        annule.hashCode ^
        appartement_nom.hashCode ^
        photo_url.hashCode;
  }
}
