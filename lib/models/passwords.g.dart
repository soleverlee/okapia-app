// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passwords.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Passwords _$PasswordsFromJson(Map<String, dynamic> json) {
  return Passwords(
      count: json['count'] as int,
      list: (json['list'] as List)
          ?.map((e) =>
              e == null ? null : Password.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      isLoaded: json['isLoaded'] as bool);
}

Map<String, dynamic> _$PasswordsToJson(Passwords instance) => <String, dynamic>{
      'count': instance.count,
      'list': instance.list,
      'isLoaded': instance.isLoaded
    };
