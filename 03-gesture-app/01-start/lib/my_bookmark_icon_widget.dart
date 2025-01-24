import 'package:flutter/material.dart';

class MyBookmarkIconWidget extends StatefulWidget {
  const MyBookmarkIconWidget({super.key});

  @override
  State<MyBookmarkIconWidget> createState() => _MyBookmarkIconWidgetState();
}

class _MyBookmarkIconWidgetState extends State<MyBookmarkIconWidget> {
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
        setState(() {
          _isBookmarked = !_isBookmarked;
        });
       },
      child: Icon(
        _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
        color: _isBookmarked ? Colors.amber : Colors.grey,
        size: 60,
      ),
    );
  }
}
