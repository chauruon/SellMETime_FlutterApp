import 'dart:math';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../controller/login_controller.dart';
import 'demo_step1.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = LoginController();
  Logger logger = Logger();
  late bool passwordVisible=false;
  String emailValue = '';
  String passwordValue = "";
  bool isRunnings = false;


  // final InfoApps = Get.put(InfoApp());
  @override
  void initState() {
    super.initState();
  }

   
  

  void showPass () =>{
    setState(()=>passwordVisible = !passwordVisible
    )
  };

  void onFinishCountdown(bool isRunning) {
    setState(() {
      isRunnings = isRunning;
    });
  }

  snackBar(String message){
    return SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    var bottom = MediaQuery.of(context).viewInsets.bottom;
    bottom = max(min(bottom, 90), 0);

    void login(String email,String password) async {
      Map<String, String> body = {
        "email":email,
        "password":password
      };
      logger.d("1111111   $email");
      logger.d("2222222   ${!email.isNotEmpty}");
      logger.d("3333333   ${email.isEmpty}");
      if (!email.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar("Email is empty!"));
      }else if(!password.isNotEmpty){
        ScaffoldMessenger.of(context).showSnackBar(snackBar("Password is empty!"));
      }
      if (email.isNotEmpty && password.isNotEmpty) {
        final ajsdhf = _loginController.postLoginApi(email,password);
      }

    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(bottom: bottom),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 100.0,),
                  Image.asset("assets/icon/logo.png",height: 105.0,width: 100.0,),
                ],
              )
            ),
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
                  // input email
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
                            onChanged: (value) {
                              setState(() {
                                emailValue = value;
                              });
                            },
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
                  // input pass
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
                            onChanged: (value) => {
                              setState((){
                                passwordValue = value;
                              })
                            },
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
                  InkWell(
                    onTap: () {
                      login(emailValue,passwordValue);
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 60,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Color.fromRGBO(0, 38, 101, 1),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        ),
                      ),
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const DemoStep1()),
                            );
                          },
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
        ),
      ),
    );
  }
}