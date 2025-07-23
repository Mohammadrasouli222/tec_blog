import 'package:flutter/material.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tec_blog/view/main_screen.dart';
import 'package:tec_blog/my_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

    @override
  void initState(){
    Future.delayed(Duration(seconds: 3)).then((value){
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context)=> MainScreen()));
    });

    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(  
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.images.dara.image(height: 250),
                SizedBox(height: 32,),
                SpinKitThreeBounce(color: SolidColors.primaryColor, size: 50.0),
              ],
            ),
        ),
      ),
    );
  }
}
