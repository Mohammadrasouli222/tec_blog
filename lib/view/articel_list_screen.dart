import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec_blog/component/my_component.dart';
import 'package:tec_blog/controller/list_article_controller.dart';
import 'package:tec_blog/controller/single_article_controller.dart';
import 'package:tec_blog/main.dart';


class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key});

  ListArticleController listarticleController = Get.put(ListArticleController());
  SingleArticleController singleArticleController = Get.put(SingleArticleController());

  @override
  Widget build(BuildContext context) {
  var textTheme = Theme.of(context).textTheme;
   double height = MediaQuery.of(context).size.height;
   double width = MediaQuery.of(context).size.width;
   
    return SafeArea(
      child: Scaffold(
        appBar: appBar("مقالات جدید"),

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Obx(
              ()=> ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: listarticleController.articleList.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: (() async{
                     await singleArticleController.getArticleInfo(
                        listarticleController.articleList[index].id);
                        Get.toNamed(routeSingleArticle);
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      
                          SizedBox(                      
                    
                          // سپس می‌توانید از height و width استفاده کنید
                          height: height / 6,
                          width: width / 3,
                       
                    
                            child: CachedNetworkImage(
                              imageUrl: listarticleController.articleList[index].image!,
                              imageBuilder: (((context, imageProvider) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              })),
                                          
                              placeholder: (((context, url) {
                                return loading();
                              })),
                              errorWidget: ((context, url, error) {
                                return Icon(Icons.image_not_supported_outlined,size: 50,color: Colors.grey);
                              }),
                            ),
                          ),
                       
                          SizedBox(width: 16,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                // width: Get.width/2,
                                width: width / 2,
                                child: Text(listarticleController.articleList[index].title!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                ),
                              ),
                              SizedBox(height: 16,),
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,                          
                              children: [
                              Text(listarticleController.articleList[index].author!,style: textTheme.bodyLarge),
                              SizedBox(width: 20,),
                              
                              Text(listarticleController.articleList[index].view!+ "بازدید",style: textTheme.bodyLarge,),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
