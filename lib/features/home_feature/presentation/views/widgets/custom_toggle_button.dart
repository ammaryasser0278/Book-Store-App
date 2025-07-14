import 'package:book_store_app/features/home_feature/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomToggleButton extends StatefulWidget {
  final BookModel bookModel;
  const CustomToggleButton({super.key, required this.bookModel});

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  bool _free = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double hight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.1),
      height: hight * 0.073,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildToggleSelection(text: '\$19.99', selected: !_free),
          ),
          Expanded(
            child: _buildToggleSelection(text: 'Free Preview', selected: _free),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleSelection({required String text, required bool selected}) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          _free = text == 'Free Preview';
        });
        if (text == 'Free Preview') {
          final Uri url = Uri.parse(widget.bookModel.volumeInfo!.previewLink!);
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          } else {
            throw 'Could not launch $url';
          }
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: selected ? Colors.orange : Colors.transparent,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
              color: selected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
