import 'package:flutter/material.dart';
import 'package:ldt/domain/model/course.dart';
import 'package:ldt/internal/colors.dart';
import 'package:ldt/presentation/pages/courses/course_tag.dart';

class CourseDifficulty extends StatelessWidget {
  final CourseAge courseAge;
  final int difficulty;
  final bool expanded;

  const CourseDifficulty({Key? key, required this.courseAge, required this.difficulty, this.expanded = false}) : super(key: key);

  Widget _getLevel(int level) {
    if (level == 1) return CourseTagChip('Начинающие', const Color(0xff8EB048), expanded: expanded);
    return CourseTagChip('Продолжающие', const Color(0xffC07290), expanded: expanded);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _getLevel(difficulty),
        const SizedBox(width: 10),
        CourseTagChip('${courseAge.min} - ${courseAge.max} лет', AppColors.alternative, expanded: expanded),
      ],
    );
  }
}
