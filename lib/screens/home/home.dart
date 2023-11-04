import 'package:ctj/screens/home/bottomnav/bottomhome.dart';
import 'package:ctj/screens/home/bottomnav/bottommsg.dart';
import 'package:ctj/screens/home/bottomnav/bottomnot.dart';
import 'package:ctj/screens/home/bottomnav/bottompost.dart';
import 'package:ctj/screens/home/bottomnav/bottomsearch.dart';
import 'package:ctj/screens/home/useredit1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: _pages,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 2.0,
          backgroundColor: Colors.red,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
          currentIndex: _currentIndex,
          onTap: (index) {
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          items: [
            BottomNavigationBarItem(
              icon: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: _currentIndex == 0
                    ? Icon(Icons.home, key: ValueKey<int>(0))
                    : Icon(Icons.home_outlined, key: ValueKey<int>(1)),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: _currentIndex == 1
                    ? Icon(Icons.search, key: ValueKey<int>(2))
                    : Icon(Icons.search_outlined, key: ValueKey<int>(3)),
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: _currentIndex == 2
                    ? Icon(Icons.add_box, key: ValueKey<int>(4))
                    : Icon(Icons.add_box_outlined, key: ValueKey<int>(5)),
              ),
              label: 'Post',
            ),
            BottomNavigationBarItem(
              icon: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: _currentIndex == 3
                    ? Icon(Icons.send, key: ValueKey<int>(6))
                    : Icon(Icons.send_outlined, key: ValueKey<int>(7)),
              ),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: _currentIndex == 4
                    ? Icon(Icons.notifications_active, key: ValueKey<int>(8))
                    : Icon(Icons.notifications_none, key: ValueKey<int>(9)),
              ),
              label: 'Notifications',
            ),
          ],
        ),
      ),
    );
  }

  final List<Widget> _pages = [
    Home(),
    Search(),
    Post(),
    BottomMsg(),
    BottomNotify()
  ];
}

class PlaceholderPage extends StatelessWidget {
  final String title;

  PlaceholderPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
