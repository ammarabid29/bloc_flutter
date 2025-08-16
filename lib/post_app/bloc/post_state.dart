import 'package:bloc_flutter/post_app/model/post_model.dart';
import 'package:bloc_flutter/utils/enums.dart';
import 'package:equatable/equatable.dart';

class PostState extends Equatable {
  final List<PostModel> posts;
  final PostStatus status;
  final String message;

  const PostState({
    this.posts = const [],
    this.status = PostStatus.loading,
    this.message = '',
  });

  PostState copyWith({
    List<PostModel>? posts,
    PostStatus? status,
    String? message,
  }) {
    return PostState(
      posts: posts ?? this.posts,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [posts, status, message];
}
