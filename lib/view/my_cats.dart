import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/models/data_models.dart';
import 'package:tec_blog/models/fake_data.dart';
import 'package:tec_blog/my_colors.dart';
import 'package:tec_blog/my_component.dart';
import 'package:tec_blog/my_strings.dart';

class MyCats extends StatefulWidget {
  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 32),
                  SvgPicture.asset(Assets.images.tcbot, height: 100),
                  SizedBox(height: 16),
                  Text(
                    MyStrings.successfulRegistration,
                    style: textTheme.bodyLarge,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: "نام و نام خانوادگی",
                      hintStyle: textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(MyStrings.chooseCats, style: textTheme.bodyLarge),
                  //taglist
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 85,
                      child: GridView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: tagList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          crossAxisCount: 2,
                          childAspectRatio: 0.3,
                        ),
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {

                                if(!selectedTags.contains(tagList[index])){

                                selectedTags.add(tagList[index]);

                                }else{

                                  print("${tagList[index].title} exist");

                                }

                              });
                            },
                            child: MainTags(textTheme: textTheme, index: index),
                          );
                        }),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),
                  Image.asset(Assets.icons.bluePen.path, scale: 3),
                  //selected Tags
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 85,
                      child: GridView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: selectedTags.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          crossAxisCount: 2,
                          childAspectRatio: 0.2,
                        ),
                        itemBuilder: ((context, index) {
                          return Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                              color: SolidColors.surface
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: 8),
                                  Text(
                                    selectedTags[index].title,
                                    style: textTheme.bodyLarge,
                                  ),

                                  InkWell(
                                    onTap: ((){
                                      setState(() {
                                        selectedTags.removeAt(index);
                                      });
                                    }),
                                  child: Icon(CupertinoIcons.delete,color: Colors.grey,size: 20,)),

                                ],
                              ),
                            ),
                          );
                          
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
