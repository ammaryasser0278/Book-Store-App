import 'package:book_store_app/features/search_feature/presentation/views/search_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/images/Logo.png', height: 18.0),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(SearchView.screenRoute);
          },
          icon: const Icon(
            CupertinoIcons.search_circle_fill,
            color: Colors.white,
            size: 30.0,
          ),
        ),
      ],
    );
  }
}
