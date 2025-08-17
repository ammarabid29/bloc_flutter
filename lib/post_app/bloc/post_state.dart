import 'package:bloc_flutter/post_app/model/post_model.dart';
import 'package:bloc_flutter/utils/enums.dart';
import 'package:equatable/equatable.dart';

class PostState extends Equatable {
  final List<PostModel> posts;
  final List<PostModel> filteredPosts;
  final PostStatus status;
  final bool isSearching;
  final String message;

  const PostState({
    this.posts = const [],
    this.filteredPosts = const [],
    this.isSearching = false,
    this.status = PostStatus.loading,
    this.message = '',
  });

  PostState copyWith({
    List<PostModel>? posts,
    List<PostModel>? filteredPosts,
    bool? isSearching,
    PostStatus? status,
    String? message,
  }) {
    return PostState(
      posts: posts ?? this.posts,
      filteredPosts: filteredPosts ?? this.filteredPosts,
      isSearching: isSearching ?? this.isSearching,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
    posts,
    status,
    message,
    filteredPosts,
    isSearching,
  ];
}
