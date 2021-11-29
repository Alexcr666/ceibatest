import 'package:PruebaCeiba/data/models/PostUserModel.dart';
import 'package:PruebaCeiba/data/models/UserModel.dart';
import 'package:PruebaCeiba/styles/colors.dart';
import 'package:PruebaCeiba/styles/style.dart';
import 'package:PruebaCeiba/ui/profile/profileScreen.dart';
import 'package:PruebaCeiba/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppCard {
  Widget widgetCardHomePost(BuildContext context, PostModel data) {
    return Card(
      elevation: 2,
      child:  Container(
        margin: EdgeInsets.only(left: 20,top: 20,bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              data.title,
              style: AppStyle().styleText(18, Colors.black, true),
            ),

                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Text(data.body.toString(),
                      style: AppStyle().styleText(14, Colors.grey, false)),
                ),



          ],
        ),
      ),
    );
  }
  Widget widgetCardHome(BuildContext context, UserModel data) {
    return Card(
      elevation: 2,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(left: 15),
          child: Stack(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: AppWidget().widgetImage(
                      "https://www.pikpng.com/pngl/b/75-756814_login-user-imagen-user-png-clipart.png",
                      80,
                      80,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20,top: 20,bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          data.name,
                          style: AppStyle().styleText(20,  AppColors.main2Color, true),
                        ),
                        Row(
                          children: [
                            Icon(Icons.phone,color: AppColors.main2Color,size: 19),
                            Text(data.phone.toString(),
                                style: AppStyle().styleText(14, Colors.black, false)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.email,color: AppColors.main2Color,size: 19,),
                            Text(data.email.toString(),
                                style: AppStyle().styleText(14, Colors.black, false)),
                          ],
                        ),


                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => usersListProfilePage(user: data,),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 40,top: 20,bottom: 15),
                            child: Row(
                              children: [

                              //  Icon(Icons.email,color: AppColors.main2Color,size: 19,),
                                Text("VER PUBLICACIONES",
                                    style: AppStyle().styleText(16,  AppColors.main2Color, true)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
