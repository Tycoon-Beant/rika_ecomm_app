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
    var ischecked = false;
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(child: Image.asset("assets/images/3x/logoblack.png")),
              const SizedBox(
                height: 50,
              ),
              Text("SignUp",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontFamily: FontFamily.w800)),
              // const SizedBox(
              //   height: 2,
              // ),
              const Text("Create a new account",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  )),
              const SizedBox(
                height: 55,
              ),
              Text("User name ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: FontFamily.w700)),
              TextField(
                  style: TextStyle(
                      color: Colors.black, fontFamily: FontFamily.w400),
                      textInputAction: TextInputAction.next,
                      
                  decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintText: "Enter user name",
                      suffixIcon: Icon(
                        Icons.check_circle,
                        color: Colors.black,
                        size: 20,
                      ))),
              const SizedBox(
                height: 20,
              ),
              Text("Email",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: FontFamily.w700)),
              TextField(
                  style: TextStyle(
                      color: Colors.black, fontFamily: FontFamily.w400),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: "Enter email",
                  )),
              const SizedBox(
                height: 20,
              ),
              Text("Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: FontFamily.w700)),
              TextField( textInputAction: TextInputAction.next,
                  style: TextStyle(
                      color: Colors.black, fontFamily: FontFamily.w400),
                  obscureText: !passwordVisible, //
                  decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: "Enter password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              Text("Confirm Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: FontFamily.w700)),
              TextField(
                  style: TextStyle(
                      color: Colors.black, fontFamily: FontFamily.w400),
                  obscureText: !passwordVisible, //
                  decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: "Confirm password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        ischecked = !ischecked;
                      });
                    },
                    
                    icon: Icon(ischecked
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,color: Colors.grey,),
                  ),
                  const SizedBox(
                      width: 300,
                      child: Text(
                        "By creating an account you have to agree with our terms & conditions.",
                        style: TextStyle(color: Colors.grey),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Succesfulscreen())),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(120, 10, 120, 10),
                          child: Text(
                            "Signup",
                            style: TextStyle(
                              fontSize: 24,fontFamily: FontFamily.w700,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
