import 'dart:async';

import 'package:PruebaCeiba/data/models/PostUserModel.dart';
import 'package:PruebaCeiba/data/models/UserModel.dart';
import 'package:PruebaCeiba/data/networking/api.dart';
import 'package:PruebaCeiba/generated/l10n.dart';


import 'package:PruebaCeiba/app/app_constants.dart';
import 'package:PruebaCeiba/redux2/app/app_state.dart';
import 'package:PruebaCeiba/redux2/settingApp/settingsHomeActions.dart';
import 'package:PruebaCeiba/redux2/settingApp/store.dart';
import 'package:PruebaCeiba/redux2/store.dart';

import 'package:PruebaCeiba/styles/colors.dart';
import 'package:PruebaCeiba/styles/style.dart';

import 'package:PruebaCeiba/utils/adapt_screen.dart';
import 'package:PruebaCeiba/widget/card/cardInicio.dart';
import 'package:PruebaCeiba/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:redux/redux.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redux/redux.dart';

//import 'package:sign_in_with_apple/sign_in_with_apple.dart';
//import 'package:google_sign_in/google_sign_in.dart';

import 'dart:convert';
import 'dart:math';

import 'dart:math';
import 'dart:ui';

import '../../styles/colors.dart';
class usersListProfilePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  usersListProfilePage({Key key,this.user}) : super(key: key);

  final UserModel user;
  @override
  _usersListProfileState createState() => _usersListProfileState();
}

var _store;
class _usersListProfileState extends State<usersListProfilePage> {
  final String apiKey = '6ed5914d0446030f513756c4a11ab46d';
  TextStyle moneyStyle;
  TextStyle titleStyle;
  final bool revealWeather = false;

  @override
  Widget build(BuildContext context) {
    AdaptScreen.initAdapt(context);
    moneyStyle = TextStyle(
        color: AppColors.fontColor,
        fontSize: AdaptScreen.screenWidth() * 0.09,
        fontWeight: FontWeight.bold);
    titleStyle = TextStyle(
        color: AppColors.fontColor, fontSize: AdaptScreen.screenWidth() * 0.05);

    return



      Scaffold(
        body: StoreProvider<AppStateHome>(
          //ReduxSignUp.store,
            store: ReduxHome.store,
            child: StoreConnector<AppStateHome, dynamic>(
                distinct: true,
                converter: (store) => store.state.postsState,
                onInit: (store) {
                  _store = store;
                },
                builder: (context, value) {
                  return RefreshIndicator(
                      onRefresh: () {

                      refreshList();
                      },
                      child:Stack(children: <Widget>[
                        Positioned(
                            top: -60.0, right: -35, child: _decorationBox()),
                        Container(
                          padding: EdgeInsets.all(15.0),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 20,right: 20),
                          child: ListView(


                            children: [

                              Container(
                                margin: EdgeInsets.only(left: 20,top: 20,bottom: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.arrow_back, color: Colors.black),
                                      onPressed: () => Navigator.of(context).pop(),
                                    ),
                                    Text(
                                      widget.user.name,
                                      style: AppStyle().styleText(25, Colors.black, true),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.phone,color:  Colors.black54,size: 19),
                                        Text( widget.user.phone.toString(),
                                            style: AppStyle().styleText(14, Colors.black54, false)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.email,color:  Colors.black54,size: 19,),
                                        Text( widget.user.email.toString(),
                                            style: AppStyle().styleText(14, Colors.black54, false)),
                                      ],
                                    ),


                                  ],
                                ),
                              ),
                              Text(
                               "Publicaciones: ",
                                style: AppStyle().styleText(20, Colors.black, true),
                              ),
                              ReduxHome.store.state.postsState.listPost == null ?Text("No resullt", style: AppStyle().styleText(16, Colors.black, false)): ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:  ReduxHome.store.state.postsState.listPost.length,
                                  itemBuilder: (BuildContext ctxt, int index) {
                                    PostModel data =   ReduxHome.store.state.postsState.listPost[index];
                                    return AppCard().widgetCardHomePost(context, data);
                                  }),

                            ],
                          ),
                        ),
                      ]));
                })),

      );
  }



  Widget _decorationBox() {
    return Transform.rotate(
        angle: -pi / 5.0,
        child: Container(
          height: 360.0,
          width: 360.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              gradient: LinearGradient(colors: [
                AppColors.mainColor,
                AppColors.main2Color,
              ])),
        ));
  }
  refreshList(){
    asinc() async {
      Store<AppState> store =
      await createStore(api: API());


      store.dispatch(getPostUser(
        context,widget.user.id.toString()
      ));
    }

    asinc();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshList();
  }
}



class RefreshItemsAction {
  final Completer<Null> completer;

  RefreshItemsAction({Completer completer})
      : this.completer = completer ?? Completer<Null>();
}
