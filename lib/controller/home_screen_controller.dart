import 'package:get/get.dart';
import 'package:tec_blog/component/api_constant.dart';
import 'package:tec_blog/models/article_model.dart';
import 'package:tec_blog/models/podcast_model.dart';
import 'package:tec_blog/models/poster_model.dart';
import 'package:tec_blog/models/tags_model.dart';
import 'package:tec_blog/services/dio_services.dart';

 class HomeScreenController extends GetxController {
   Rx<PosterModel> poster = PosterModel().obs;
   RxList<TagsModel> tagsList = RxList();
   RxList<ArticleModel> topVisitedList = RxList();
   RxList<PodcastModel> topPodcasts = RxList();
   RxBool loading = false.obs;

   @override
   onInit() {
     super.onInit();
     getHomeItems();
   }

   getHomeItems() async {
     loading.value = true;

     var response = await DioService().getMethod(ApiConstant.getHomeItems);

     if (response.statusCode == 200) {
       response.data['top_visited'].forEach((element) {
         topVisitedList.add(ArticleModel.fromJson(element));
       });

       response.data['top_podcasts'].forEach((element) {
         topPodcasts.add(PodcastModel.fromJson(element));
       });

       response.data['tags'].forEach((element) {
         tagsList.add(TagsModel.fromJson(element));
       });

       loading.value = false;

       poster.value = PosterModel.fromJson(response.data['poster']);
     }
   }
 }


//  class HomeScreenController extends GetxController {
//   Rx<PosterModel> poster = PosterModel().obs;
//   RxList<TagsModel> tagsList = RxList();
//   RxList<ArticleModel> topVisitedList = RxList();
//   RxList<PodcastModel> topPodcasts = RxList();
//   RxBool loading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     getHomeItems();
//   }

//   Future<void> getHomeItems() async {
//     loading.value = true;

//     try {
//       var response = await DioService().getMethod(ApiConstant.getHomeItems);

//       if (response.statusCode == 200) {
//         // بررسی نال بودن داده‌ها
//         if (response.data['top_visited'] != null) {
//           response.data['top_visited'].forEach((element) {
//             topVisitedList.add(ArticleModel.fromJson(element));
//           });
//         }

//         if (response.data['top_podcasts'] != null) {
//           response.data['top_podcasts'].forEach((element) {
//             topPodcasts.add(PodcastModel.fromJson(element));
//           });
//         }

//         if (response.data['tags'] != null) {
//           response.data['tags'].forEach((element) {
//             tagsList.add(TagsModel.fromJson(element));
//           });
//         }

//         // بررسی نال بودن poster
//         if (response.data['poster'] != null) {
//           poster.value = PosterModel.fromJson(response.data['poster']);
//         }
//       } else {
//         // مدیریت وضعیت‌های غیر 200
//         print("خطا در پاسخ: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("خطا در بارگذاری داده‌ها: $e");
//     } finally {
//       loading.value = false;
//     }
//   }
// }
