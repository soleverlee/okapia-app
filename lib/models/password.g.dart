// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Password _$PasswordFromJson(Map<String, dynamic> json) {
  return Password(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String);
}

Map<String, dynamic> _$PasswordToJson(Password instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content
    };
