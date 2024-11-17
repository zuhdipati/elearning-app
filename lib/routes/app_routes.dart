abstract class Paths {
  static const splash = '/splash';
  static const main = '/main';
  static const home = '/home';
  static const login = '/login';

  static const course = '/course';
  static const courseDetail = '/:id';
  static const audio = '/audio';
  static const audioDetail = '/:id';

  static const boarding = '/boarding';
}

abstract class Routes {
  static String splash = Paths.splash;

  static String main = Paths.main;
  static String home = main + Paths.home;
  static String login = Paths.login;

  static String boarding = Paths.boarding;

  static String course = home + Paths.course;
  static String courseDetail(String id) => '$course/$id';

  static String audio = home + Paths.audio;
  static String audioDetail(String id) => '$audio/$id';
}
