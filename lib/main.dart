import 'package:end/core/themes.dart';
import 'package:end/screens/auth/login_screen.dart';
import 'package:end/screens/coin/profile_screen.dart';
import 'package:end/screens/widget/control_widget.dart';
import 'package:end/view_model/provider/auth/auth_provider.dart';
import 'package:end/view_model/provider/coin/details_provider.dart';
import 'package:end/view_model/provider/coin/home_provider.dart';
import 'package:end/view_model/provider/coin/profile_provider.dart';
import 'package:end/view_model/provider/coin/search_ptovider.dart';
import 'package:end/view_model/provider/control_provider.dart';
import 'package:end/view_model/provider/theme_proider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HomeProvider()),
    ChangeNotifierProvider(create: (_) => ProfileProvider()),
    ChangeNotifierProvider(create: (_) => SearchProvider()),
    ChangeNotifierProvider(create: (_) => DetailsProvider()),
    ChangeNotifierProvider(create: (_) => ControlProvider()),
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => ProfileProvider()),
    ChangeNotifierProvider(create: (_) => ThemeProvider())




  ],
  child: MyApp()));

}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // dark theme data for crypto currency
      theme: Themes.lightTheme,

      darkTheme: Themes.darkTheme,

      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      home: ControlView(),
    );
  }
}


