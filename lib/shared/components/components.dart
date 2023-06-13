import 'package:flutter/material.dart';

import '../../layout/News Layout/News Cubit/news_cubit.dart';

Widget newsItem(Map article, context) => Padding(
  padding: EdgeInsets.all(10),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              '${article['urlToImage']}',
            ),
          ),
        ),
      ),
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${article['title']}',
                style: NewsCubit.get(context).isDark ? TextStyle(
                  color:Colors.white,
                  fontSize: 20,
                ):TextStyle(
                  color:Colors.black,
                  fontSize: 20,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${article['publishedAt']}',
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);
