import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        List searchList = cubit.search;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_rounded,
                color: cubit.isDark ? Colors.white : Colors.black,
                size: 35.0,
              ),
            ),
            title: const Text("Search"),
          ),
          body: Column(children: [
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIconColor: cubit.isDark ? Colors.white : Colors.black,
                  labelText: "Search here",
                  labelStyle: TextStyle(
                    fontSize: 22.0,
                    color: cubit.isDark ? Colors.white : Colors.black,
                  ),
                  prefixIcon: const Icon(Icons.search_rounded),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.deepOrange),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.deepOrange),
                  ),
                ),
                onChanged: (value) {
                  //عملتها عشان لما امسح اللي انا كتبته
                  //يمسح هوه كان السيرش داتا مش يسبها معروضه
                  if (value == "") {
                    cubit.search = [];
                  }
                  cubit.getSearchData(searchWord: value);
                },
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: ConditionalBuilderRec(
                condition: state is! LoadingSearchState,
                builder: (context) => ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildListItems(
                      searchList[index],
                      searchList[index]['urlToImage'].toString(),
                      context),
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      color: Colors.grey,
                      width: double.infinity,
                      height: 1.0,
                    ),
                  ),
                  itemCount: searchList.length,
                ),
                fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}
