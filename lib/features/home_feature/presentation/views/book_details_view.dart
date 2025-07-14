import 'package:book_store_app/features/home_feature/data/models/book_model/book_model.dart';
import 'package:book_store_app/features/home_feature/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_store_app/features/home_feature/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  static const String screenRoute = '/bookDetails';
  final BookModel bookModel;

  const BookDetailsView({super.key, required this.bookModel});

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
      category: widget.bookModel.volumeInfo?.categories?[0] ?? '',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BookDetailsViewBody(bookModel: widget.bookModel)),
    );
  }
}
