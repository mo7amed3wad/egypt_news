import 'package:flutter/material.dart';

Widget buildarticleItem(article, context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('${article['urlToImage']}')),
              color: Colors.red,
              borderRadius: BorderRadius.circular(20)),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${article['title']}',
                style: Theme.of(context).textTheme.bodyText1,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 10,
              ),
              Text('${article['publishedAt']}',
                  style: TextStyle(color: Colors.grey))
            ],
          ),
        )
      ],
    ),
  );
}

Widget articleBuilder(List list) {
  return list.length > 0
      ? ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildarticleItem(list[index], context),
          separatorBuilder: (context, int) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
            );
          },
          itemCount: list.length)
      : Center(
          child: CircularProgressIndicator(),
        );
}
