import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_flutter_bloc/api/post_api.dart';
import 'package:infinite_list_flutter_bloc/models/post_model.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState()) {
    on<PostEvent>((event, emit) async {
      if (event is GetPostsEvent) {
        if (state.hasReachedMax) return;
        try {
          if (state.status == PostStatus.loading) {
            final posts = await PostApi.getPosts();
            return posts!.isEmpty
                ? emit(
                    state.copyWith(
                        status: PostStatus.success, hasReachedMax: true),
                  )
                : emit(
                    state.copyWith(
                        status: PostStatus.success,
                        posts: posts,
                        hasReachedMax: false),
                  );
          } else {
            final posts = await PostApi.getPosts(state.posts!.length);
            posts!.isEmpty
                ? emit(state.copyWith(hasReachedMax: true))
                : emit(
                    state.copyWith(
                      status: PostStatus.success,
                      posts: List.of(state.posts!)..addAll(posts),
                      hasReachedMax: false,
                    ),
                  );
          }
        } catch (e) {
          emit(state.copyWith(
              status: PostStatus.error, errorMessage: "Failed to Fetch Posts"));
        }
      }
    });
  }
}
