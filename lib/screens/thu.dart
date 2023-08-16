import 'package:flutter/material.dart';
// import 'dart:developer';
// import '../components/countdown.dart';


class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {

  late bool passwordVisible=false;
  bool isRunning = false;
  
  void showPass () =>{
    setState(()=>passwordVisible = !passwordVisible
    )
  };

  void onFinishCountdown(bool isRunning) {
    setState(() {
      isRunning = isRunning;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        // height: MediaQuery.of(context).size.height,
        
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(0, 38, 101, 0.7),
              Color.fromRGBO(0, 38, 101, 1),
            ],
          ),
        ),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 100.0,),
                      Image.asset("assets/icon/logo.png",height: 105.0,width: 100.0,),
                    ],
                  )),


                Container(
                  width: double.infinity,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                    ),
                  ),

                  child: Column(
                    children: [
                      const SizedBox(height: 60,),
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        )
                      ),
                      const SizedBox(height: 40,),
                      Container(
                        margin:const EdgeInsets.symmetric(horizontal: 30),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1.0, color: Colors.grey),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                                  prefixIcon: Align(
                                      widthFactor: 1.0,
                                      heightFactor: 1.0,
                                      child: Image.asset(
                                        "assets/icon/email.png",
                                        width: 20,
                                        height: 20,
                                      )),
                                  prefixIconColor: MaterialStateColor.resolveWith((states) =>
                                  states.contains(MaterialState.focused)
                                      ? const Color.fromRGBO(0, 38, 101, 1)
                                      : const Color.fromRGBO(0, 38, 101, 1)),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 15.0,),
                      Container(
                        margin:const EdgeInsets.symmetric(horizontal: 30),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1.0, color: Colors.grey),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                obscureText: !passwordVisible,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                                  prefixIcon: const Align(
                                    widthFactor: 1.0,
                                    heightFactor: 1.0,
                                    child: Icon(
                                      Icons.lock_rounded,
                                    ),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,size: 24,),
                                    onPressed: () => showPass(),
                                  ),
                                  suffixIconColor: MaterialStateColor.resolveWith((states) =>
                                    states.contains(MaterialState.focused)
                                      ? const Color.fromRGBO(0, 38, 101, 1)
                                      : const Color.fromRGBO(0, 38, 101, 1)
                                  ),
                                  prefixIconColor: MaterialStateColor.resolveWith((states) =>
                                    states.contains(MaterialState.focused)
                                      ? const Color.fromRGBO(0, 38, 101, 1)
                                      : const Color.fromRGBO(0, 38, 101, 1)
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 35.0,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(0, 38, 101, 1),
                                ),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.all(16.0),
                                fixedSize: const Size(350, 60),
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              onPressed: () {},
                              child: const Text('Login'),
                            ),
                          ],
                        ),
                      ),


                      const SizedBox(height: 20.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: const Color.fromRGBO(1, 30, 50,100),
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              onPressed: () {},
                              child: const Text('New Account'),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.red,
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              onPressed: () {},
                              child: const Text('Find password',),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]
            )
          )
        )
      )
    );
  }
}