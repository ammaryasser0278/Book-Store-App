import 'package:book_store_app/core/widgets/custom_rating_text.dart';
import 'package:book_store_app/features/home_feature/data/models/book_model/book_model.dart';
import 'package:book_store_app/features/home_feature/presentation/views/widgets/custom_book_card.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  final BookModel bookModel;
  const BookDetailsSection({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.31,
            child: CustomBookCard(
              imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ?? '',
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            bookModel.volumeInfo?.title ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'PlayfairDisplay',
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6.0),
          Text(
            bookModel.volumeInfo?.authors?[0] ?? '',
            textAlign: TextAlign.center,

            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 236, 228, 228),
            ),
          ),
          const SizedBox(height: 6.0),
          const CustomRatingText(mainAxisAlignment: MainAxisAlignment.center),
        ],
      ),
    );
  }
}
