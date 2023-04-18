import 'package:component_login/components/countdown.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool passwordVisible=false;
  bool _isRunning = false;


  void showPass () =>{
    setState(()=>{
      passwordVisible = !passwordVisible
    })
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Column(
            // crossAxisAlignment:CrossAxisAlignment.center,
            // verticalDirection: VerticalDirection.down,
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100.0,),
              Image.asset("assets/images/Logo.png",height: 200.0,width: 200.0,),
              const SizedBox(height: 10.0,),

              const Text("Welcome to PuPy",style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),),
              const SizedBox(height: 40.0,),

              const Padding(
                padding:  EdgeInsets.only(right: 30, left: 30),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Nhập tùm lum thứ",
                    border: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(58, 212, 212, 212))),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.grey)),
                    prefixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Icon(
                        Icons.person,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0,),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: TextField(
                  obscureText: !passwordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: "Nhập tùm lum thứ",
                    border: const OutlineInputBorder(borderSide: BorderSide(color:Colors.grey)),
                    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color:Colors.grey)),
                    prefixIcon: const Icon(Icons.lock_rounded, size: 24,),

                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,size: 24,),
                      onPressed: () => showPass(),
                    ),
                  ),
                ),
              ),
              // Countdown(durationInSeconds: 300,)
              Countdown(
                // 5 phut => 5 * 60s hoac 1h => 1 giờ * 60phut * 60s
                durationInSeconds: 300,
                startAutomatically: _isRunning,
                textStyle: const TextStyle(fontSize: 36),
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