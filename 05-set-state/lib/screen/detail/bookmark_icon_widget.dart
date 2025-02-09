// todo-04-logic-02: set this widget into stateful widget
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/model/tourism.dart';
import 'package:tourism_app/provider/detail/bookmark_icon_provider.dart';
import 'package:tourism_app/provider/detail/bookmark_list_provider.dart';

class BookmarkIconWidget extends StatefulWidget {
  final Tourism tourism;

  const BookmarkIconWidget({
    super.key,
    required this.tourism,
  });

  @override
  State<BookmarkIconWidget> createState() => _BookmarkIconWidgetState();
}

class _BookmarkIconWidgetState extends State<BookmarkIconWidget> {
  // todo-04-logic-03: create local variable called _isBookmarked
  
  // todo-04-logic-04: set a local variable from bookmark list value
  @override
  void initState() {
    final bookmarkListProvider = context.read<BookmarkListProvider>();
    final bookmarkIconWidget = context.read<BookmarkIconProvider>();

    Future.microtask(() {
      final tourismInList =
          bookmarkListProvider.checkItemBookmark(widget.tourism);
      bookmarkIconWidget.isBookmarked = tourismInList;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      // todo-04-logic-05: add a logic to add a bookmark
      // when is already exist in bookmark, remove it
      onPressed: () {
        final bookmarkListProvider = context.read<BookmarkListProvider>();
        final bookmarkIconProvider = context.read<BookmarkIconProvider>();
        final isBookmarked = bookmarkIconProvider.isBookmarked;

        if (!isBookmarked) {
          bookmarkListProvider.addBookmark(widget.tourism);
        } else {
          bookmarkListProvider.removeBookmark(widget.tourism);
        }
        bookmarkIconProvider.isBookmarked = !isBookmarked;
      },
      // todo-04-logic-06: show the bookmark icon based on _isBookmarked
      icon: Icon(
        context.watch<BookmarkIconProvider>().isBookmarked
         ? Icons.bookmark 
         : Icons.bookmark_outline,
      ),
    );
  }
}
