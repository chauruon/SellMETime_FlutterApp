import 'package:component_login/components/CheckBox/CheckboxCircle.dart';
import 'package:component_login/components/type/typepost.dart';
import 'package:flutter/material.dart';
import  'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:currency_picker/currency_picker.dart';

import '../CheckBox/CustomCheckbox.dart';



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
  Currency? selectCurrency;
  String pickLocation = "";
  late bool valCheck = false;

  @override
  Widget build(BuildContext context) {
    print("form 1 $valCheck" );
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
      alignment: Alignment.center,
      child: SafeArea(
        child: Column(
          children: [
            // Required
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Required",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: const Color(0xFFffffff),
                    // color: const Color.fromRGBO(248, 231, 28, 1),
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
                      // =====>TypePost<=====
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Post type",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
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
                      // ====>Cost<====
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Cost",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 40,),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 210,
                                  height: 55,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.done,
                                    minLines: 1,
                                    
                                    decoration: InputDecoration(
                                      hintStyle: const TextStyle(
                                        color: Color.fromRGBO(1, 30, 50, 1),
                                        fontSize: 14,
                                      ),
                                      filled: true,
                                      fillColor: const Color.fromRGBO(0, 38, 101, 0.04),
                                      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusColor: const Color.fromRGBO(1, 30, 50, 1),
                                      hintText: "Enter cost",
                                    ),
                                    textAlignVertical: TextAlignVertical.bottom,
                                  ),
                                ),
                                
                                const SizedBox(width: 10,),
                                SizedBox(
                                  // width: 50,
                                  height: 50,
                                  child: TextButton(

                                    style: TextButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(0, 38, 101, 0.04),
                                      fixedSize: const Size(90 , 40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              "${selectCurrency != null ? selectCurrency?.code : 'Currency'}",
                                              // overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              softWrap: false,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                // backgroundColor:  Color.fromRGBO(195, 206, 95, 1),
                                                // wordSpacing: 30.0,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color:  Color.fromRGBO(1, 30, 50, 1),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          // width: 15,
                                          child: Image.asset("assets/icon/arrowDown.png",width: 15,height: 15,),
                                        )
                                      ],
                                    ),
                                    onPressed: (){
                                      showCurrencyPicker(
                                        context: context,
                                        showFlag: true,
                                        showSearchField: true,
                                        showCurrencyName: true,
                                        showCurrencyCode: true,
                                        onSelect: (Currency currency) {
                                            print(currency);
                                            setState(() {
                                              selectCurrency = currency;
                                            });

                                        },
                                        // favorite: ['SEK'],
                                      );
                                    }
                                  ),                                  
                                ),
                              ],
                            ),
                            
                          ],
                        ),
                      ),
                      // ===>Country<====
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Country",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 17,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 110,
                              height: 50,
                              child: GestureDetector(
                                onTap: () async {
                                  final code = await countrypicker.showPicker(context: context);
                                  print(code);
                                  setState(() {
                                    countryCode = code;
                                  });
                                },
                                child: Container(
                                  width: 90,
                                  decoration: BoxDecoration(
                                    color:const Color.fromRGBO(0, 38, 101, 0.04),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            "${countryCode != null ? countryCode?.name : 'Select a country'}",
                                            // overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: false,
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              // backgroundColor:  Color.fromRGBO(195, 206, 95, 1),
                                              // wordSpacing: 30.0,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color:  Color.fromRGBO(1, 30, 50, 1),
                                            ),
                                          ),
                                        ),
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
                      ),
                      // ====>Location<=====
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Location",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 14,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 114,
                              height: 50,
                              child: GestureDetector(
                                onTap: () async {
                                  final code = await countrypicker.showPicker(context: context);
                                  setState(() {
                                    countryCode = code;
                                  });
                                },
                                child: Container(
                                  width: 90,
                                  decoration: BoxDecoration(
                                    color:const Color.fromRGBO(0, 38, 101, 0.04),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            pickLocation != "" ? pickLocation : '(Lat,Long)',
                                            // overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: false,
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              // backgroundColor:  Color.fromRGBO(195, 206, 95, 1),
                                              // wordSpacing: 30.0,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color:  Color.fromRGBO(1, 30, 50, 1),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 25.0,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8)
                                          ),
                                          gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color.fromRGBO(0, 38, 101, 0.7),
                                              Color.fromRGBO(0, 38, 101, 1),
                                            ],
                                          ),
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.transparent,
                                              shadowColor: Colors.transparent),
                                          child: const Text('Update'),
                                        ),
                                      ),
                                      const SizedBox(width: 10,)
                                    ],
                                  ),
                                ),
                              )
                            ),
                          ],                            
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            const SizedBox(height: 20,),

            // Option
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Option",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: const Color(0xFFffffff),
                    // color:const Color.fromRGBO(248, 231, 28, 1),
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
                          children:<Widget>[
                            CustomCheckbox(valCheck: valCheck),
                            // Text("$valCheck"),
                          ],
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Cost",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 40,),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 210,
                                  height: 55,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.done,
                                    minLines: 1,
                                    
                                    decoration: InputDecoration(
                                      hintStyle: const TextStyle(
                                        color: Color.fromRGBO(1, 30, 50, 1),
                                        fontSize: 14,
                                      ),
                                      filled: true,
                                      fillColor: const Color.fromRGBO(0, 38, 101, 0.04),
                                      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusColor: const Color.fromRGBO(1, 30, 50, 1),
                                      hintText: "Enter cost",
                                    ),
                                    textAlignVertical: TextAlignVertical.bottom,
                                  ),
                                ),
                                
                                const SizedBox(width: 10,),
                                SizedBox(
                                  // width: 50,
                                  height: 50,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(0, 38, 101, 0.04),
                                      fixedSize: const Size(90 , 40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              "${selectCurrency != null ? selectCurrency?.code : 'Currency'}",
                                              // overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              softWrap: false,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                // backgroundColor:  Color.fromRGBO(195, 206, 95, 1),
                                                // wordSpacing: 30.0,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color:  Color.fromRGBO(1, 30, 50, 1),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          // width: 15,
                                          child: Image.asset("assets/icon/arrowDown.png",width: 15,height: 15,),
                                        )
                                      ],
                                    ),
                                    onPressed: (){
                                      showCurrencyPicker(
                                        context: context,
                                        showFlag: true,
                                        showSearchField: true,
                                        showCurrencyName: true,
                                        showCurrencyCode: true,
                                        onSelect: (Currency currency) {
                                          // print('Select currency: $currency');
                                            // print(currency);
                                            setState(() {
                                              selectCurrency = currency;
                                            });

                                        },
                                        // favorite: ['SEK'],
                                      );
                                    }
                                  ),                                  
                                ),
                              ],
                            ),
                            
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ),
    );
  }
}