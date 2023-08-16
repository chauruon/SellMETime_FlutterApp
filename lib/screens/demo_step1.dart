import 'package:flutter/material.dart';

import '../components/app_bar.dart';
import '../components/form/step_component.dart';
import '../components/form/form1.dart';

class DemoStep1 extends StatefulWidget {
  const DemoStep1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DemoStep1State createState() => _DemoStep1State();
}

class _DemoStep1State extends State<DemoStep1> {
  int _currentStep = 0;

  double heightBtnNext = 40;


  @override
  Widget build(BuildContext context) {

    final List<StepItem> stepsView =[
      StepItem(
        title: const Text('Step 1'),
        content: SizedBox(
          height: MediaQuery.of(context).size.height - heightBtnNext - 90,
          child: const Form1(),
        ),
      ),
      StepItem(
        title: const Text('Step 2'),
        content: Container(
          height: MediaQuery.of(context).size.height - 120 ,
          alignment: Alignment.center,
          child: const Text('Content for Step 2')
        ),
      ),
    ];
    
    void onFinish(int ste) {
      setState(() {
        _currentStep = ste;
      });
    }
    return Scaffold(
      appBar: CustomAppBar(
        icon: "assets/icon/arrowDirectionGreen.png",
        title: Text(
          'Register ${_currentStep + 1}/${stepsView.length}',
          style:const TextStyle(
            color: Color.fromRGBO(24, 163, 72,1),
          ),
        ),
        currentStep: _currentStep,
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressStep: onFinish,
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: StepComponent(
            type: StepType.horizontal,
            currentStep: _currentStep,
            controlsBuilder: (context, details) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(0, 38, 101, 1),
                    fixedSize: Size(MediaQuery.of(context).size.width , heightBtnNext),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Next'),
                  onPressed: (){
                    if (_currentStep <= 0) {
                      setState(() {
                        _currentStep += 1;
                      });
                    }
                  }
                )
              );
            },
            onStepContinue: () {
              if (_currentStep <= 0) {
                setState(() {
                  _currentStep += 1;
                });
              }
            },
            onStepCancel: () {
              if (_currentStep > 0) {
                setState(() {
                  _currentStep -= 1;
                });
              }
            },
            steps: stepsView,
          ),
        ),
      ),
    );
  }
}
