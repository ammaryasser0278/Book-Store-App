import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white12,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10,
        ),
        hintText: 'Search books',
        hintStyle: const TextStyle(color: Colors.white),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.search_circle_fill, size: 27.0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
