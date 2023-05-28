import 'package:flutter/material.dart';
import 'package:ldt/data/api/model/course.dart';
import 'package:ldt/data/api/model/wrapper.dart';
import 'package:ldt/domain/model/course.dart';

class CourseMapper {
  static const _alpha = 0xff000000;

  static MainCategory fromApiMainCategory(ApiListCourseMainCategory e) {
    return MainCategory(e.id, e.name, Color(e.color + _alpha));
  }

  static CourseAge fromApiAge(ApiCourseAge e) {
    return CourseAge(e.min, e.max);
  }

  static CourseTag fromApiTag(ApiCourseTag e) {
    return CourseTag(e.id, e.name, Color(e.color + _alpha));
  }

  static CourseInList fromApiCourseInList(ApiCourseInList e) {
    return CourseInList(
      e.id,
      e.name,
      e.address,
      fromApiMainCategory(e.mainCategory),
      fromApiAge(e.age),
      e.difficulty,
      e.duration,
      e.type,
      List.generate(e.tags.length, (index) => fromApiTag(e.tags[index])),
    );
  }

  static List<CourseInList> fromApiCoursesInList(Wrapper<List<ApiCourseInList>> w) {
    if (!w.success || w.response == null) return List.empty();
    final e = w.response!;
    return List.generate(e.length, (index) => fromApiCourseInList(e[index]));
  }

  static CourseShortLesson fromApiShortLesson(ApiCourseShortLesson e) {
    return CourseShortLesson(e.id, e.title, e.estimatedMinutes);
  }

  static TaskSomeOf fromApiSomeOf(ApiTaskSomeOf e) {
    return TaskSomeOf(e.id, e.text, e.isRight, e.image, e.audio);
  }

  static LessonTask fromApiTask(ApiLessonTask e) {
    return LessonTask(
      e.id,
      e.title,
      LessonTaskType.values.firstWhere((u) => u.name == e.type),
      List.generate(e.some.length, (index) => fromApiSomeOf(e.some[index])),
    );
  }

  static CourseLesson fromApiLesson(ApiCourseLesson e) {
    return CourseLesson(
      e.id,
      e.title,
      e.estimatedMinutes,
      e.text,
      List.generate(e.tasks.length, (index) => fromApiTask(e.tasks[index])),
    );
  }

  static CourseModuleWithShortLessons fromApiModuleWithShortLessons(int index, ApiCourseModule e, List<ApiCourseShortLesson> lessons) {
    return CourseModuleWithShortLessons(
      e.id,
      index,
      e.description,
      e.lessonStart,
      e.lessonEnd,
      List.generate(e.lessonEnd - e.lessonStart, (index) => fromApiShortLesson(lessons[e.lessonStart + index])),
    );
  }

  static CourseModule fromApiModule(int index, ApiCourseModule e, List<ApiCourseLesson> lessons) {
    return CourseModule(
      e.id,
      index,
      e.description,
      e.lessonStart,
      e.lessonEnd,
      List.generate(e.lessonEnd - e.lessonStart, (index) => fromApiLesson(lessons[e.lessonStart + index])),
    );
  }

  static Course? fromApiCourse(Wrapper<ApiCourse> w) {
    if (!w.success || w.response == null) return null;
    final e = w.response!;
    return Course(
      e.id,
      e.name,
      e.address,
      fromApiMainCategory(e.mainCategory),
      fromApiAge(e.age),
      e.difficulty,
      e.duration,
      e.type,
      List.generate(e.tags.length, (index) => fromApiTag(e.tags[index])),
      e.description,
      List.generate(e.modules.length, (index) => fromApiModuleWithShortLessons(index, e.modules[index], e.lessons)),
      e.lessons.length,
    );
  }

  static List<CourseModule> fromApiLessons(Wrapper<ApiCourseLessons> w) {
    if (!w.success || w.response == null) return List.empty();
    final e = w.response!;
    return List.generate(e.modules.length, (index) => fromApiModule(index, e.modules[index], e.lessons));
  }
}
