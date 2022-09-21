import 'package:get/get.dart';

import 'control/bindings/binding.dart';
import 'view/exam_screen.dart';
import 'view/lesson_screen.dart';
import 'view/level_screen.dart';
import 'view/pageview_screen.dart';
import 'view/semester_screen.dart';
import 'view/splash_screen.dart';
import 'view/subject_screen.dart';
import 'view/test_screen.dart';
import 'view/unit_screen.dart';

class Routes {
  static const level = '/level';
  static const semester = '/semester';
  static const subject = '/subject';
  static const unit = '/unit';
  static const lesson = '/lesson';
  static const test = '/test';
  static const exam = '/exam';
  static const splash = '/splash';
  static const pageView = '/pageView';
  static final routes = [
    GetPage(name: level, page: () => const LevelView(), binding: Binding()),
    GetPage(
        name: semester, page: () => const SemesterView(), binding: Binding()),
    GetPage(name: subject, page: () => const SubjectView(), binding: Binding()),
    GetPage(name: unit, page: () => const UnitView(), binding: Binding()),
    GetPage(name: lesson, page: () => const LessonView(), binding: Binding()),
    GetPage(name: test, page: () => const TestView(), binding: Binding()),
    GetPage(name: exam, page: () => const ExamView(), binding: Binding()),
    GetPage(name: pageView, page: () => PageViewScreen(), binding: Binding()),
    GetPage(
        name: splash, page: () => const SplashScreenView(), binding: Binding()),
  ];
}
