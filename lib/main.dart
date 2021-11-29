import 'package:PruebaCeiba/app/app_settings.dart';
import 'package:PruebaCeiba/generated/l10n.dart';
import 'package:PruebaCeiba/redux2/settingApp/store.dart';

import 'package:PruebaCeiba/routes/main_routes.dart';
import 'package:PruebaCeiba/styles/colors.dart';
import 'package:PruebaCeiba/utils/adapt_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_lock/flutter_app_lock.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
 // WidgetsFlutterBinding.ensureInitialized();

  await ReduxHome.init();
  runApp(AppLock(
    builder: (args) => MyApp(),
    lockScreen: MyApp(),
    enabled: false,
  )
    // MyApp2(),

  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdaptScreen.initAdapt(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return StoreProvider(
        store: ReduxHome.store,
        child:


      MaterialApp(
        localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        ],
    supportedLocales: [
    const Locale('en', 'US'), // English, no country code
    const Locale('es', ''),
    const Locale.fromSubtags(languageCode: 'fr'), // Arabic, no country code
    ],
    builder: (context, child) {
    return MediaQuery(
    child: child,
    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
    );
    },

          debugShowCheckedModeBanner: false,
          initialRoute: 'login',
          routes: mainRoutes,
    title: AppSettings.appDisplayName,
    theme: ThemeData(
    fontFamily: "lato",
    primarySwatch: Colors.blue,
    //  visualDensity: VisualDensity.adaptivePlatformDensity,
    ),

   )
   );
  }
}
