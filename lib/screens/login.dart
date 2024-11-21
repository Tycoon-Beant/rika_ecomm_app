import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/cubits/login_cubit/login_cubit.dart';
import 'package:rika_ecomm_app/model/login_model.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/screens/succesful_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginkey = GlobalKey<FormState>();
    bool passwordVisible = false;
final passKey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Form(
            key: loginkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Center(child: Image.asset("assets/images/3x/logoblack.png")),
                const SizedBox(
                  height: 40,
                ),
                Text("Welcome!", style: context.theme.headlineSmall),
                // const SizedBox(
                //   height: 2,
                // ),
                Text("please login or sign up to continue our app",
                    style: context.theme.bodyLarge!.copyWith(color: Colors.grey)),
                const SizedBox(
                  height: 25,
                ),
                BlocConsumer<LoginCubit, Result<Loginuser>>(
                  listener: (context, state) {
                     if (state.data != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Succesfulscreen(),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Login successfull!"),
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
                        Text(
                          "User name",
                          style: context.theme.titleMedium,
                        ),
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
                              .read<LoginCubit>()
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
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Password",
                          style: context.theme.titleMedium,
                        ),
                        TextFormField(
                              key: passKey,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                } else if (value.length < 8) {
                                  return 'Password must be at least 8 characters long';
                                }
                                return null;
                              },
                              onSaved: (value) => context
                                  .read<LoginCubit>()
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
                      ],
                    );
                  },
                ),
            
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      onPressed: () {
                        if (loginkey.currentState!.validate()) {
                          loginkey.currentState?.save();
                          context.read<LoginCubit>().login();
                        }
                      },
                      child: context.watch<LoginCubit>().state.isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text("Login",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.white)),
                    ),
                    const SizedBox(height: 24),
                    
                      const Text(
                        "or",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize:
                                  Size(MediaQuery.sizeOf(context).width, 50),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  side: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 173, 170, 170)))),
                          onPressed: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login())),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/googleicon.png"),
                              const SizedBox(width: 10),
                              Text(
                                "Continue with Google",
                                style: context.theme.titleMedium,
                              ),
                            ],
                          )),
                      // const SizedBox(height: 25),
                      // ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //         fixedSize:
                      //             Size(MediaQuery.sizeOf(context).width, 50),
                      //         backgroundColor: Colors.white,
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(40),
                      //             side: const BorderSide(
                      //                 color:
                      //                     Color.fromARGB(255, 173, 170, 170)))),
                      //     onPressed: () {},
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Image.asset("assets/images/appleicon.png"),
                      //         Text(
                      //           "    Continue with Apple",
                      //           style: context.theme.titleMedium,
                      //         ),
                      //       ],
                      //     )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
