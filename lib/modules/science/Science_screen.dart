import 'package:egypt_news/shared/components/compnentes.dart';
import 'package:egypt_news/shared/cubit/cubit.dart';
import 'package:egypt_news/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = NewsCubit.get(context).science;
    return BlocConsumer<NewsCubit, AppStates>(
        builder: (context, state) {
          return articleBuilder(list);
        },
        listener: (context, state) {});
  }
}
