import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({ required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        // BlocProvider.of<SignInBloc>(context).state
        final state = context
            .read<SignInBloc>()
            .state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          toastInfo(msg: 'You need to fill email address');
          return ;
        }
        if (password.isEmpty) {
          toastInfo(msg: 'You need to fill password');
          return ;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: emailAddress, password: password);
          if(credential.user  == null) {
            toastInfo(msg: "You don't exist");
            return ;
          }
          if(!credential.user!.emailVerified) {
              toastInfo(msg: 'You need to verify your email account');
              return ;
          }

          var user = credential.user;
          if(user != null) {
            // we got verified user from firebase
            toastInfo(msg: 'user exist');
            Global.storageService.setString(AppConstant.STORAGE_USER_TOKEN_KEY, '1212');
             Navigator.of(context).pushNamedAndRemoveUntil('/application', (route) => false);
          } else {
            // we have error getting user from firebase
            toastInfo(msg: 'Currenly you are not a user of this app');
          }
        } on FirebaseAuthException catch (e) {
          if(e.code == 'user-not-found') {
             toastInfo(msg: 'No user found for that email');
          } else if(e.code == 'wrong-password') {
            toastInfo(msg: 'Wrong password provided for that user');
          } else if(e.code == 'invalid-email') {
            toastInfo(msg: 'Your email format is wrong');
          }

        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}