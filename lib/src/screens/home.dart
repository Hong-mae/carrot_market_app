import 'package:carrot_market_app/src/screens/feed/index.dart';
import 'package:carrot_market_app/src/screens/my/my_page.dart';
import 'package:flutter/material.dart';

final List<BottomNavigationBarItem> tabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    label: '홈',
    activeIcon: Icon(Icons.home),
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.map_outlined),
    label: '동네',
    activeIcon: Icon(Icons.map),
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.question_answer_outlined),
    label: '채팅',
    activeIcon: Icon(Icons.question_answer),
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.people_outline),
    label: '나의 당근',
    activeIcon: Icon(Icons.people),
  ),
];

final List<Widget> tabItems = [
  const IndexPage(),
  Center(child: Text('동네')),
  Center(child: Text('채팅')),
  const MyPage(),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: tabItems),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: tabs,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
