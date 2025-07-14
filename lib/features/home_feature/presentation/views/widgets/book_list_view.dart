import 'package:book_store_app/core/widgets/custom_error_widget.dart';
import 'package:book_store_app/core/widgets/custom_loading_widget.dart';
import 'package:book_store_app/features/home_feature/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_store_app/features/home_feature/presentation/views/book_details_view.dart';
import 'package:book_store_app/features/home_feature/presentation/views/widgets/custom_book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookListView extends StatelessWidget {
  const BookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (BuildContext context, state) {
        if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errorMessage);
        } else if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: InkWell(
                  onTap: () {
                    GoRouter.of(context).push(
                      BookDetailsView.screenRoute,
                      extra: state.books[index],
                    );
                  },
                  child: CustomBookCard(
                    imageUrl:
                        state.books[index].volumeInfo?.imageLinks?.thumbnail ??
                        '',
                  ),
                ),
              ),
              itemCount: state.books.length,
            ),
          );
        } else {
          return const BookcardLoading();
        }
      },
    );
  }
}
