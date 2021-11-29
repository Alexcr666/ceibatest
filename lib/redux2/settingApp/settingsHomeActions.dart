
import 'package:PruebaCeiba/redux2/common_actions.dart';
import 'package:PruebaCeiba/redux2/settingApp/settingsHomeState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';

class getUsersActions extends ErrorAction {
  getUsersActions(BuildContext context) : super(context);

}

class getPostUser extends ErrorAction {
  getPostUser(BuildContext context, this.id)
      : super(context);
  final String id;

}


@immutable
class SetPostsStateActionHome {
  final PostsStateHome postsState;

  SetPostsStateActionHome(this.postsState);
}
