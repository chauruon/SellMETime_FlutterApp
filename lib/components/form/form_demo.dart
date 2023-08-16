import 'package:component_login/components/type/typepost.dart';
import 'package:flutter/material.dart';
import  'package:fl_country_code_picker/fl_country_code_picker.dart';
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

  String currencyName = "";
  final countrypicker = const FlCountryCodePicker();
  CountryCode? countryCode;

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
                            // crossAxisAlignment:CrossAxisAlignment.center ,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text("Cost"),
                              const SizedBox(width: 40,),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 180,
                                    height: 55,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      minLines: 1,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color.fromRGBO(0, 38, 101, 0.04),
                                        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        hintText: "Enter cost",
                                      ),
                                      textAlignVertical: TextAlignVertical.bottom,
                                    ),
                                  ),
                                  
                                  const SizedBox(width: 10,),
                                  SizedBox(
                                    // width: 50,
                                    height: 50,
                                    child: GestureDetector(
                                      onTap: () async {
                                        final code = await countrypicker.showPicker(context: context);
                                        setState(() {
                                          countryCode = code;
                                        });
                                      },
                                      // 123,456,789,012,345
                                      // 110845
                                      // 143093
                                      child: Container(
                                        width: 90,
                                        decoration: BoxDecoration(
                                          color:const Color.fromRGBO(0, 38, 101, 0.08),
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        // alignment: Alignment.center,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "${countryCode != null ? countryCode?.name : ""}",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              softWrap: false,
                                              textAlign: TextAlign.center,
                                              // style: TextStyle(
                                              // ),
                                            ),
                                            SizedBox(
                                              // width: 15,
                                              child: Image.asset("assets/icon/arrowDown.png",width: 20,height: 20,),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ),
                                ],
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