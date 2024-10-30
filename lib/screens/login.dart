import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/screens/succesful_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              Text(
                "Email",
                style: context.theme.titleMedium,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                  style: 
                      context.theme.titleMedium!.copyWith(color: Colors.grey,fontFamily: FontFamily.w400),
                  decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintText: "Enter email",
                      suffixIcon: Icon(
                        Icons.check_circle,
                        color: Colors.black,
                        size: 20,
                      ))),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Password",
                style: context.theme.titleMedium,
              ),
              TextField(
               
                  style:context.theme.titleMedium!.copyWith(color: Colors.grey,fontFamily: FontFamily.w400),
                  obscureText: true,
                  decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintText: "Enter password",
                      suffixIcon: Icon(
                        Icons.check_circle,
                        color: Colors.black,
                        size: 20,
                      ))),
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
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Succesfulscreen())),
                        child: Text(
                          "Login",
                          style: context.theme.titleMedium!.copyWith(
                            color: Colors.white
                          ),
                        )),
                    const Text("or",style: TextStyle(fontSize: 20),),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
                          backgroundColor:
                              const Color.fromARGB(255, 53, 82, 121),
                        ),
                        onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login())),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.facebook_rounded,color: Colors.white,),
                            Text(
                              " Continue with Facebook",
                              style: context.theme.titleMedium!.copyWith(
                                color: Colors.white
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
                          backgroundColor:
                              Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                            side: const BorderSide(color: Color.fromARGB(255, 173, 170, 170))
                          )
                        ),
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
                    const SizedBox(height: 25),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
                          backgroundColor:
                              Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                            side: const BorderSide(color: Color.fromARGB(255, 173, 170, 170))
                          )
                        ),
                        onPressed: () {
                          
                        },
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
    );
  }
}
