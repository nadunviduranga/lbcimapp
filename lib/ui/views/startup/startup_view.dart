import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lbtaskapp/ui/common/all_string.dart';
// import 'package:lbtaskapp/ui/widget/drop_downbutton.dart';
import 'package:stacked/stacked.dart';
import 'package:lbtaskapp/ui/common/ui_helpers.dart';

import '../../common/all_colors.dart';
import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    var countryCode = "94";
    var countryCodeLength = countryCode.length;
    bool isVisible = false;
    // MediaQuery data
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController mobileController = TextEditingController();

    return SafeArea(
      child: Scaffold(),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
