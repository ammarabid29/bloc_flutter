import 'package:bloc_flutter/post_app/bloc/post_bloc.dart';
import 'package:bloc_flutter/post_app/bloc/post_event.dart';
import 'package:bloc_flutter/post_app/bloc/post_state.dart';
import 'package:bloc_flutter/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post View")),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.status) {
            case PostStatus.loading:
              return Center(child: CircularProgressIndicator());
            case PostStatus.success:
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return ListTile(
                    title: Text(post.email),
                    subtitle: Text(post.body),
                  );
                },
              );
            case PostStatus.failure:
              return Center(child: Text(state.message));
          }
        },
      ),
    );
  }
}
