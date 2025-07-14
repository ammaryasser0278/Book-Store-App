import 'package:book_store_app/features/home_feature/presentation/views/widgets/newest_books_list_view.dart';
import 'package:book_store_app/features/home_feature/presentation/views/widgets/book_list_view.dart';
import 'package:book_store_app/features/home_feature/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),
                  child: CustomAppBar(),
                ),
                SizedBox(height: 15.0),
                BookListView(),
                SizedBox(height: 30.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Newest Books',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: NewestBooksListView(),
            ),
          ),
        ],
      ),
    );
  }
}
