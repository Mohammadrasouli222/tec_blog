// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/models/fake_data.dart';
import 'package:tec_blog/my_colors.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: SolidColors.dividerColor,
      indent: size.width/6,
      endIndent: size.width/6,
    );
  }
}




class MainTags extends StatelessWidget {
   MainTags({
    super.key,
    required this.textTheme,
    required this.index,
  });

  final TextTheme textTheme;
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        gradient: LinearGradient(colors: GradientColors.tags,
        begin: Alignment.centerRight,
        end: Alignment.centerLeft
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16,8,8,8),
        child: Row(
          children: [
          Assets.icons.hashtagicon.image(height: 20),
          SizedBox(width: 8,),
          Text(tagList[index].title,style: textTheme.headlineMedium,)
          ],
        ),
      ),
    );
  }
}

