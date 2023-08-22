import 'package:flutter/material.dart';
import 'package:sellmetime/components/form/form2.dart';

import '../components/app_bar.dart';
import '../components/form/form1.dart';


class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  int _index = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        icon: "assets/icon/arrowDirectionGreen.png",
        title: const Text("Register (1/2)"),
        arrayAcction: [
          IconButton(
            onPressed: (){},
            icon: Image.asset("assets/icon/writeOff.png"),
            style: const ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.only(right: 45))
            ),
          ),
        ],
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _index,
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
            });
          }
        },
        onStepContinue: () {
          if (_index <= 0) {
            setState(() {
              _index += 1;
            });
          }
        },
        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },
        steps: <Step>[
          Step(
            title: const Text('Step 1 title'),
            content: Container(
                alignment: Alignment.centerLeft,
                child: const Text('Content for Step 1')),
          ),
          const Step(
            title: Text('Step 2 title'),
            content: Text('Content for Step 2'),
          ),
        ],
      )
    );
  }
  List<Step> getSteps() => const [
    Step(title: Text("Form 1"), content: Form1()),
    Step(title: Text("Form 2"), content: Form2()),
  ];
}
