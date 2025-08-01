import 'package:get/get.dart';
import 'package:tec_blog/component/api_constant.dart';
import 'package:tec_blog/models/article_info_model.dart';
import 'package:tec_blog/models/article_model.dart';
import 'package:tec_blog/models/tags_model.dart';
import 'package:tec_blog/services/dio_services.dart';
import 'package:tec_blog/view/single.dart';

class SingleArticleController extends GetxController {

  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  RxList<TagsModel> tagList = RxList();
  RxList<ArticleModel> relatedList = RxList();

  @override

  onInit() {
    super.onInit();
  }

  getArticleInfo(var id) async {
    articleInfoModel = ArticleInfoModel().obs;
    loading.value = true;

    var userId = '';

    // debugPrint(ApiConstant.baseUrl+'article/get.php?command=info&id=$id&user_id=$userId');


    var response = await DioService().getMethod(ApiConstant.baseUrl+'article/get.php?command=info&id=$id&user_id=$userId');

    if (response.statusCode == 200) {

      articleInfoModel.value = ArticleInfoModel.fromJson(response.data); 

      loading.value = false;
    }

    tagList.clear();
    response.data['tags'].forEach((element) {
      tagList.add(TagsModel.fromJson(element));
    });

    relatedList.clear();
    response.data['related'].forEach((element) {
      relatedList.add(ArticleModel.fromJson(element));
    });

    Get.to(Single());

  }
}