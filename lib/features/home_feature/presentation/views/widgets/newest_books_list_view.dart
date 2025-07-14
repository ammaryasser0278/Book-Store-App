import 'package:book_store_app/core/widgets/custom_error_widget.dart';
import 'package:book_store_app/core/widgets/custom_loading_widget.dart';
import 'package:book_store_app/features/home_feature/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:book_store_app/features/home_feature/presentation/views/widgets/newest_books_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (BuildContext context, state) {
        if (state is NewestBooksFailure) {
          return CustomErrorWidget(errMessage: state.errorMessage);
        } else if (state is NewestBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: NewestBooksCard(bookModel: state.books[index]),
            ),
          );
        } else {
          return const NewesBooksLoading();
        }
      },
    );
  }
}
