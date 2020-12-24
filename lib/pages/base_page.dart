import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
//import 'package:sena_flutter_app/core/theme_utils.dart';
import 'package:sena_flutter_app/models/page_manager.dart';
import 'package:sena_flutter_app/shared/custom_drawer/custom_drawer.dart';

import 'login_page.dart';

// BasePage == MainPage
class BasePage extends StatefulWidget {
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    //ThemeUtils.init(context);
    return Provider<PageManager>(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          LoginPage(),
          /*
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(title: Text('Home'),),
            // body: Container(
            //   color: Colors.amber,
            //   width: ScreenUtil.screenHeightDp,
            //   height: ScreenUtil.screenHeightDp,
            // ),
            ),
          */
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(title: Text('Demandas')),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(title: Text('Minhas Demandas')),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(title: Text('Prioridade')),
          ),
          //Container(color: Colors.red),
          //Container(color: Colors.yellow),
          //Container(color: Colors.green),
        ],
      ),
    );
  }
}

