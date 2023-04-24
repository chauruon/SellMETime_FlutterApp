import 'package:component_login/components/type/typepost.dart';
import 'package:flutter/material.dart';
import 'package:currency_picker/currency_picker.dart';

class Form1 extends StatefulWidget {
  const Form1({super.key});

  @override
  State<Form1> createState() => _Form1State();
}

class _Form1State extends State<Form1> {

  
  final List<String> type = const[
    "Time",
    "Thing",
    "Talent",
  ];
  final List<Color> colors = const[
    Color.fromRGBO(228, 241, 255, 1),
    Color.fromRGBO(255, 248, 228, 1),
    Color.fromRGBO(255, 213, 213, 1),
  ];
  final List<Color> textcolors = const[
    Color.fromRGBO(37, 103, 249, 1),
    Color.fromRGBO(255, 178, 0, 1),
    Color.fromRGBO(218, 0, 11, 1),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Required",
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      color: const Color(0xFFffffff),
                      
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3.0, // soften the shadow
                          spreadRadius: 0.5, //extend the shadow
                          offset: Offset(
                            0.9, // Move to right 5  horizontally
                            0.9, // Move to bottom 5 Vertically
                          ),
                        )
                      ],
                    ),

                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Post type",
                              ),
                              const SizedBox(width: 10,),
                              Expanded(
                                child: TypePostComponent(
                                  items: type,
                                  colors: colors,
                                  onPressed: (String item, Color color) {
                                    print('You tapped on $item with color $color');
                                  },
                                  // onPressed: (String item) {
                                    // print('You tapped on $item');
                                  // },
                                ),
                              )
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text("Cost"),
                              ElevatedButton(
                                onPressed: () {
                                  showCurrencyPicker(
                                    context: context,
                                    showFlag: true,
                                    showSearchField: true,
                                    showCurrencyName: true,
                                    showCurrencyCode: true,
                                    onSelect: (Currency currency) {
                                      print('Select currency: ${currency}');
                                    },
                                    // favorite: ['SEK'],
                                  );
                                },
                                child: const Text('Show currency picker'),
                              ),
                              
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}