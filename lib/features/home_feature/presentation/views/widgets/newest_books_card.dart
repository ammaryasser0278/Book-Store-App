import 'package:book_store_app/core/widgets/custom_rating_text.dart';
import 'package:book_store_app/features/home_feature/data/models/book_model/book_model.dart';
import 'package:book_store_app/features/home_feature/presentation/views/widgets/custom_book_card.dart';
import 'package:book_store_app/features/home_feature/presentation/views/book_details_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewestBooksCard extends StatelessWidget {
  final BookModel bookModel;
  const NewestBooksCard({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50.0),
      onTap: () {
        GoRouter.of(
          context,
        ).push(BookDetailsView.screenRoute, extra: bookModel);
      },
      child: Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: CustomBookCard(
              imageUrl: bookModel.volumeInfo?.imageLinks?.smallThumbnail ?? '',
            ),
          ),
          const SizedBox(width: 25.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Text(
                    bookModel.volumeInfo?.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'PlayfairDisplay',
                    ),
                  ),
                ),
                const SizedBox(height: 3.0),
                Text(
                  bookModel.volumeInfo?.authors?[0] ?? '',
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 3.0),
                const BookRatingAndPrice(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BookRatingAndPrice extends StatelessWidget {
  const BookRatingAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$19.99",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
        ),
        CustomRatingText(),
      ],
    );
  }
}
