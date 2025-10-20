// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTestModel _$UserTestModelFromJson(Map<String, dynamic> json) =>
    UserTestModel(
      id: json['id'] as String,
      name: json['userName'] as String,
      email: json['userEmail'] as String,
      phone: json['userPhone'] as String,
    );

Map<String, dynamic> _$UserTestModelToJson(UserTestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.name,
      'userEmail': instance.email,
      'userPhone': instance.phone,
    };
