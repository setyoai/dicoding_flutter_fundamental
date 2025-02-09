// todo-03-main-01: create main screen to handle bottom navigation
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/provider/main/index_nav_provider.dart';
import 'package:tourism_app/screen/bookmark/bookmark_screen.dart';
import 'package:tourism_app/screen/home/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // todo-03-main-04: to manage bottom nav bar, create a local variable
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // todo-03-main-07: add body of main screen
      body: Consumer<IndexNavProvider>(
        builder: (context, value, child) {
          return switch (value.indexBottomNavBar){
            1 => const BookmarkScreen(),
            _ => const HomeScreen(),
          };
        },
      ),
      // todo-03-main-02: add bottom nav bar
      bottomNavigationBar: BottomNavigationBar(
        // todo-03-main-05: add parameter current index nav bar
        currentIndex: context.watch<IndexNavProvider>().indexBottomNavBar,
        // todo-03-main-06: add onTap callback to manage a state
        onTap: (index) {
          context.read<IndexNavProvider>().setIndexBottomNavBar = index;
        },
        items: const [
          // todo-03-main-03: add bottom nav bar item
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            tooltip: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmarks),
            label: "Bookmarks",
            tooltip: "Bookmarks",
          ),
        ],
      ),
    );
  }
}
