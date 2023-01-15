part of 'post_bloc.dart';

enum PostStatus { loading, success, error }

class PostState extends Equatable {
  final PostStatus status;
  final List<PostModel?>? posts;
  final bool hasReachedMax;
  final String errorMessage;

  const PostState({
    this.status = PostStatus.loading,
    this.posts = const [],
    this.hasReachedMax = false,
    this.errorMessage = "",
  });

  PostState copyWith({
    PostStatus? status,
    List<PostModel?>? posts,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, posts!, hasReachedMax, errorMessage];
}
