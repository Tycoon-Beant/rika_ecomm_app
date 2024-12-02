import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/cubits/login_cubit/login_cubit.dart';
import 'package:rika_ecomm_app/cubits/signup_cubit/signup_cubit.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/model/user_model.dart';
import 'package:rika_ecomm_app/screens/login.dart';
import 'package:rika_ecomm_app/services/login_services.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool passwordVisible = false;
  bool confirmpassVisible = false;
  bool ischecked = false;

  final signkey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Form(
            key: signkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Center(child: Image.asset("assets/images/3x/logoblack.png")),
                const SizedBox(height: 50),
                Text("SignUp",
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text("Create a new account",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Colors.grey)),
                const SizedBox(height: 20),
                BlocConsumer<SignupCubit, Result<User>>(
                  listener: (context, state) {
                    if (state.data != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => LoginCubit(context.read<LoginServices>()),
                            child: const Login(),
                          ),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Signup successfull!"),
                        ),
                      );
                    }
                    if (state.error != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error.toString()),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("User name",
                              style: Theme.of(context).textTheme.titleMedium),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter username';
                              } else if (value.length > 10) {
                                return 'Username should have max 10 characters';
                              }
                              return null;
                            },
                            onSaved: (value) => context
                                .read<SignupCubit>()
                                .updateForm("username", value),
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: "Enter full name",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: Colors.grey,
                                      fontFamily: FontFamily.w400),
                            ),
                          ),
                          const SizedBox(height: 20),
    
                          // Email Field
                          Text("Email",
                              style: Theme.of(context).textTheme.titleMedium),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                              if (!regex.hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            onSaved: (value) => context
                                .read<SignupCubit>()
                                .updateForm("email", value),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: "Enter email",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: Colors.grey,
                                      fontFamily: FontFamily.w400),
                            ),
                          ),
                          const SizedBox(height: 20),
    
                          // Password Field
                          Text("Password",
                              style: Theme.of(context).textTheme.titleMedium),
                          TextFormField(
                            key: passwordKey,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.length < 8) {
                                return 'Password must be at least 8 characters long';
                              }
                              return null;
                            },
                            onSaved: (value) => context
                                .read<SignupCubit>()
                                .updateForm("password", value),
                            obscureText: !passwordVisible,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: "Enter password",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: Colors.grey,
                                      fontFamily: FontFamily.w400),
                              suffixIcon: IconButton(
                                icon: Icon(
                                    passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black),
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
    
                          // Confirm Password Field
                          Text("Confirm Password",
                              style: Theme.of(context).textTheme.titleMedium),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              } else if (value.toLowerCase() !=
                                  passwordKey.currentState?.value
                                      ?.toLowerCase()) {
                                return "Please enter password same as above field";
                              }
                              return null;
                            },
                            obscureText: !confirmpassVisible,
                            decoration: InputDecoration(
                              hintText: "Confirm password",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: Colors.grey,
                                      fontFamily: FontFamily.w400),
                              suffixIcon: IconButton(
                                icon: Icon(
                                    confirmpassVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black),
                                onPressed: () {
                                  setState(() {
                                    confirmpassVisible = !confirmpassVisible;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      );
                  },
                ),
                // Terms Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: ischecked,
                      onChanged: (value) =>
                          setState(() => ischecked = value!),
                    ),
                    Expanded(
                      child: Text(
                        "By creating an account, you agree to our terms & conditions.",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
    
                // Signup Button
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      if (signkey.currentState!.validate()) {
                        signkey.currentState!.save();
                        context.read<SignupCubit>().signup();
                      }
                    },
                    child: context.watch<SignupCubit>().state.isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text("SignUp",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
