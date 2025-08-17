import 'package:bloc_flutter/post_app/bloc/post_event.dart';
import 'package:bloc_flutter/post_app/bloc/post_state.dart';
import 'package:bloc_flutter/post_app/model/post_model.dart';
import 'package:bloc_flutter/post_app/repo/post_repo.dart';
import 'package:bloc_flutter/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepo postRepo = PostRepo();

  PostBloc() : super(const PostState()) {
    on<PostFetchedEvent>(_onPostFetched);
    on<SearchPostEvent>(_onSearchPost);
  }

  List<PostModel> filteredPosts = [];

  void _onPostFetched(PostFetchedEvent event, Emitter<PostState> emit) async {
    await postRepo
        .fetchPosts()
        .then((posts) {
          emit(
            state.copyWith(
              posts: List.from(posts),
              status: PostStatus.success,
              message: 'Posts fetched successfully',
            ),
          );
        })
        .onError((error, stackTrace) {
          print("Error fetching posts: $error");
          emit(
            state.copyWith(
              status: PostStatus.failure,
              message: error.toString(),
            ),
          );
        });
  }

  void _onSearchPost(SearchPostEvent event, Emitter<PostState> emit) {
    final searchKey = event.searchKey.toLowerCase();
    filteredPosts = state.posts
        .where(
          (post) =>
              post.email.toLowerCase().contains(searchKey) ||
              post.body.toLowerCase().contains(searchKey),
        )
        .toList();
    emit(state.copyWith(filteredPosts: filteredPosts, isSearching: true));
  }
}
