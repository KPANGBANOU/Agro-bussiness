// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, depend_on_referenced_packages

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Appartements {
  final String uid;
  final String nom;
  final String description;
  final String user_uid;
  final String created_at;
  final String updated_at;
  final String photo_url;
  final String localisation;
  final bool disponible;
  final int date_location;
  final String detail;
  final String termes_negociation;
  Appartements({
    required this.uid,
    required this.nom,
    required this.description,
    required this.user_uid,
    required this.created_at,
    required this.updated_at,
    required this.photo_url,
    required this.localisation,
    required this.disponible,
    required this.date_location,
    required this.detail,
    required this.termes_negociation,
  });

  factory Appartements.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    Timestamp date = (document.data() as Map)['date_location'];
    return Appartements(
        detail: (document.data() as Map)['detail'],
        termes_negociation: (document.data() as Map)['termes_negociation'],
        nom: (document.data() as Map)['nom'],
        date_location: date.seconds,
        disponible: (document.data() as Map)['disponible'],
        uid: document.id,
        description: (document.data() as Map)['description'],
        user_uid: (document.data() as Map)['user_uid'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(created.toDate()),
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()) +
            " à " +
            DateFormat("HH:mm:ss").format(updated.toDate()),
        photo_url: (document.data() as Map)['photo_url'],
        localisation: (document.data() as Map)['localisation']);
  }

  Appartements copyWith({
    String? uid,
    String? nom,
    String? description,
    String? user_uid,
    String? created_at,
    String? updated_at,
    String? photo_url,
    String? localisation,
    bool? disponible,
    int? date_location,
    String? detail,
    String? termes_negociation,
  }) {
    return Appartements(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      description: description ?? this.description,
      user_uid: user_uid ?? this.user_uid,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      photo_url: photo_url ?? this.photo_url,
      localisation: localisation ?? this.localisation,
      disponible: disponible ?? this.disponible,
      date_location: date_location ?? this.date_location,
      detail: detail ?? this.detail,
      termes_negociation: termes_negociation ?? this.termes_negociation,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'description': description});
    result.addAll({'user_uid': user_uid});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});
    result.addAll({'photo_url': photo_url});
    result.addAll({'localisation': localisation});
    result.addAll({'disponible': disponible});
    result.addAll({'date_location': date_location});
    result.addAll({'detail': detail});
    result.addAll({'termes_negociation': termes_negociation});

    return result;
  }

  factory Appartements.fromMap(Map<String, dynamic> map) {
    return Appartements(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      description: map['description'] ?? '',
      user_uid: map['user_uid'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      photo_url: map['photo_url'] ?? '',
      localisation: map['localisation'] ?? '',
      disponible: map['disponible'] ?? false,
      date_location: map['date_location']?.toInt() ?? 0,
      detail: map['detail'] ?? '',
      termes_negociation: map['termes_negociation'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Appartements.fromJson(String source) =>
      Appartements.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Appartements(uid: $uid, nom: $nom, description: $description, user_uid: $user_uid, created_at: $created_at, updated_at: $updated_at, photo_url: $photo_url, localisation: $localisation, disponible: $disponible, date_location: $date_location, detail: $detail, termes_negociation: $termes_negociation)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Appartements &&
        other.uid == uid &&
        other.nom == nom &&
        other.description == description &&
        other.user_uid == user_uid &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.photo_url == photo_url &&
        other.localisation == localisation &&
        other.disponible == disponible &&
        other.date_location == date_location &&
        other.detail == detail &&
        other.termes_negociation == termes_negociation;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        description.hashCode ^
        user_uid.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        photo_url.hashCode ^
        localisation.hashCode ^
        disponible.hashCode ^
        date_location.hashCode ^
        detail.hashCode ^
        termes_negociation.hashCode;
  }
}
