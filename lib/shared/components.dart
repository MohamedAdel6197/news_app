// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/web_view_news/show_web_view.dart';

Widget buildListItems(newsList, String imageUrl, context) {
  String x = imageUrl.toString() == "null"
      ? "https://upload.wikimedia.org/wikipedia/commons/3/36/NULL.jpg"
      : newsList['urlToImage'];
  return BlocConsumer<AppCubit, AppStates>(
    listener: (context, state) {},
    builder: (context, state) {
      AppCubit cubit = AppCubit.get(context);
      return InkWell(
        onTap: () {
          navigateTo(
            context,
            ShowWebViewItemNews(url: newsList['url']),
          );
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 120.0,
                height: 120.0,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      image: NetworkImage(x), fit: BoxFit.cover),
                ),
              ),
            ),
            Expanded(
              // ignore: sized_box_for_whitespace
              child: Container(
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                      "${newsList['title']}",
                      style: TextStyle(
                        color: cubit.isDark ? Colors.white : Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    )),
                    Text(
                      "${newsList['publishedAt']}",
                      style: TextStyle(
                        color: cubit.isDark ? Colors.white : Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 15.0,
            )
          ],
        ),
      );
    },
  );
}

// ignore: avoid_types_as_parameter_names
Future navigateTo(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );
