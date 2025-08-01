import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec_blog/component/api_constant.dart';
import 'package:tec_blog/component/storage_const.dart';
import 'package:tec_blog/services/dio_services.dart';
import 'package:tec_blog/view/main_screen/main_screen.dart';
import 'package:tec_blog/view/register/register_intro.dart';

class RegisterController extends GetxController{

    TextEditingController emailTextEditingController = TextEditingController();
    TextEditingController activeCodeTextEditingController = TextEditingController();
    var email = '';
    var userId = '';

  register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register'
    };

    var response = await DioService().postMethod(map, ApiConstant.postRegister);
    
    email = emailTextEditingController.text;
    userId = response.data['user_id'];
    debugPrint(response.toString());

  }


  verify() async {

    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activeCodeTextEditingController.text,
      'command': 'verify',
    };
    debugPrint(map.toString());

    var response = await DioService().postMethod(map, ApiConstant.postRegister);
    debugPrint(response.data.toString());

    var status = response.data['response'];
 
    switch(status){

      case 'verified':
          var box = GetStorage();
          box.write(token, response.data['token']);
          box.write(userId, response.data['user_id']);
       
          debugPrint("read:::   " + box.read(token));
          debugPrint("read:::   " + box.read(userId));

          Get.offAll(MainScreen());
          break;      
      case 'incorrect_code':
        Get.snackbar('خطا', 'کد فعال سازی غلط است!');
          break;
      case 'expired':
        Get.snackbar('خطا', 'کد فعال سازی منقضی شده است!');
          break;
    }

  }

  toggleLogin() {
   if (GetStorage().read(token)==null) {
      //debugPrint('not register ');
        Get.to(RegisterIntro());
      } else {
      //  routeToWriteBottomSheet();
      debugPrint('post screen');
      }
     }


  routeToWriteBottomSheet(){

    Get.bottomSheet(
      Container(
        height: Get.height/3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),

          )
        ),
      )
    );
  
  }


}

// "response":true,"user_id":"629"

// response: verified, user_id: 629,
// token: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6NjI5LCJlbWFpbCI6Im1vaGFtbWFkcmFzb29saTIyMkBnbWFpbC5jb20ifQ.7GiPcwOG-YRfNBMo4ZUJLH-8i8VoZQLhOTXg4TnljXA