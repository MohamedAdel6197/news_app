import 'package:flutter/material.dart';

Widget buildListItems(oneNews, String imageUrl, context) {
  String x = imageUrl.toString() == "null"
      ? "https://upload.wikimedia.org/wikipedia/commons/3/36/NULL.jpg"
      : oneNews['urlToImage'];
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: 120.0,
          height: 120.0,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(image: NetworkImage(x), fit: BoxFit.cover),
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
                "${oneNews['title']}",
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              )),
              Text(
                "${oneNews['publishedAt']}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        width: 15.0,
      )
    ],
  );
}
