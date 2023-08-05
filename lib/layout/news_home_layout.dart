import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/components.dart';

class HomeNews extends StatelessWidget {
  const HomeNews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("News"),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, const SearchScreen());
                  // عشان اهنل حته اني لما اعمل سيرش
                  //و اطلع برا و ارجع تاني ملقيش الداتا بتاعت السيرش القديم
                  cubit.search = [];
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  cubit.changeDarkModeTheme();
                },
                icon: const Icon(Icons.brightness_4_outlined),
              ),
              const SizedBox(
                width: 5.0,
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            currentIndex: cubit.currentPage,
            onTap: (value) {
              cubit.changeCerrentPageIndex(index: value);
            },
          ),
          body: cubit.screens[cubit.currentPage],
        );
      },
    );
  }
}
