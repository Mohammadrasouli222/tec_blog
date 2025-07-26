
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tec_blog/controller/home_screen_controller.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/models/fake_data.dart';
import 'package:tec_blog/component/my_colors.dart';
import 'package:tec_blog/component/my_component.dart';
import 'package:tec_blog/component/my_strings.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.fromLTRB(0,16,0,0),
          child:homeScreenController.loading.value==false? 
             Column(
              children: [                
                //poster
              poster(),                
              SizedBox(height: 16,),
              //tag List
              HomePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),            
              SizedBox(height: 32,),            
              //see more
              SeeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),                
              //blog list
             topVisited(),                                
              //see more
              SeeMorePodcast(bodyMargin: bodyMargin, textTheme: textTheme),                
              //podcast list
              topPodcasts(),          
              SizedBox(height: 60,)
                
              ], 
            )
            : Center(child: loading()),
        ),
      ),
    );
  }

  Widget topVisited(){
    return SizedBox(
      height: size.height/3.5,
      child: Obx(
        ()=> ListView.builder(
          itemCount: homeScreenController.topVisitedList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context,index){
            
          //blog item
          return Padding(
            padding: EdgeInsets.only(right: index==0?bodyMargin:15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: size.height/5.3,
                      width: size.width/2.4,
                    child: Stack(
                      children: [
                    
                        Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          image: DecorationImage(
                          image: NetworkImage(
                            homeScreenController.topVisitedList[index].image!),
                          fit: BoxFit.cover
                          ),
                      
                        ),
                      
                        foregroundDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: GradientColors.blogPost
                          )
                      
                        ),
                      
                      ),
                    
                    Positioned(
                    bottom: 8,
                    left: 0,
                    right: 0,
                    
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(homeScreenController.topVisitedList[index].author!,style: textTheme.titleSmall,),
                      Row(
                        children: [
                          Text(homeScreenController.topVisitedList[index].view!,style: textTheme.titleSmall,),
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
                width: size.width / 2.4,
                child:
                Text(
                  homeScreenController.topVisitedList[index].title!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                
                ))
              ],
            ),
          );
        })),
      ),
    );
  }

  Widget topPodcasts(){
    return SizedBox(
      height: size.height/3.5,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenController.topPodcasts.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context,index){
            
          //blog item
          return Padding(
            padding: EdgeInsets.only(right: index==0?bodyMargin:15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: size.height/5.3,
                      width: size.width/2.4,
                    child: CachedNetworkImage(

                      imageUrl: homeScreenController.topPodcasts[index].poster!,
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
                          loading()),
                      errorWidget: ((context, url, error) => 
                      Icon(Icons.image_not_supported_outlined,
                      size: 50,
                      color: Colors.grey,
                      )),
                      )

                  ),
                ),
            
                SizedBox(
                width: size.width / 2.4,
                child:
                Text(
                  homeScreenController.topPodcasts[index].title!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                
                ))
              ],
            ),
          );
        })),
      ),
    );
  }

  Widget poster(){
    
    return Stack(
      children: [
        Container(
          width: size.width/1.19,
          height: size.height/4.2,
          child: CachedNetworkImage(
                      imageUrl: homeScreenController.poster.value.image!,
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
          
            foregroundDecoration:  BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            gradient: LinearGradient(
              colors: GradientColors.homePosterCoverGradiant,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
              )
            ),
        ),
          
      Positioned(
        bottom: 8,
        left: 0,
        right: 0,
          
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // ignore: prefer_interpolation_to_compose_strings
                Text(homePagePosterMap["writer"]+ " - " + homePagePosterMap["date"] ,style: textTheme.titleSmall,),
                Row(
                  children: [
                    Text(homePagePosterMap["view"],style: textTheme.titleSmall,),
                    SizedBox(width: 8,),
                    Icon(Icons.remove_red_eye_sharp,color: Colors.white,size: 16,),
                  ],
                ),
              ],
            ),
              Text(homeScreenController.poster.value.title!,style: textTheme.headlineLarge,),
          ],
        ),
      )
          
      ],
    );

  }

}





class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin,bottom: 8),
      child: Row(children: [
      Assets.icons.microphon.image(height: 30),
      SizedBox(width: 8,),
      Text(MyStrings.viewHotestPodCasts,style: textTheme.headlineSmall,)
      ],),
    );
  }
}



class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin,bottom: 8),
      child: Row(children: [
      Assets.icons.bluePen.image(height: 30),
      SizedBox(width: 8,),
      Text(MyStrings.viewHotestBlog,style: textTheme.headlineSmall,)
      ],),
    );
  }
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tagList.length,
        itemBuilder: ((context, index){
        return Padding(
          padding: EdgeInsets.fromLTRB(0,8,index==0?bodyMargin:15 ,8),
          child: MainTags(textTheme: textTheme, index: index,),
        );
      })),
    );
  }
}




