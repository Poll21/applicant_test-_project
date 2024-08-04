import 'package:json_annotation/json_annotation.dart';
import '../domain.dart';

part 'users.g.dart';

@JsonSerializable()
class Users {
  final List<User> users;

  Users({required this.users});

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}