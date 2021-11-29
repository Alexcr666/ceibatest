import 'dart:async';

import 'package:PruebaCeiba/app/app_settings.dart';
import 'package:PruebaCeiba/data/models/PostUserModel.dart';
import 'package:PruebaCeiba/data/models/UserModel.dart';
import 'package:PruebaCeiba/data/networking/api.dart';
import 'package:PruebaCeiba/redux2/app/app_state.dart';
import 'package:PruebaCeiba/redux2/settingApp/settingsHomeState.dart';
import 'package:PruebaCeiba/redux2/settingApp/store.dart';
import 'package:PruebaCeiba/utils/alert.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';


import 'settingsHomeActions.dart';

class settingHomeMiddleware extends MiddlewareClass<AppState> {
  settingHomeMiddleware(this.api);

  final API api;

  @override
  Future<void> call(
      Store<AppState> store, dynamic action, NextDispatcher next) {
    next(action);
    if (action is getUsersActions) {
      return _getUsers(next, action, store); //_loginUser(next, action, store);
    } else {
      if (action is getPostUser) {
        return _getPostUsers(next, action, store);
      }
    }
  }

  Future<void> _getUsers(
      NextDispatcher next, getUsersActions action, Store<AppState> store) async {
    print("prueba67");

    // try {
    var response = await API().getUser(
    );


    switch (response.statusCode) {
      case AppSettings.statusCodeSuccess:
        print("prueba1: "+response.data.toString());

        List<UserModel> data = userModelFromJson(response.data.toString());

        print("prueba2: "+data.length.toString());
        ReduxHome.store.dispatch(
          SetPostsStateActionHome( PostsStateHome(
              listScan: data
          )),
        );

        print("prueba3: "+  ReduxHome.store.state.postsState.listScan.length.toString());

        // print("prueba101" + data.bienvenida.length.toString());

        break;
      case AppSettings.statusCodeError:

        AlertWidget().message(action.context, response.message);

        // alertConfirmNumber2(action.context);
        // alertForgortPassword3(action.context);

        break;
      default:
        AlertWidget().message(action.context, response.message);
    }
    /*} catch (e) {

      AlertWidget().message(action.context, e.toString());
    }*/
  }

  Future<void> _getPostUsers(
      NextDispatcher next, getPostUser action, Store<AppState> store) async {
    print("prueba67");

    try {
      var response = await API().getPostsUser(action.id);

      switch (response.statusCode) {
        case AppSettings.statusCodeSuccess:

          List<PostModel> data = postModelFromJson(response.data);
          ReduxHome.store.dispatch(
            SetPostsStateActionHome( PostsStateHome(
                listPost: data
            )),
          );

          break;
        case AppSettings.statusCodeError:

          AlertWidget().message(action.context, response.message);

          break;
        default:
          AlertWidget().message(action.context, response.message);
      }
    } catch (e) {

      AlertWidget().message(action.context, e.toString());
    }
  }
}
