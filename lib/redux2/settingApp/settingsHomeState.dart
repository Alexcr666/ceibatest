import 'package:PruebaCeiba/data/models/PostUserModel.dart';
import 'package:PruebaCeiba/data/models/UserModel.dart';
import 'package:meta/meta.dart';


@immutable
class PostsStateHome {
  final bool isError;
  final bool isLoading;
  final List<UserModel> listScan;
  final List<PostModel> listPost;

  // final List<modelFavorites> posts;

  PostsStateHome({

    this.isError,

    this.isLoading,

    this.listScan,
    this.listPost,

    //this.posts,
  });

  factory PostsStateHome.initial() => PostsStateHome(
        isLoading: false,
        isError: false,

        listScan: [],
    listPost: [],

      );

  PostsStateHome copyWith({
    @required bool isError,
    @required List<UserModel> listScan,
    @required bool isLoading,
    @required List<PostModel> listPost,

  }) {
    return PostsStateHome(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,

      listScan: listScan ?? this.listScan,
      listPost: listPost ?? this.listPost,

    );
  }
}
