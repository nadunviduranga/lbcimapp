import 'package:flutter/material.dart';
import 'package:lbtaskapp/ui/common/all_string.dart';
import 'package:lbtaskapp/ui/widget/mobilenumber_input.dart';
import 'package:stacked/stacked.dart';
import 'package:lbtaskapp/ui/common/app_colors.dart';
import 'package:lbtaskapp/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    // MediaQuery data
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.2,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.05,
                  ),
                  child: Container(
                    height: height * 0.24,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(31, 85, 84, 84),
                    ),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                              top: 15,
                              bottom: 10
                            ),
                            child: Text(
                              "Mobile Number",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 116, 116, 112),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
    
                        MobileNumberInput(),
    
                        Container(
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 20,
                              // bottom: 20,
                            ),
                            child: Text(
                              AllString.string1,
                              style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 90, 90, 88)
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
