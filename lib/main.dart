import 'package:egypt_news/shared/bloc_observer.dart';
import 'package:egypt_news/shared/cubit/cubit.dart';
import 'package:egypt_news/shared/cubit/states.dart';
import 'package:egypt_news/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'layout/news_layout.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelperr.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, AppStates>(
          builder: (context, states) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              themeMode: NewsCubit.get(context).isdark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              darkTheme: ThemeData(
                textTheme: TextTheme(
                    bodyText1: TextStyle(color: Colors.white, fontSize: 20)),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: HexColor('333739'),
                    type: BottomNavigationBarType.fixed,
                    unselectedLabelStyle: TextStyle(color: Colors.grey),
                    unselectedItemColor: Colors.grey,
                    selectedItemColor: Colors.deepOrange),
                scaffoldBackgroundColor: HexColor('333739'),
                appBarTheme: AppBarTheme(
                    iconTheme: IconThemeData(color: Colors.white, size: 15),
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: HexColor('333739'),
                        statusBarIconBrightness: Brightness.light),
                    backgroundColor: HexColor('333739'),
                    elevation: 0.0),
                primarySwatch: Colors.blue,
              ),
              theme: ThemeData(
                textTheme: TextTheme(
                    bodyText1: TextStyle(color: Colors.black, fontSize: 18)),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    unselectedLabelStyle: TextStyle(color: Colors.grey),
                    unselectedItemColor: Colors.grey,
                    selectedItemColor: Colors.deepOrange),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                    iconTheme: IconThemeData(color: Colors.black, size: 15),
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark),
                    backgroundColor: Colors.white,
                    elevation: 0.0),
                primarySwatch: Colors.blue,
              ),
              home: Directionality(
                  textDirection: TextDirection.ltr, child: NewsApp()),
            );
          },
          listener: (context, states) {}),
    );
  }
}
