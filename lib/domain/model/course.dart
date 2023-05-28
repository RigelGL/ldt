import 'package:flutter/material.dart';

class MainCategory {
  final int id;
  final String name;
  final Color color;

  MainCategory(this.id, this.name, this.color);
}

class CourseAge {
  final int min;
  final int max;

  CourseAge(this.min, this.max);
}

class CourseTag {
  final int id;
  final String name;
  final Color color;

  CourseTag(this.id, this.name, this.color);
}

class CourseInList {
  final int id;
  final String name;
  final String ?address;
  final MainCategory main;
  final CourseAge age;
  final int difficulty;
  final int duration;
  final String type;
  final List<CourseTag> tags;

  CourseInList(this.id, this.name, this.address, this.main, this.age, this.difficulty, this.duration, this.type, this.tags);
}

class CourseShortLesson {
  final int id;
  final String title;
  final int estimatedMinutes;

  CourseShortLesson(this.id, this.title, this.estimatedMinutes);
}

enum LessonTaskType {
  text,
  someOf,
  match,
}

class TaskSomeOf {
  final int id;
  final String text;
  final bool isRight;
  final String image;
  final String audio;

  TaskSomeOf(this.id, this.text, this.isRight, this.image, this.audio);
}

class LessonTask {
  final int id;
  final String title;
  final LessonTaskType type;
  final List<TaskSomeOf> some;

  LessonTask(this.id, this.title, this.type, this.some);
}

class CourseLesson extends CourseShortLesson {
  final String text;
  final List<LessonTask> tasks;

  CourseLesson(super.id, super.title, super.estimatedMinutes, this.text, this.tasks);
}

abstract class CourseModulePrototype {
  final int id;
  final int index;
  final String description;
  final int lessonStart;
  final int lessonEnd;

  CourseModulePrototype(this.id, this.index, this.description, this.lessonStart, this.lessonEnd);
}

class CourseModuleWithShortLessons extends CourseModulePrototype {
  final List<CourseShortLesson> lessons;

  CourseModuleWithShortLessons(super.id, super.index, super.description, super.lessonStart, super.lessonEnd, this.lessons);
}

class CourseModule extends CourseModulePrototype {
  final List<CourseLesson> lessons;

  CourseModule(super.id, super.index, super.description, super.lessonStart, super.lessonEnd, this.lessons);
}

class Course extends CourseInList {
  final String description;
  final List<CourseModuleWithShortLessons> modules;
  final int lessonsCount;

  Course(super.id, super.name, super.address, super.main, super.age, super.difficulty, super.duration, super.type, super.tags, this.description, this.modules, this.lessonsCount);
}

class CourseLessons {
  final List<CourseLesson> lessons;
  final List<CourseModule> modules;

  CourseLessons(this.lessons, this.modules);
}
