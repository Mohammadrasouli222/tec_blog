import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tec_blog/component/my_colors.dart';
import 'package:tec_blog/component/my_component.dart';
import 'package:tec_blog/controller/list_article_controller.dart';
import 'package:tec_blog/controller/single_article_controller.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/view/articel_list_screen.dart';



class Single extends StatelessWidget {
  
  Single({super.key});

  var singleArticleController = Get.find<SingleArticleController>();

  @override
  Widget build(BuildContext context) {
    // var id = Get.arguments[0];
    var textheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Obx(
            ()=>singleArticleController.articleInfoModel.value.title==null
            ? SizedBox(
              height: Get.height,
              child: loading()) : Column(children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: singleArticleController.articleInfoModel.value.image!,
                      imageBuilder: ((context, imageProvider) => Image(image: imageProvider)),          
                      placeholder: ((context, url) => loading()),
                      errorWidget: ((context, url, error) =>
                          Image.asset(Assets.images.singlePlaceHolder.path)),
                    ),
            
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter,
                          colors: GradientColors.singleAppbarGradiant)),
            
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                            SizedBox(width: 20,),
                            GestureDetector(
                              onTap: (() => Get.back()),
                              child: Icon(Icons.arrow_back,color: Colors.white,size: 24,)),
                            Expanded(child: SizedBox()),
                            Icon(Icons.bookmark_border_outlined,color: Colors.white,size: 24,),
                            SizedBox(width: 20,),
                            GestureDetector(
                            onTap: () async {
                                await Share.share(
                                  singleArticleController.articleInfoModel.value.title!,);
                                    },
                              child: Icon(Icons.share,color: Colors.white,size: 24,)),

                            SizedBox(width: 20,)
                          ],),
                      
                      ),
                    ),
                  ],
                ),          
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    singleArticleController.articleInfoModel.value.title!,
                    maxLines: 2,
                    style: textheme.titleLarge,
                  ),
            
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Image(image: Image.asset(Assets.images.profileAvatar.path).image,
                    height: 50,
                    ),
                    SizedBox(width: 16,),
                    Text(
                       singleArticleController.articleInfoModel.value.author!,
                      style: textheme.bodyLarge,
                    ),
                    SizedBox(width: 16,),
                    Text(
                        singleArticleController.articleInfoModel.value.createdAt!,
                      style: textheme.bodyLarge,
                    ),
                          
                  ],),
                ),            
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: HtmlWidget(
                  singleArticleController.articleInfoModel.value.content!,
                  textStyle: textheme.bodyLarge,
                  enableCaching: true,
                  onLoadingBuilder: ((context, element, loadingProgress) => loading()) ,
                ),
              ),
            
              const SizedBox(
                height: 25,
              ),
              tags(textheme),

              const SizedBox(
                height: 25,
              ),

              simmilar(textheme),
              
              ],
            ),
          ),
        ),
      ),
    );
  }


    Widget tags(textheme){

    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: singleArticleController.tagList.length,
        itemBuilder: ((context, index){
        return GestureDetector(
          onTap: () async{
            var tagId = singleArticleController.tagList[index].id!;
            await Get.find<ListArticleController>()
            .getArticleListWithTagsId(tagId);

            Get.to(ArticleListScreen());
          },
          child: Padding(
            padding: EdgeInsets.only(left: 8),
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                color: Colors.grey),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8,8,8,8),
                  child: Text(
                    singleArticleController.tagList[index].title!,
                    style: textheme.headlineLarge,
                  ),
                ),
            ),
          ),
        );
      })),
    );

  }

  Widget simmilar(textheme){
    return SizedBox(
      height: Get.height/3.5,
      child: Obx(
        ()=> ListView.builder(
          itemCount: singleArticleController.relatedList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context,index){
            
          //blog item
          return GestureDetector(
            onTap: ((){
                singleArticleController.getArticleInfo(
                  singleArticleController.relatedList[index].id,
                );
            }),
            child: Padding(
              padding: EdgeInsets.only(right: index==0?Get.width / 15 : 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: Get.height/5.3,
                        width: Get.width/2.4,
                      child: Stack(
                        children: [
                      
                        CachedNetworkImage(
                        imageUrl: singleArticleController.relatedList[index].image!,                        
                        imageBuilder: ((context, imageProvider)=> 
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: 
                              BorderRadius.all(Radius.circular(16)),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover)
                              ),
                          )
                        ),
                        
                        placeholder: ((context, url) =>
                        SpinKitFadingCube(
                          color: SolidColors.primaryColor,
                          size: 32.0,
                        )),
                        errorWidget: ((context, url, error) => 
                        Icon(Icons.image_not_supported_outlined,
                        size: 50,
                        color: Colors.grey,
                        )),
                        ),
                      
                      Positioned(
                      bottom: 8,
                      left: 0,
                      right: 0,
                      
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(singleArticleController.relatedList[index].author!,style: textheme.titleSmall,),
                        Row(
                          children: [
                            Text(singleArticleController.relatedList[index].view!,style: textheme.titleSmall,),
                            SizedBox(width: 8,),
                            Icon(Icons.remove_red_eye_sharp,color: Colors.white,size: 16,),
                          ],
                        ),
                      ],
                                        ),
                                      )
                        ],
                      
                      ),
                    ),
                  ),
              
                  SizedBox(
                  width: Get.width / 2.4,
                  child:
                  Text(
                    singleArticleController.relatedList[index].title!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  
                  ))
                ],
              ),
            ),
          );
        })),
      ),
    );
  }



}
