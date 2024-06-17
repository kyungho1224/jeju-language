import 'package:flutter/material.dart';
import 'package:jeju_language/screen/sub_screen1.dart';
import 'package:jeju_language/screen/sub_screen2.dart';
import 'package:jeju_language/screen/sub_screen3.dart';
import 'package:jeju_language/screen/sub_screen4.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('제주어 번역기'),
          elevation: 3,
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
        ),
        body: Body(
          index: index,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (newIndex) {
            setState(() {
              index = newIndex;
            });
          },
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '방언사전',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '생활방언',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '속담사전',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '공유해요',
            ),
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  final int index;

  const Body({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return const SubScreen1();
    } else if (index == 1) {
      return const SubScreen2();
    } else if (index == 2) {
      return const SubScreen3();
    }
    return const SubScreen4();
  }
}
