import 'package:get/get.dart';
import 'package:tec_blog/controller/home_screen_controller.dart'; // اضافه کنید
import 'package:tec_blog/controller/list_article_controller.dart';
import 'package:tec_blog/controller/registerController.dart';
import 'package:tec_blog/controller/single_article_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListArticleController());
    Get.lazyPut(() => SingleArticleController());
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
    Get.lazyPut(() => HomeScreenController()); // این خط را اضافه کنید
  }
}