import 'package:flutter/material.dart';
import 'package:ldt/domain/model/course.dart';
import 'package:ldt/internal/colors.dart';
import 'package:ldt/presentation/pages/courses/course_difficulty.dart';

class CourseListCard extends StatelessWidget {
  final CourseInList course;

  const CourseListCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/course', arguments: course.id);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [BoxShadow(offset: const Offset(0, 2), color: Colors.black.withOpacity(0.1), blurRadius: 5)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset('assets/images/img-1.png', width: width * 0.25),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(course.name, style: const TextStyle(fontSize: 20, color: AppColors.textMain, fontWeight: FontWeight.w500)),
                      SizedBox(height: 5),
                      Text(course.address ?? 'Онлайн', maxLines: 2, style: TextStyle(fontSize: 16, color: AppColors.textLight), textAlign: TextAlign.left),
                      SizedBox(height: 10),
                      SingleChildScrollView(child: CourseDifficulty(courseAge: course.age, difficulty: course.difficulty)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text('Открыт новый набор! Старт 25.08.2023 г.', style: TextStyle(color: AppColors.alternative, fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
