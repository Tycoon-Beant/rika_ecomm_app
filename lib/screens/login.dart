import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/screens/succesfulscreen.dart';

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
                height:40,
              ),
              Center(child: Image.asset("assets/images/3x/logoblack.png")),
              const SizedBox(
                height: 50,
              ),
              Text("Welcome!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                     fontFamily: FontFamily.w700)),
              // const SizedBox(
              //   height: 2,
              // ),
              const Text("please login or sign up to continue our app",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  )),
              const SizedBox(
                height: 25,
              ),
              Text("Email",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: FontFamily.w700),
                       
                      ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                  style: TextStyle(
                      color: Colors.black, fontFamily: FontFamily.w400),
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
              Text("Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: FontFamily.w700)),
              TextField(
               
                  style: TextStyle(
                      color: Colors.black, fontFamily: FontFamily.w400),
                  obscureText: true,
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
                height: 50,
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
                          padding: const EdgeInsets.fromLTRB(132, 10, 132, 10),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 20,fontFamily: FontFamily.w700,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        )),
                    const Text("or",style: TextStyle(fontSize: 20),),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 53, 82, 121),
                        ),
                        onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login())),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                          child: Row(
                            children: [
                              const Icon(Icons.facebook_rounded,color: Colors.white,),
                              Text(
                                "    Continue with Facebook",
                                style: TextStyle(
                                  fontSize: 18,fontFamily: FontFamily.w700,
                                  color: const Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ],
                          ),
                        )),
                          const SizedBox(
                             height: 25,
                          ),
                         ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Color.fromARGB(255, 173, 170, 170))
                          )
                        ),
                        onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login())),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(60, 10, 40, 10),
                          child: Row(
                            children: [
                              Image.asset("assets/images/googleicon.png"),
                              Text(
                                "    Continue with Google",
                                style: TextStyle(
                                  fontSize: 18,fontFamily: FontFamily.w700,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        )),
                         const SizedBox(height: 25),
                         ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Color.fromARGB(255, 173, 170, 170))
                          )
                        ),
                        onPressed: () {
                          
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(60, 10, 40, 10),
                          child: Row(
                            children: [
                              Image.asset("assets/images/appleicon.png"),
                              Text(
                                "    Continue with Apple",
                                style: TextStyle(
                                  fontSize: 18,fontFamily: FontFamily.w700,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
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
