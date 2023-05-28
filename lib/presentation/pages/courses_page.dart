import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:ldt/domain/state/courses_state.dart';
import 'package:ldt/internal/app_module.dart';
import 'package:ldt/presentation/pages/courses/course_list_cart.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  late CoursesState _coursesState;

  @override
  void initState() {
    super.initState();
    _coursesState = AppModule.coursesState();
    _coursesState.getCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return RefreshIndicator(
        onRefresh: () async {
          await _coursesState.getCourses();
        },
        child:  ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        itemCount: _coursesState.courses.length,
        itemBuilder: (e, i) {
          return CourseListCard(course: _coursesState.courses[i]);
        },
        separatorBuilder: (e, i) => SizedBox(height: 20),
      ),);
    });
  }
}
