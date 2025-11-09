import 'package:expense_tracker/core/constraints/app_colors.dart';
import 'package:expense_tracker/features/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => LoginBloc()..add(LoginStarted(context: context)),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            return SafeArea(
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),
                  children: [
                    Text(
                      "Welcome to Expense Tracker",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Track your cash and UPI transactions effortlessly.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: TextFormField(
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Please enter your email';
                          }
                          return null;  
                        },
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(hintText: "Email"),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: TextFormField(
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Please enter your password';
                          }
                          return null;  
                        },
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: const InputDecoration(hintText: "Password"),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: SizedBox(
                        height: 48,
                        child: FilledButton(
                          onPressed: () {
                            if(_formKey.currentState!.validate()){  
                            context.read<LoginBloc>().add(
                              LoginButtonPressed(
                                email: _emailController.text,
                                password: _passwordController.text,
                                context: context
                              ),
                            );
                            }
                          },
                          child: Text(
                            'Sign Up / Log In',
                            style: TextStyle(color: AppColors.primaryColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
