import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/layout/news_home_layout.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/shared/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // ignore: prefer_const_constructors
              appBarTheme: AppBarTheme(
                elevation: 0.0,
                backgroundColor: Colors.white,
                // ignore: prefer_const_constructors
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                actionsIconTheme: const IconThemeData(
                  color: Colors.black,
                  size: 26.0,
                ),
              ),
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                elevation: 0.0,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
              ),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                bodyMedium: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              // ignore: prefer_const_constructors
              appBarTheme: AppBarTheme(
                elevation: 0.0,
                backgroundColor: HexColor("333739"),
                // ignore: prefer_const_constructors
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor("333739"),
                  statusBarIconBrightness: Brightness.light,
                ),
                actionsIconTheme: const IconThemeData(
                  color: Colors.white,
                  size: 26.0,
                ),
              ),
              scaffoldBackgroundColor: HexColor("333739"),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: HexColor("333739"),
                elevation: 0.0,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
              ),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
                bodyMedium: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: const HomeNews(),
          );
        },
      ),
    );
  }
}
