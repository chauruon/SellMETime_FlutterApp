import 'package:component_login/components/countdown.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import '../components/timer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late bool passwordVisible=false;
  bool _isRunning = false;
  
  void showPass () =>{
    setState(()=>{
      passwordVisible = !passwordVisible
    })
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
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  children: const [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Nhập tùm lum thứ",
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                          prefixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(
                              Icons.person,
                            ),
                          ),
                          contentPadding:  EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                        ),
                      ),
                    ),
                    SizedBox(
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
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  children:  [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !passwordVisible,
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
                          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                          suffixIcon: IconButton(
                            icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,size: 24,),
                            onPressed: () => showPass(),
                          ),
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
