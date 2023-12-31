import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/components.dart';

class BusinessNews extends StatelessWidget {
  const BusinessNews({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubic = AppCubit.get(context);
    cubic.getBusiness();
    late List news = cubic.business;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilderRec(
          condition: state is! LoadingBusinessState,
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
