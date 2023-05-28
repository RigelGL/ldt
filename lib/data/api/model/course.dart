class ApiCourseTag {
  final int id;
  final String name;
  final int color;

  ApiCourseTag.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        color = map['color'];
}

class ApiCourseAge {
  final int min;
  final int max;

  ApiCourseAge.fromApi(Map<String, dynamic> map)
      : min = map['min'],
        max = map['max'];
}

class ApiListCourseMainCategory {
  final int id;
  final String name;
  final int color;

  ApiListCourseMainCategory.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        color = map['color'];
}

class ApiCourseInList {
  final int id;
  final String name;
  final String? address;
  final ApiListCourseMainCategory mainCategory;
  final int difficulty;
  final int duration;
  final String type;
  final ApiCourseAge age;
  final List<ApiCourseTag> tags;

  ApiCourseInList.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        address = map['address'],
        mainCategory = ApiListCourseMainCategory.fromApi(map['mainCategory']),
        age = ApiCourseAge.fromApi(map['age']),
        difficulty = map['difficulty'],
        duration = map['duration'],
        type = map['type'],
        tags = List.generate(map['tags'].length, (index) => ApiCourseTag.fromApi(map['tags'][index]));
}

class ApiCourseShortLesson {
  final int id;
  final String title;
  final int estimatedMinutes;

  ApiCourseShortLesson.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        estimatedMinutes = map['estimatedMinutes'];
}

class ApiTaskSomeOf {
  final int id;
  final String text;
  final bool isRight;
  final String image;
  final String audio;

  ApiTaskSomeOf.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        text = map['text'],
        isRight = map['isRight'],
        image = map['image'],
        audio = map['audio'];
}

class ApiLessonTask {
  final int id;
  final String title;
  final String type;
  final List<ApiTaskSomeOf> some;

  ApiLessonTask.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        type = map['type'],
        some = List.generate(map['some']?.length ?? 0, (index) => ApiTaskSomeOf.fromApi(map['some'][index]));
}

class ApiCourseLesson extends ApiCourseShortLesson {
  final String text;
  final List<ApiLessonTask> tasks;

  ApiCourseLesson.fromApi(super.map)
      : text = map['text'],
        tasks = List.generate(map['tasks']?.length ?? 0, (index) => ApiLessonTask.fromApi(map['tasks'][index])),
        super.fromApi();
}

class ApiCourseModule {
  final int id;
  final String description;
  final int lessonStart;
  final int lessonEnd;

  ApiCourseModule.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        description = map['description'],
        lessonStart = map['lessonStart'],
        lessonEnd = map['lessonEnd'];
}

class ApiCourse extends ApiCourseInList {
  final String description;
  final List<ApiCourseShortLesson> lessons;
  final List<ApiCourseModule> modules;

  ApiCourse.fromApi(super.map)
      : description = map['description'],
        lessons = List.generate(map['lessons'].length, (index) => ApiCourseShortLesson.fromApi(map['lessons'][index])),
        modules = List.generate(map['modules'].length, (index) => ApiCourseModule.fromApi(map['modules'][index])),
        super.fromApi();
}

class ApiCourseLessons {
  final List<ApiCourseLesson> lessons;
  final List<ApiCourseModule> modules;

  ApiCourseLessons.fromApi(Map<String, dynamic> map)
      : lessons = List.generate(map['lessons'].length, (index) => ApiCourseLesson.fromApi(map['lessons'][index])),
        modules = List.generate(map['modules'].length, (index) => ApiCourseModule.fromApi(map['modules'][index]));
}
