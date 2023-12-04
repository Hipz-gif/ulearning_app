import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/routes.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ulearning_app/global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [...AppPages.allProviders(context)],
        child: ScreenUtilInit(
          builder: (context, child) =>  MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppPages.GenerateRouteSettings,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                elevation: 0,
                iconTheme: IconThemeData(
                  color: AppColors.primaryText
                ),
                backgroundColor: Colors.white
              )
            ),
          ),
        ));
  }
}


