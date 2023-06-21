// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserPermissions {
  final String uid;
  final String user_uid;
  final String permission_uid;
  UserPermissions({
    required this.uid,
    required this.user_uid,
    required this.permission_uid,
  });

  factory UserPermissions.FromFirestore(DocumentSnapshot document) {
    return UserPermissions(
        uid: document.id,
        user_uid: (document.data() as Map)['user_uid'],
        permission_uid: (document.data() as Map)['permission_uid']);
  }

  UserPermissions copyWith({
    String? uid,
    String? user_uid,
    String? permission_uid,
  }) {
    return UserPermissions(
      uid: uid ?? this.uid,
      user_uid: user_uid ?? this.user_uid,
      permission_uid: permission_uid ?? this.permission_uid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'user_uid': user_uid});
    result.addAll({'permission_uid': permission_uid});

    return result;
  }

  factory UserPermissions.fromMap(Map<String, dynamic> map) {
    return UserPermissions(
      uid: map['uid'] ?? '',
      user_uid: map['user_uid'] ?? '',
      permission_uid: map['permission_uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserPermissions.fromJson(String source) =>
      UserPermissions.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserPermissions(uid: $uid, user_uid: $user_uid, permission_uid: $permission_uid)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserPermissions &&
        other.uid == uid &&
        other.user_uid == user_uid &&
        other.permission_uid == permission_uid;
  }

  @override
  int get hashCode =>
      uid.hashCode ^ user_uid.hashCode ^ permission_uid.hashCode;
}
