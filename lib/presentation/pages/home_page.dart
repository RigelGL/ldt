import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ldt/internal/colors.dart';
import 'package:ldt/presentation/pages/courses_page.dart';
import 'package:ldt/presentation/widgets/app_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem _getItem(String text, String logo) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/icons/bar/$logo.svg', color: AppColors.primary, width: 25, height: 25),
      activeIcon: Stack(alignment: Alignment.center, children: [
        SvgPicture.asset('assets/icons/shape.svg', color: AppColors.tabAccent, width: 40, height: 40),
        SvgPicture.asset('assets/icons/bar/$logo.svg', color: Colors.white, width: 25, height: 25),
      ]),
      label: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xffF3F4C1),
        appBar: AppMainBar(),
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            Text('TODO'),
            Text('TODO'),
            CoursesPage(),
            Text('TODO lenta'),
            Text('TODO map'),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 80  ,
          child: BottomNavigationBar(
            backgroundColor: const Color(0xffFCFDE5),
            unselectedItemColor: AppColors.primary,
            selectedItemColor: AppColors.tabAccent,
            unselectedIconTheme: const IconThemeData(color: AppColors.primary),
            selectedIconTheme: const IconThemeData(color: AppColors.tabAccent),
            items: <BottomNavigationBarItem>[
              _getItem('Главная', 'main'),
              _getItem('Задания', 'puzzle'),
              _getItem('Курсы', 'course'),
              _getItem('Лента', 'feed'),
              _getItem('Карта', 'map'),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
