import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/screens/succesful_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  final fkey = GlobalKey<FormState>();
  String? email;
  String? password;

  Future login({required String email, required String password}) async {
    try {
      setState(() {
        isLoading = true;
      });
      final response = await Dio().post(
        "http://192.168.1.23:3001/api/login",
        data: {"email": email, "password": password},
      );
      if (response.statusCode == 200) {
        return "Login Success";
      } else {
        throw "Login Failed";
      }
    } on DioException catch (e) {
      final message = e.response?.data["message"] ?? "Something went wrong";
      return Future.error(message);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _validateAndSubmit() {
    if (fkey.currentState!.validate()) {
      fkey.currentState!.save();
      login(email: email!, password: password!).then((value) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Succesfulscreen()));
      }).catchError((e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Form(
            key: fkey,
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
                    style:
                        context.theme.bodyLarge!.copyWith(color: Colors.grey)),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Email",
                  style: context.theme.titleMedium,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  style: context.theme.titleMedium,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: "Enter email",
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.grey, fontFamily: FontFamily.w400),
                    suffixIcon: Icon(
                      Icons.check_circle,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (value) => email = value,
                ),

                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Password",
                  style: context.theme.titleMedium,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                  style: TextStyle(
                      color: Colors.black, fontFamily: FontFamily.w400),
                  obscureText: true,
                  onSaved: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: "Enter password",
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.grey, fontFamily: FontFamily.w400),
                    suffixIcon: Icon(
                      Icons.check_circle,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize:
                                Size(MediaQuery.sizeOf(context).width, 50),
                            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                          ),
                          onPressed: () {
                            _validateAndSubmit();
                          },
                          child: isLoading
                              ? Center(child: CircularProgressIndicator())
                              : Text(
                                  "Login",
                                  style: context.theme.titleMedium!
                                      .copyWith(color: Colors.white),
                                )),
                      const Text(
                        "or",
                        style: TextStyle(fontSize: 20),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize:
                                Size(MediaQuery.sizeOf(context).width, 50),
                            backgroundColor:
                                const Color.fromARGB(255, 53, 82, 121),
                          ),
                          onPressed: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login())),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.facebook_rounded,
                                color: Colors.white,
                              ),
                              Text(
                                " Continue with Facebook",
                                style: context.theme.titleMedium!
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 25,
                      ),
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
                              Text(
                                "    Continue with Google",
                                style: context.theme.titleMedium,
                              ),
                            ],
                          )),
                      const SizedBox(height: 25),
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
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/appleicon.png"),
                              Text(
                                "    Continue with Apple",
                                style: context.theme.titleMedium,
                              ),
                            ],
                          )),
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
