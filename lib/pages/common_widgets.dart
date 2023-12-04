import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';

AppBar buildAppBar(String type) {
  return AppBar(
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        // height defines the thickness of the line
        height: 1.0,
      ),
    ),
    elevation: 0,
    title: Text(
      type,
      style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal),
    ),
  );
}

// I need context for accessing bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcons('google'),
        _reusableIcons('apple'),
        _reusableIcons('facebook'),
      ],
    ),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.h,
      child: Image.asset('assets/icons/$iconName.png'),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 5.h,
    ),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.5),
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName,
    void Function(String value)? func) {
  return Container(
    width: 325.h,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.w),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: AppColors.primaryFourElementText)),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 17.w),
          width: 16.w,
          height: 16.w,
          child: Image.asset('assets/icons/$iconName.png'),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            onChanged: (value) => func!(value),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: hintText,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintStyle: const TextStyle(
                    color: AppColors.primarySecondaryElementText)),
            style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.normal,
                fontSize: 14.sp),
            autocorrect: false,
            obscureText: textType == 'password' ? true : false,
          ),
        )
      ],
    ),
  );
}

Widget forgetPassword() {
  return Container(
    margin: EdgeInsets.only(left: 5.w),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        'Forgot password?',
        style: TextStyle(
            color: AppColors.primaryText,
            letterSpacing: 0.3,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryText,
            decorationThickness: 1,
            fontSize: 12.sp),
      ),
    ),
  );
}

Widget buildLogInAdnRegButton(String buttonName, String buttonType, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      margin: EdgeInsets.only(top: buttonType == 'login' ? 40.h : 20.h),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: buttonType == 'login'
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(
            color: buttonType == 'login'
                ? Colors.transparent
                : AppColors.primaryFourElementText,
          ),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
                color: Colors.grey.withOpacity(0.1))
          ]),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: buttonType == 'login'
                  ? AppColors.primaryBackground
                  : AppColors.primaryText),
        ),
      ),
    ),
  );
}
