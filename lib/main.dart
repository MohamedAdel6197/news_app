// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/layout/news_home_layout.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/shared/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? savedBool = CacheHelper.getBool(key: "isDark");
  runApp(NewsApp(
    isDarkSaved: savedBool,
  ));
}

// ignore: must_be_immutable
class NewsApp extends StatelessWidget {
  bool? isDarkSaved;
  NewsApp({
    Key? key,
    required this.isDarkSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AppCubit()..changeDarkModeTheme(savedBool: isDarkSaved),
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
                  fontWeight: FontWeight.w700,
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

              // textTheme: const TextTheme(
              //   bodyLarge: TextStyle(
              //     fontSize: 20.0,
              //     color: Colors.black,
              //     fontWeight: FontWeight.w500,
              //   ),
              //   bodyMedium: TextStyle(
              //     fontSize: 16.0,
              //     color: Colors.black,
              //   ),
              // ),
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
              // ignore: prefer_const_constructors
              // textTheme: TextTheme(
              //   bodyLarge: const TextStyle(
              //     color: Colors.white,
              //     fontSize: 20.0,
              //     fontWeight: FontWeight.w500,
              //   ),
              //   bodyMedium: const TextStyle(
              //     fontSize: 16.0,
              //     color: Colors.white,
              //   ),
              // ),
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
