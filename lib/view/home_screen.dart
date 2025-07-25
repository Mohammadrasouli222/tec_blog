
import 'package:flutter/material.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/models/fake_data.dart';
import 'package:tec_blog/component/my_colors.dart';
import 'package:tec_blog/component/my_component.dart';
import 'package:tec_blog/component/my_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0,16,0,0),
        child: Column(
          children: [
      
            //poster
            HomePagePoster(size: size, textTheme: textTheme),
      
            SizedBox(height: 16,),
            //tag List
            HomePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),
          
          SizedBox(height: 32,),
          
          //see more
          SeeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),
      
          //blog list
          HomePageBlogList(size: size, bodyMargin: bodyMargin, textTheme: textTheme),
      
      
          //see more
          SeeMorePodcast(bodyMargin: bodyMargin, textTheme: textTheme),
      
          //podcast list
          HomePagePodcastList(size: size, bodyMargin: bodyMargin),
      
          SizedBox(height: 60,)
      
          ], 
        ),
      ),
    );
  }
}

class HomePagePodcastList extends StatelessWidget {
  const HomePagePodcastList({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height/3.5,
      child: ListView.builder(
        itemCount: blogList.getRange(0, 5).length,
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
                        image: NetworkImage(blogList[index].imageUrl),
                        fit: BoxFit.cover
                        ),
                    
                      ),
                    
                    ),
        
                    ],
                  
                  ),
                ),
              ),
          
              SizedBox(
              width: size.width / 2.4,
              child:
              Text(
                blogList[index].title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              
              ))
            ],
          ),
        );
      })),
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

class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height/3.5,
      child: ListView.builder(
        itemCount: blogList.getRange(0, 5).length,
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
                        image: NetworkImage(blogList[index].imageUrl),
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
                    Text(blogList[index].writer,style: textTheme.titleSmall,),
                    Row(
                      children: [
                        Text(blogList[index].views,style: textTheme.titleSmall,),
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
                blogList[index].title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              
              ))
            ],
          ),
        );
      })),
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


class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width/1.19,
          height: size.height/4.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
              image: AssetImage(homePagePosterMap["imageAsset"]),
              fit: BoxFit.cover
              )
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
              Text("دوازده قدم برنامه نویسی یک دوره ی...",style: textTheme.headlineLarge,),
          ],
        ),
      )
          
      ],
    );
  }
}

