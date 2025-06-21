import 'package:carrot_market_app/widgets/modal/more_bottom.dart';
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
  Center(child: Text('홈')),
  Center(child: Text('동네')),
  Center(child: Text('채팅')),
  Center(child: Text('나의 당근')),
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
      appBar: AppBar(
        centerTitle: false,
        title: Text('내 동네'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.grey[100],
                builder: (context) {
                  return MoreBottomModal(
                    onCancle: () {
                      Navigator.pop(context);
                    },
                  );
                },
              );
            },
            icon: Icon(Icons.notifications_none_outlined),
          ),
        ],
      ),
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
