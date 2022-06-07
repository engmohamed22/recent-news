import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recentnews/layout/news_app/cubit/cubit.dart';
import 'package:recentnews/layout/news_app/cubit/states.dart';
import 'package:recentnews/shared/cubit/cubit.dart';

import '../../modules/news_app/search/search_screen.dart';
import '../../shared/components/components.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.search_rounded,
                  ),
                  onPressed: () {
                    navigateTo(
                      context,
                      SearchScreen(),
                    );
                  }),
              IconButton(
                  icon: Icon(
                    Icons.brightness_4_outlined,
                  ),
                  onPressed: () {
                    AppCubit.get(context).changeAppMode(fromShared: true);
                  }),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: cubit.bottomItems,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
