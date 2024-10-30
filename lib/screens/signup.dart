import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/screens/succesful_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool passwordVisible = false;
  bool confirmpassVisible = false;
  bool ischecked = false;
  bool isLoading = false;

  final Signkey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormFieldState>();
  String? username;
  String? useremail;
  String? userpassword;
  String? confirmpass;

  Future<dynamic> signup({required String email, required String password, required String full_name, required String confirm_password}) async {
    try {
      setState(() {
        isLoading = true;
      });
      final dio = Dio();
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
      final response = await dio.post(
        "http://192.168.1.19:3001/api/register",
        data: {"full_name": username, "email": useremail, "password": userpassword, "confirm_password": confirmpass},
      );
      
      if (response.statusCode == 200) {
        return "SignUp Success";
      } else {
        throw "SignUp Failed";
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
    if (Signkey.currentState!.validate() && ischecked) {
      Signkey.currentState!.save();
      signup(full_name: username!,  email: useremail!, password: userpassword!, confirm_password: confirmpass!).then((value) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Succesfulscreen()));
      }).catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      });
    } else if (!ischecked) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please agree to terms & conditions')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Form(
            key: Signkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Center(child: Image.asset("assets/images/3x/logoblack.png")),
                const SizedBox(height: 50),
                Text("SignUp", style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text("Create a new account", style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
                const SizedBox(height: 20),
                
                // Username Field
                Text("Full name", style: Theme.of(context).textTheme.titleMedium),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter username';
                    } else if (value.length > 10) {
                      return 'Username should have max 10 characters';
                    }
                    return null;
                  },
                  onSaved: (value) => username = value,
                  textInputAction: TextInputAction.next,
                  decoration:  InputDecoration(
                    hintText: "Enter full name",
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey,fontFamily: FontFamily.w400),
                    suffixIcon: Icon(Icons.check_circle, color: Colors.black, size: 20),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Email Field
                Text("Email", style: Theme.of(context).textTheme.titleMedium),
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
                  onSaved: (value) => useremail = value,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration:  InputDecoration(
                    hintText: "Enter email",
                     hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey,fontFamily: FontFamily.w400),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Password Field
                Text("Password", style: Theme.of(context).textTheme.titleMedium),
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
                  onSaved: (value) => userpassword = value,
                  obscureText: !passwordVisible,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Enter password",
                     hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey,fontFamily: FontFamily.w400),
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off, color: Colors.black),
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
                Text("Confirm Password", style: Theme.of(context).textTheme.titleMedium),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value.toLowerCase() != passwordKey.currentState?.value?.toLowerCase()) {
                      return "Please enter password same as above field";
                    }
                    return null;
                  },
                  onSaved: (value) => confirmpass = value,
                  obscureText: !confirmpassVisible,
                  decoration: InputDecoration(
                    hintText: "Confirm password",
                     hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey,fontFamily: FontFamily.w400),
                    suffixIcon: IconButton(
                      icon: Icon(confirmpassVisible ? Icons.visibility : Icons.visibility_off, color: Colors.black),
                      onPressed: () {
                        setState(() {
                          confirmpassVisible = !confirmpassVisible;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                
                // Terms Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: ischecked,
                      onChanged: (value) => setState(() => ischecked = value!),
                    ),
                    Expanded(
                      child: Text(
                        "By creating an account, you agree to our terms & conditions.",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey),
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
                      _validateAndSubmit();
                    },
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text("SignUp", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)),
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
