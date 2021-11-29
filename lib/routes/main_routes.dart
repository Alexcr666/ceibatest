import 'package:PruebaCeiba/ui/login/login_screen.dart';
import 'package:PruebaCeiba/ui/main/main_screen.dart';
import 'package:PruebaCeiba/ui/profile/profileScreen.dart';
import 'package:flutter/material.dart';

final mainRoutes = {
  'login': (BuildContext context) => LoginScreen(),
  'main': (BuildContext context) => usersListPage(),
  'profile': (BuildContext context) => usersListProfilePage(),
};
