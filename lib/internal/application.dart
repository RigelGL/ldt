import 'package:flutter/material.dart';
import 'package:ldt/presentation/pages/courses/course_page.dart';
import 'package:ldt/presentation/pages/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ldt/presentation/pages/login_page.dart';


class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final Color colorMain = const Color(0xff003458);
  final Color colorInactive = const Color(0xff939498);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: colorMain),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          elevation: 4,
          backgroundColor: Colors.white,
          selectedIconTheme: const IconThemeData(size: 30),
          selectedLabelStyle: const TextStyle(fontSize: 14),
          selectedItemColor: colorMain,
          unselectedItemColor: colorInactive,
          unselectedIconTheme: const IconThemeData(size: 30),
          unselectedLabelStyle: const TextStyle(fontSize: 14),
        ),
        primaryColor: colorMain,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // TODO: сделать норм роутинг
      routes: {
        '/login': (context) => const LoginPage(),
        '/': (context) => const Home(),
        '/course': (context) => const CoursePage(),
      },
      initialRoute: '/login',
    );
  }
}
