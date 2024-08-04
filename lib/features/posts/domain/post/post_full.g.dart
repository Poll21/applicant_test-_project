// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_full.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostFull _$PostFullFromJson(Map<String, dynamic> json) => PostFull(
      post: Post.fromJson(json['post'] as Map<String, dynamic>),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostFullToJson(PostFull instance) => <String, dynamic>{
      'post': instance.post,
      'user': instance.user,
      'comments': instance.comments,
    };
