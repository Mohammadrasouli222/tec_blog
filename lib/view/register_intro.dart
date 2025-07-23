import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/my_colors.dart';
import 'package:tec_blog/my_strings.dart';
import 'package:tec_blog/view/my_cats.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.images.tcbot, height: 100),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: MyStrings.welcom,
                    style: textTheme.bodyLarge,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ElevatedButton(
                  onPressed: () {
                    _showEmailBottomSheet(context, size, textTheme);
                  },

                  child: Text("بزن بریم"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showEmailBottomSheet(
    BuildContext context,
    Size size,
    TextTheme textTheme,
  ) {

    
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: ((context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: size.height / 2,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(MyStrings.insertYourEmail, style: textTheme.bodyMedium),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      onChanged: (value) {

                        isEmail(value);

                        print(value + "is Email : " + isEmail(value).toString());

                      },
                      style: textTheme.titleMedium,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "daracode@gmail.com",
                        hintStyle: textTheme.titleMedium,
                      ),
                    ),
                  ),

                  ElevatedButton(onPressed: (() {
                    Navigator.pop(context);
                    _activateCodeBottomSheet(context, size, textTheme);

                  }), child: Text("ادامه")),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Future<dynamic> _activateCodeBottomSheet(
    BuildContext context,
    Size size,
    TextTheme textTheme,
  ) {

    
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: ((context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: size.height / 2,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(MyStrings.activateCode, style: textTheme.bodyMedium),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      onChanged: (value) {

                        isEmail(value);

                        print(value + "is Email : " + isEmail(value).toString());

                      },
                      style: textTheme.titleMedium,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "******",
                        hintStyle: textTheme.titleMedium,
                      ),
                    ),
                  ),

                  ElevatedButton(onPressed: (() {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyCats()));
                  }), child: Text("ادامه")),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
