import 'package:bloc_flutter/post_app/bloc/post_event.dart';
import 'package:bloc_flutter/post_app/bloc/post_state.dart';
import 'package:bloc_flutter/post_app/repo/post_repo.dart';
import 'package:bloc_flutter/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepo postRepo = PostRepo();
  PostBloc() : super(const PostState()) {
    on<PostFetched>(_onPostFetched);
  }

  void _onPostFetched(PostFetched event, Emitter<PostState> emit) async {
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
          emit(
            state.copyWith(
              status: PostStatus.failure,
              message: error.toString(),
            ),
          );
        });
  }
}
