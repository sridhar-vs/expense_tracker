part of 'login_bloc.dart';


 class LoginState extends Equatable{

  final LoginModel loginModel;
  final bool isLoading;
  LoginState({LoginModel? loginModel, bool? isLoading})
      : loginModel = loginModel ?? LoginModel.empty(), 
        isLoading = isLoading ?? false;
  
  LoginState copyWith({
    LoginModel? loginModel,
    bool? isLoading,
  }) {
    return LoginState(
      loginModel: loginModel ?? this.loginModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [];
}
