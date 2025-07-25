
import 'package:flutter/material.dart';
import 'package:tec_blog/component/my_component.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/component/my_colors.dart';
import 'package:tec_blog/component/my_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
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
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: Assets.images.profileAvatar.image().image,height: 100,),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(Assets.icons.bluePen.image().image,color: SolidColors.seeMore),
        
                SizedBox(height: 8),
        
                Text(
                  MyStrings.imageProfileEdit,
                  style: textTheme.headlineSmall,
                ), 
        
              ],
            ),
        
                SizedBox(height: 60),
        
                Text("امیر رسولی",style: textTheme.bodyLarge,),
                Text(" mohammadrasooli222@gmail.com ",style: textTheme.bodyLarge,),
                SizedBox(height: 40),
                TechDivider(size: size),
                InkWell(
                  onTap: (() {
                    
                  }),
                  splashColor: SolidColors.primaryColor,
                  child: SizedBox(
                    height: 45,
                    child: Center(child: Text(MyStrings.myFavBlog,style: textTheme.bodyLarge,))),
                ),
        
                TechDivider(size: size),
                InkWell(
                  onTap: (() {
                    
                  }),
                  splashColor: SolidColors.primaryColor,
                  child: SizedBox(
                    height: 45,
                    child: Center(child: Text(MyStrings.myFavPodcast,style: textTheme.bodyLarge,))),
                ),
        
                TechDivider(size: size),
                InkWell(
                  onTap: (() {
                    
                  }),
                  splashColor: SolidColors.primaryColor,
                  child: SizedBox(
                    height: 45,
                    child: Center(child: Text(MyStrings.logOut,style: textTheme.bodyLarge,))),
                ),
        
                SizedBox(height: 80),
        
          ],
        ),
      )

    );
  }
}


