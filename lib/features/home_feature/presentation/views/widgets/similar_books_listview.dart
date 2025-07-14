import 'package:book_store_app/core/widgets/custom_error_widget.dart';
import 'package:book_store_app/core/widgets/custom_loading_widget.dart';
import 'package:book_store_app/features/home_feature/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_store_app/features/home_feature/presentation/views/book_details_view.dart';
import 'package:book_store_app/features/home_feature/presentation/views/widgets/custom_book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (BuildContext context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: InkWell(
                  onTap: () {
                    GoRouter.of(context).push(
                      BookDetailsView.screenRoute,
                      extra: state.books[index],
                    );
                  },
                  child: CustomBookCard(
                    imageUrl:
                        state
                            .books[index]
                            .volumeInfo
                            ?.imageLinks
                            ?.smallThumbnail ??
                        '',
                  ),
                ),
              ),
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const BookcardLoading();
        }
      },
    );
  }
}
