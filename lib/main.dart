import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_flutter_bloc/bloc/post_bloc.dart';
import 'package:infinite_list_flutter_bloc/helpers/my_bloc_observer.dart';
import 'package:infinite_list_flutter_bloc/pages/posts_page.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc()..add(GetPostsEvent()),
      child: const MaterialApp(
        home: PostsPage(),
      ),
    );
  }
}
