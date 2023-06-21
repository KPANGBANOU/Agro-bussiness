// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserRules {
  final String uid;
  final String user_uid;
  final String rule_uid;
  UserRules({
    required this.uid,
    required this.user_uid,
    required this.rule_uid,
  });

  factory UserRules.FromFirestore(DocumentSnapshot document) {
    return UserRules(
        uid: document.id,
        user_uid: (document.data() as Map)['user_uid'],
        rule_uid: (document.data() as Map)['rule_uid']);
  }

  UserRules copyWith({
    String? uid,
    String? user_uid,
    String? rule_uid,
  }) {
    return UserRules(
      uid: uid ?? this.uid,
      user_uid: user_uid ?? this.user_uid,
      rule_uid: rule_uid ?? this.rule_uid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'user_uid': user_uid});
    result.addAll({'rule_uid': rule_uid});

    return result;
  }

  factory UserRules.fromMap(Map<String, dynamic> map) {
    return UserRules(
      uid: map['uid'] ?? '',
      user_uid: map['user_uid'] ?? '',
      rule_uid: map['rule_uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserRules.fromJson(String source) =>
      UserRules.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserRules(uid: $uid, user_uid: $user_uid, rule_uid: $rule_uid)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserRules &&
        other.uid == uid &&
        other.user_uid == user_uid &&
        other.rule_uid == rule_uid;
  }

  @override
  int get hashCode => uid.hashCode ^ user_uid.hashCode ^ rule_uid.hashCode;
}
