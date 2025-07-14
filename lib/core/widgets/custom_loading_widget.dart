import 'package:flutter/material.dart';
import 'package:redacted/redacted.dart';

class RedactedBookCard extends StatelessWidget {
  const RedactedBookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 90, 90, 93),
        borderRadius: BorderRadius.circular(13),
      ),
      child: AspectRatio(
        aspectRatio: 2.05 / 3,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(13.0),
        ).redacted(context: context, redact: true),
      ),
    );
  }
}

class BookcardLoading extends StatelessWidget {
  const BookcardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => const RedactedBookCard(),
      ),
    );
  }
}

//-----------------------------------------------------

class RedactedNewestBooksCard extends StatelessWidget {
  const RedactedNewestBooksCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 105,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 90, 90, 93),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Loading title Loading title',
                ).redacted(context: context, redact: true),
                const SizedBox(height: 6),
                const Text(
                  'Subtitle / Author',
                ).redacted(context: context, redact: true),
                const SizedBox(height: 3.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '\$0.00',
                    ).redacted(context: context, redact: true),
                    const Text(
                      '0.0 ★',
                    ).redacted(context: context, redact: true),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewesBooksLoading extends StatelessWidget {
  const NewesBooksLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (_, __) => const RedactedNewestBooksCard(),
    );
  }
}
