import 'package:book_store_app/features/search_feature/presentation/views/widgets/search_app_bar_section.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchAppBarSection(),
        SizedBox(height: 10.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Search Result',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(height: 5.0),
        // SearchresultListView(),
      ],
    );
  }
}

// class SearchresultListView extends StatelessWidget {
//   const SearchresultListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView.builder(
//         padding: EdgeInsets.zero,
//         itemCount: 6,
//         itemBuilder: (context, index) => const NewestBooksCard(),
//       ),
//     );
//   }
// }
