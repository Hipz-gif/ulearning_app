
import 'package:flutter/cupertino.dart';
import 'package:ulearning_app/common/entities/user.dart';
import 'package:ulearning_app/global.dart';

class HomeController {
  final BuildContext context;
  UserItem userProfile = Global.storageService.getUserProfile();
  HomeController({required this.context});

  Future<void> init() async {
    if(Global.storageService.getUserToken().isNotEmpty){
      //var result = await CourseAPI.courseList();
      //if(result.code == 200){}
    }
  }
}