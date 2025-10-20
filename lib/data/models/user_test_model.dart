import 'package:json_annotation/json_annotation.dart';

part 'user_test_model.g.dart';

@JsonSerializable()
class UserTestModel {
  final String id;
  @JsonKey(name: 'userName')
  final String name;
  @JsonKey(name: 'userEmail')
  final String email;
  @JsonKey(name: 'userPhone')
  final String phone;

  UserTestModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory UserTestModel.fromJson(Map<String, dynamic> json) {
    return _$UserTestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserTestModelToJson(this);
  }
}
