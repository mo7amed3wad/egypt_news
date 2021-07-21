import 'package:egypt_news/shared/cubit/cubit.dart';
import 'package:egypt_news/shared/cubit/states.dart';
import 'package:egypt_news/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()
        ..getbusinessdata()
        ..getsports()
        ..getscience(),
      child: BlocConsumer<NewsCubit, AppStates>(
          builder: (context, state) {
            NewsCubit cubit = NewsCubit.get(context);
            return Scaffold(
              body: cubit.screens[cubit.currentindex],
              bottomNavigationBar: BottomNavigationBar(
                iconSize: 35,
                selectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.deepOrange),
                currentIndex: cubit.currentindex,
                onTap: (index) {
                  NewsCubit.get(context).changindex(index);
                },
                items: cubit.bottomNavigationItem,
              ),
              appBar: AppBar(
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  IconButton(
                      onPressed: () {
                        NewsCubit.get(context).changetodarkmode();
                      },
                      icon: Icon(Icons.brightness_4_outlined))
                ],
                title: Text("News App"),
              ),
            );
          },
          listener: (context, state) {}),
    );
  }
}
