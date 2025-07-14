import 'package:book_store_app/features/home_feature/data/models/book_model/book_model.dart';
import 'package:book_store_app/features/home_feature/presentation/views/widgets/book_details_section.dart';
import 'package:book_store_app/features/home_feature/presentation/views/widgets/book_details_app_bar.dart';
import 'package:book_store_app/features/home_feature/presentation/views/widgets/custom_toggle_button.dart';
import 'package:book_store_app/features/home_feature/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookModel bookModel;

  const BookDetailsViewBody({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const BookDetailsAppBar(),
              const SizedBox(height: 10.0),
              BookDetailsSection(bookModel: bookModel),
              const SizedBox(height: 30.0),
              CustomToggleButton(bookModel: bookModel),
              const Expanded(child: SizedBox(height: 30.0)),
              const SimilarBooksSection(),
            ],
          ),
        ),
      ],
    );
  }
}
