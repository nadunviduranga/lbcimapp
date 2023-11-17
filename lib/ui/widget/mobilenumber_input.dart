import 'package:flutter/material.dart';
import 'package:flutter/src/material/dropdown.dart';

class MobileNumberInput extends StatefulWidget {
  const MobileNumberInput({super.key});

  @override
  State<MobileNumberInput> createState() => _MobileNumberInputState();
}

class _MobileNumberInputState extends State<MobileNumberInput> {
  List<Map<String, String>> countryCodes = [
    {'code': '+1', 'name': 'United States'},
    {'code': '+91', 'name': 'India'},
    {'code': '+44', 'name': 'United Kingdom'},
    {'code': '+81', 'name': 'Japan'},
    {'code': '+94', 'name': 'Sri Lanka'}
  ];
  String countryCode = "+94";
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Row(
            children: [
             
              // DropdownButton<String>(
              //   value: countryCode,
              //   onChanged: (String? newValue) {
              //     setState(() {
              //       countryCode = newValue!;
              //     });
              //   },
              
              //   items: countryCodes
              //       .map<DropdownMenuItem<String>>(
              //         (Map<String, String> country) => DropdownMenuItem<String>(
              //           value: country['code'],
              //           child: Text('${country['name']} (${country['code']})'),
              //         ),
              //       )
              //       .toList(),
              
              // ),

              Container(
                width: 80,
                height: 60,
                color: Colors.amber,
                decoration: BoxDecoration(
                  
                ),
              ),

              SizedBox(width: 5.0),
              // Mobile Number TextField
              Expanded(
                child: TextField(
                  controller: mobileController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.black),
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
