
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/app/routes/app_router.dart';
import 'package:expense_tracker/core/constraints/app_colors.dart';
import 'package:expense_tracker/core/constraints/app_fonts.dart';
import 'package:expense_tracker/core/constraints/app_storage_key.dart';
import 'package:expense_tracker/core/storage/app_storage.dart';
import 'package:expense_tracker/features/login/data/login_data.dart';
import 'package:expense_tracker/features/login/model/login_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginData loginData = LoginData();
  LoginBloc() : super(LoginState()) {
    on<LoginEvent>((event, emit) async{});

    on<LoginStarted>((event, emit) async{
       AppStorage storage = AppStorage();
      storage.readData(AppStorageKey.token).then((value)async {
        
        if(value != null && value.isNotEmpty){
          final User? user = await loginData.validateToken(value);
          if(user != null){
            if(event.context.mounted){
            GoRouter.of(event.context).go(AppRouter.homePage);
            }
          }
        } 
      });
    });

    on<LoginButtonPressed>((event, emit) async{
      try{
      final User? user = await loginData.login(event.email, event.password);
      AppStorage storage = AppStorage();
      await storage.writeData(AppStorageKey.token, user?.uid ?? "");
      if(user != null){
        if(event.context.mounted){
       GoRouter.of(event.context).go(AppRouter.dashboardPage);
        } 
      }
      } catch(e){
        Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          fontSize: 14,
          backgroundColor: AppColors.secondary,
          textColor: AppColors.white,
          fontAsset: AppFonts.inter
        );
      }
    });
  }
}
