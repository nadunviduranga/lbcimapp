import 'package:flutter/material.dart';
import 'package:lbtaskapp/ui/common/all_colors.dart';
import 'package:lbtaskapp/ui/common/all_string.dart';
// import 'package:lbtaskapp/ui/views/pages/countrycode.dart';
// import 'package:lbtaskapp/ui/widget/country_codebox.dart';
// import 'package:lbtaskapp/ui/widget/drop_downbutton.dart';
// import 'package:lbtaskapp/ui/widget/mobilenumber_input.dart';
import 'package:stacked/stacked.dart';
import 'package:lbtaskapp/ui/common/app_colors.dart';
import 'package:lbtaskapp/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isVisible = false;

  TextEditingController mobileController = TextEditingController();
  // TextEditingController searchController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> allCountryCodes = AllString.countryCode;
  List<Map<String, String>> filteredCountryCodes = [];
  var countryCode = "94";



  // Future<List<Map<String, String>>> getAllCountry() async {
  //   List<Map<String, String>> allCountryCodes = AllString.countryCode;
  //   return allCountryCodes;
  // }

  void initState() {
    super.initState();
    filteredCountryCodes = List.from(allCountryCodes);
    searchController.addListener(() {
      searchCode(searchController.text);
    });
  }

  void searchCode(String query) {
    query = query.toLowerCase();
    setState(() {
      filteredCountryCodes = allCountryCodes.where((country) =>
      country['country']!.toLowerCase().contains(query) ||
          country['code']!.toLowerCase().contains(query)
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {

    int countryCodeLength = countryCode.length;
// MediaQuery data
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              Positioned(
                top: height * 0.3,
        // width: width * 0.5,
                left: width * 0.04,
                right: width * 0.04,
                child: Container(
                  width: width * 0.9,
                  height: height * 0.21,

                  decoration: BoxDecoration(
                    color: AllColors.Color1,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              Positioned(
                top: height * 0.31,
                left: width * 0.08,
                child: const Text(
                  AllString.string2,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),

              Positioned(
                top: height * 0.43,
                left: width * 0.08,
                child: SizedBox(
                  width: width * 0.85,
                  child: const Text(
                    AllString.string1,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 90, 90, 88),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: height * 0.35,
                left: width * 0.08,
        // right: width * 0.08,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: width * 0.25,
                          height: height * 0.07,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                            ),
                            border: Border.all(
                              color: Colors.black54,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
        // top: height * 0.005,
                              left: countryCodeLength == 2 ? width * 0.08 : countryCodeLength == 3 ? width * 0.06 : countryCodeLength == 4 ? width * 0.04 : width * 0.02,
        // right: width * 0.08,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "+${countryCode}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                isVisible == false ? GestureDetector(
                                  child: const Icon(
                                    Icons.arrow_drop_down,
                                    size: 32,
                                  ),
                                  onTap: () {
                                    // isVisible = true;
                                    // _showCountryDialog(context);
                                    setState(() {
                                      isVisible = true;
                                    });
        // rebuildUi();
                                  },
                                ) :
                                GestureDetector(
                                  child: const Icon(
                                    Icons.arrow_drop_up,
                                    size: 32,
                                  ),
                                  onTap: () {
                                    // isVisible = true;
                                    // _showCountryDialog(context);
                                    setState(() {
                                      isVisible = false;
                                      searchController.clear();
                                    });
        // rebuildUi();
                                  },
                                )
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          width: width * 0.005,
                        ),

                        Container(
                          width: width * 0.57,
                          height: height * 0.07,
                          decoration: const BoxDecoration(
                          color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: TextField(

                            onTap: () {
                              setState(() {
                                isVisible = false;
                                searchController.clear();
                              });
                            },
                            controller: mobileController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              labelText: 'Mobile Number',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.black),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: height * 0.005,),

                    isVisible ? Container(
                      width: width * 0.82,
                      height: height * 0.3,
                      // color: Colors.white70,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                           bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        )
                      ),
                      child: Column(
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15,
                              bottom: 10,
                            ),
                            child: SizedBox(
                              width: width * 0.7,
                              height: height * 0.05,
                              child: TextField(
                                onChanged: (text) {
                                  searchCode(text);
                                  // print(text);
                                },
                                controller: searchController,
                                decoration: InputDecoration(
                                  hintText: 'Search by country or code',
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            child: ListView.builder(
                                itemCount: filteredCountryCodes.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(
                                        '${filteredCountryCodes[index]['country']}    (+${filteredCountryCodes[index]['code']})'
                                    ),
                                    onTap: () {
                                      setState(() {
                                        isVisible = false;
                                        if (filteredCountryCodes[index]['code'] != null) {
                                          countryCode = filteredCountryCodes[index]['code']!;
                                        }
                                        searchController.clear();
                                        // countryCode = allCountryCodes[index]['code']!;
                                      });
                                      // Navigator.pop(
                                      //   context,
                                      //   filteredCountryCodes[index]['code'],
                                      // );
                                    },
                                  );
                                }
                            ),
                          )
                        ],
                      ),
                    ) : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

