import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../../shared/components.dart';

class ScienceNews extends StatelessWidget {
  const ScienceNews({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubic = AppCubit.get(context);
    cubic.getScience();
    late List news = cubic.science;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilderRec(
          condition: state is! LoadingScienceState && news.isNotEmpty,
          builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildListItems(
                news[index], news[index]['urlToImage'].toString(), context),
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                color: Colors.grey,
                width: double.infinity,
                height: 1.0,
              ),
            ),
            itemCount: news.length,
          ),
          fallback: (context) => const Center(
              child: CircularProgressIndicator(
            color: Colors.deepOrange,
          )),
        );
      },
    );
  }
}
