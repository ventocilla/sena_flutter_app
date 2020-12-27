import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sena_flutter_app/models/user_manager.dart';
import 'package:sena_flutter_app/pages/base.dart';
import 'package:sena_flutter_app/pages/login.dart';
import 'package:sena_flutter_app/pages/signup.dart';

// materialpalette.com

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserManager>(
      lazy: false,
      create: (_) => UserManager(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sena',
        theme: ThemeData(
          primaryColor: const Color(0xFF007292),
          scaffoldBackgroundColor: const Color(0xFF007292),
          appBarTheme: const AppBarTheme(elevation: 0),
        ),
        initialRoute: '/base',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/signup':
              return MaterialPageRoute(builder: (_) => SignupPage());
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginPage());
            case '/base':
            default:
              return MaterialPageRoute(builder: (_) => BasePage());
          }
        },
      ),
    );
  }
}
