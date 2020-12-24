import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sena_flutter_app/models/user_manager.dart';
import 'package:sena_flutter_app/pages/base_page.dart';

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
      create: (_) => UserManager(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sena',
        theme: ThemeData(
          //primaryColor: const Color.fromARGB(255, 4, 125, 141),
          //scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
          primaryColor: const Color(0xFF007292),
          scaffoldBackgroundColor: const Color(0xFF007292),
          appBarTheme: const AppBarTheme(elevation: 0),
        ),
        home: BasePage(),
      ),
    );
  }
}
