import 'package:book_store_app/features/search_feature/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchAppBarSection extends StatelessWidget {
  const SearchAppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(50.0),
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
          const SizedBox(width: 10.0),
          const Expanded(
            child: SizedBox(height: 45.0, child: CustomTextField()),
          ),
          const SizedBox(width: 10.0),
          Image.asset('assets/images/Logo.png', height: 12.0),
        ],
      ),
    );
  }
}
