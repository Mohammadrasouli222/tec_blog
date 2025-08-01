import 'package:get/get.dart';
import 'package:tec_blog/component/api_constant.dart';
import 'package:tec_blog/models/article_model.dart';
import 'package:tec_blog/services/dio_services.dart';

class ListArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getList();
  }

  getList() async {
    loading.value = true;

    var response = await DioService().getMethod(ApiConstant.getArticleList);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      loading.value = false;
    }
  }

    getArticleListWithTagsId(String id) async {
    articleList.clear();
    loading.value = true;

    var response = await DioService().getMethod(ApiConstant.baseUrl +
     'article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=');

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      loading.value = false;
    }
  }

}