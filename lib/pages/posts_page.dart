import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_flutter_bloc/bloc/post_bloc.dart';
import 'package:infinite_list_flutter_bloc/widgets/loading_widget.dart';
import 'package:infinite_list_flutter_bloc/widgets/post_list_item.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts"), centerTitle: true),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state.status == PostStatus.loading) {
            return const LoadingWidget();
          } else if (state.status == PostStatus.success) {
            return ListView.builder(
              itemCount: state.posts!.length,
              itemBuilder: (context, index) {
                final post = state.posts![index];
                return PostListItem(post: post!);
              },
            );
          } else {
            return Center(child: Text(state.errorMessage));
          }
        },
      ),
    );
  }
}
