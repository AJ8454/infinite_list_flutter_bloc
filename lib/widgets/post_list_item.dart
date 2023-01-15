import 'package:flutter/material.dart';
import 'package:infinite_list_flutter_bloc/models/post_model.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Text(post.id.toString()),
        title: Text(post.title!),
        isThreeLine: true,
        subtitle: Text(post.body!),
      ),
    );
  }
}
