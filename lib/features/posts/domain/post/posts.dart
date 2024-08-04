import 'package:applicant_test_project/features/posts/domain/post/post.dart';
import 'package:json_annotation/json_annotation.dart';


part 'posts.g.dart';
@JsonSerializable()
class Posts{
  final List<Post> posts;

  const Posts({required this.posts});

  factory Posts.fromJson(Map<String, dynamic> json) => _$PostsFromJson(json);
  Map<String, dynamic> toJson() => _$PostsToJson(this);

}