import 'dart:math';

import 'package:PruebaCeiba/generated/l10n.dart';


import 'package:PruebaCeiba/routes/assets_routes.dart';
import 'package:PruebaCeiba/styles/colors.dart';
import 'package:PruebaCeiba/utils/adapt_screen.dart';
import 'package:PruebaCeiba/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  Utils utils = Utils();
  bool changePage = true;
  String email;
  String password;
  Widget _decorationBox() {
    return Transform.rotate(
        angle: -pi / 5.0,
        child: Container(
          height: 360.0,
          width: 370.0,
          child: Container(
            child: Transform.rotate(
              angle: 26,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Center(
                      child: Image(
                        image: AssetImage(AssetsRoutes.loginIcon),
                        height: 200.0,

                      ),
                    ),
                  ),
              ],),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              gradient: LinearGradient(colors: [
               Colors.white,
                Colors.white,
              ])),
        ));
  }
  @override
  Widget build(BuildContext context) {
    return


      Container(

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(colors: [
              AppColors.main2Color,
              AppColors.mainColor,
            ])),

        child: Stack(children: <Widget>[
          Positioned(
              top: -60.0, right: -35, child: _decorationBox()),
          Container(
            padding: EdgeInsets.all(15.0),
          ),

          ListView(),
          Positioned(
              top: AdaptScreen.screenHeight() * 0.48,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 150,),


                    _submitButtom(context)
                  ],
                ),
              )),
        ]),
      );



  }




  Widget _submitButtom(BuildContext context) {
    return RaisedButton(

        elevation: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 120, vertical: 30.0),
          child:  Text(AppLocalizations.of(context).run,
                  style: TextStyle(color: AppColors.mainColor, fontSize: 20.0)),
        ),
        color:Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, 'main');
        });
  }
}
