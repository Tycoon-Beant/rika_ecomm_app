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
              Text(
                "SignUp",
                style: context.theme.headlineSmall,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Create a new account",
                style: context.theme.titleSmall!.copyWith(color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "User name ",
                style: context.theme.titleMedium,
              ),
              TextField(
                  style: context.theme.titleSmall,
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
              Text(
                "Email",
                style: context.theme.titleMedium,
              ),
              TextField(
                  style: context.theme.titleSmall,
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
              Text(
                "Password",
                style: context.theme.titleMedium,
              ),
              TextField(
                  textInputAction: TextInputAction.next,
                  style: context.theme.titleSmall,
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
              Text(
                "Confirm Password",
                style: context.theme.titleMedium,
              ),
              TextField(
                  style: context.theme.titleSmall,
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
                    icon: Icon(
                        ischecked
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: const Color.fromARGB(255, 197, 196, 196)),
                  ),
                  SizedBox(
                      width: 300,
                      child: Text(
                        "By creating an account you have to agree with our terms & conditions.",
                        style: context.theme.titleSmall!.copyWith(
                            color: const Color.fromARGB(255, 197, 196, 196)),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
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
                          child: Text("Signup",
                              style: context.theme.titleMedium!
                                  .copyWith(color: Colors.white)),
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
