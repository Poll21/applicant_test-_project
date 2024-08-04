import 'package:applicant_test_project/features/posts/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_full.g.dart';

@JsonSerializable()
class PostFull {
  final Post post;
  final User user;
  final List<Comment> comments;

  PostFull({required this.post, required this.comments, required this.user,});

  factory PostFull.fromJson(Map<String, dynamic> json) =>
      _$PostFullFromJson(json);

  Map<String, dynamic> toJson() => _$PostFullToJson(this);
}

final UserInit = User(id: 0,
    name: 'Not',
    username: 'Not',
    email: 'Not',
    address: Address(street: '',
      suite: '',
      city: '',
      zipcode: '',
      geo: Geo(lat: '', lng: ''),),
    phone: 'Not',
    website: 'Not',
    company: Company(name: '', catchPhrase: '', bs: ''));