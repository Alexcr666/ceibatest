import 'package:PruebaCeiba/redux2/settingApp/settingsHomeActions.dart';
import 'package:PruebaCeiba/redux2/settingApp/settingsHomeState.dart';


postsReducerHome(PostsStateHome prevState, SetPostsStateActionHome action) {
  final payload = action.postsState;
  return prevState.copyWith(
    isError: payload.isError,
    isLoading: payload.isLoading,
    listScan: payload.listScan,
    listPost: payload.listPost,


    // posts: payload.posts,
  );
}
