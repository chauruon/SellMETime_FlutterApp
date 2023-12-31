import 'package:sellmetime/components/countdown.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

// import '../components/timer.dart';

class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({super.key});

  @override
  State<LoginScreen1> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  late bool passwordVisible=false;
  bool _isRunning = false;
  
  void showPass () =>{
    setState(()=>passwordVisible = !passwordVisible
    )
  };

  void onFinishCountdown(bool isRunning) {
    setState(() {
      _isRunning = isRunning;
    });
  }

  void myFunction() {
    // Do something with the data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100.0,),
              Image.asset("assets/images/Logo.png",height: 200.0,width: 200.0,),
              const SizedBox(height: 10.0,),
              const Text("Welcome to PuPy",
                style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 40.0,),
            
              Container(
                margin:const EdgeInsets.symmetric(horizontal: 30),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                ),
                child: Row(
                  children:  [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Nhập tùm lum thứ",
                          // border:  OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(58, 212, 212, 212))),
                          // focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color:Colors.grey)),
                          border: const OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                          prefixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Image.asset("assets/icon/email.png", width: 20,height: 20,)
                          ),
                          prefixIconColor: MaterialStateColor.resolveWith((states) => 
                            states.contains(MaterialState.focused)
                              ? const Color.fromRGBO(0, 38, 101,1)
                              : const Color.fromRGBO(0, 38, 101,1)
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                          // suffixIcon:  SizedBox(
                          //   height: 10,
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(right: 5),
                          //     child: TextButton(
                          //       style: TextButton.styleFrom(
                          //         backgroundColor: Colors.green,
                          //       ),
                          //       onPressed: () {
                          //         // Do something when the button is pressed
                          //       },
                          //       child: const Text('Button'),
                          //     ),
                          //   ),
                          // ),
                
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                      width: 30,
                      child: Text("data",
                        style: TextStyle(
                          backgroundColor: Colors.amberAccent,
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
                  children:  [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Nhập tùm lum thứ",
                          // border:  OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(58, 212, 212, 212))),
                          // focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color:Colors.grey)),
                          border: const OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                          prefixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Image.asset("assets/icon/password.png", width: 20,height: 20,)
                          ),
                          prefixIconColor: MaterialStateColor.resolveWith((states) => 
                            states.contains(MaterialState.focused)
                              ? const Color.fromRGBO(0, 38, 101,1)
                              : const Color.fromRGBO(0, 38, 101,1)
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          
              const SizedBox(height: 15.0,),
              const Text("TimerComponent",
                style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              if (_isRunning == true)
                Countdown(
                  // 5 phut => 5 * 60s hoac 1h => 1 giờ * 60phut * 60s
                  durationInSeconds: 10,
                  startCount: _isRunning,
                  textStyle: const TextStyle(fontSize: 36),
                  onFinish: onFinishCountdown,
                ), 
              
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    log("onPressed button start");
                    _isRunning = true;
                  });
                },
                child: const Text('Start'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
