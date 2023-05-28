import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ldt/domain/state/courses_state.dart';
import 'package:ldt/internal/app_module.dart';
import 'package:ldt/internal/colors.dart';
import 'package:ldt/presentation/pages/courses/course_difficulty.dart';
import 'package:ldt/presentation/widgets/app_bar.dart';
import 'package:ldt/presentation/widgets/app_button.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late CoursesState _coursesState;

  @override
  void initState() {
    super.initState();
    _coursesState = AppModule.coursesState();
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    _coursesState.getCourse(id);
    return Observer(
      builder: (context) {
        if (_coursesState.courseLoading) {
          return const Scaffold(body: Center(child: SizedBox(width: 60, height: 60, child: CircularProgressIndicator(color: AppColors.alternative))));
        }
        final course = _coursesState.course!;
        final width = MediaQuery.of(context).size.width - 40;

        return Scaffold(
          backgroundColor: AppColors.primaryThin,
          body: Stack(
            children: [
              Stack(
                children: [
                  SizedBox(width: double.infinity, child: Image.asset('assets/images/course-logo.png', fit: BoxFit.fitWidth)),
                  // SafeArea(
                  //     child: Align(
                  //   child:
                  const Text('oksdfasdfasdf'),
                  // )),
                ],
              ),
              SingleChildScrollView(
                  child: Column(
                children: [
                  const SizedBox(height: 180),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 90),
                    width: double.infinity,
                    decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)), color: AppColors.primaryThin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(course.name, style: const TextStyle(fontSize: 30, color: AppColors.textDark, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 10),
                        Text(course.address ?? 'Онлайн', style: const TextStyle(fontSize: 20, color: AppColors.textLight)),
                        const SizedBox(height: 10),
                        CourseDifficulty(courseAge: course.age, difficulty: course.difficulty, expanded: true),
                        const SizedBox(height: 20),
                        const Text('Описание курса', style: TextStyle(fontSize: 28, color: AppColors.textDark, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 5),
                        Text(course.description, style: const TextStyle(fontSize: 22, color: AppColors.textMain)),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  SvgPicture.asset('assets/icons/shape.svg', width: width * .5, color: AppColors.secondary),
                                  SizedBox(
                                    width: double.infinity,
                                    height: width * .5 - 10,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('${course.duration} ч.', style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w600)),
                                        const SizedBox(height: 10),
                                        const Text('Время', style: TextStyle(color: AppColors.primaryThin, fontSize: 18)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Stack(
                                children: [
                                  SvgPicture.asset('assets/icons/shape.svg', width: width * .5, color: AppColors.secondary),
                                  SizedBox(
                                    width: double.infinity,
                                    height: width * .5 - 10,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('${course.lessonsCount}', style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w600)),
                                        const SizedBox(height: 10),
                                        const Text('Уроки', style: TextStyle(color: AppColors.primaryThin, fontSize: 18)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text('Состав курса', style: TextStyle(fontSize: 28, color: AppColors.textDark, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 10),
                        Column(
                          children: course.modules.map<Widget>((e) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [BoxShadow(offset: const Offset(0, 2), color: Colors.black.withOpacity(0.1), blurRadius: 5)],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Модуль ${e.index + 1}', style: const TextStyle(color: AppColors.textDark, fontSize: 30, fontWeight: FontWeight.w500)),
                                    const SizedBox(height: 5),
                                    Text(e.description, style: const TextStyle(color: AppColors.textMain, fontSize: 20)),
                                    const SizedBox(height: 10),
                                    Column(
                                      children: e.lessons.map<Widget>((e) {
                                        return Padding(
                                          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                                          child: Row(
                                            children: [
                                              Container(width: 10, height: 10, decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppColors.primary)),
                                              const SizedBox(width: 10),
                                              Expanded(child: Text(e.title, style: const TextStyle(fontSize: 18))),
                                              Text('${e.estimatedMinutes} мин', style: TextStyle(color: AppColors.textLight, fontSize: 14)),
                                              const SizedBox(width: 10),
                                              SvgPicture.asset('assets/icons/clock.svg', height: 20, color: AppColors.textLight),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: AppButton(text: 'Записаться на курс', color: AppColors.primary, onPressed: () {}),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
