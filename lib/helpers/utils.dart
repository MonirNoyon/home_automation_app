import 'package:flutter/material.dart';
import 'package:home_automation_app/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Utils {

  static GlobalKey<NavigatorState> mainNav = GlobalKey();
  static GlobalKey<NavigatorState> tabNav = GlobalKey();

  static void showUIModal(
    BuildContext context, 
    Widget child,
    { bool dismissible = false, Function? onDismissed }
  ) {

    final deviceType = getDeviceType(MediaQuery.sizeOf(context));
    
    if (deviceType == DeviceScreenType.mobile) {
      showModalBottomSheet(
        isDismissible: dismissible,
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (ctxt) {
          return child;
        }
      ).whenComplete(() {
        onDismissed!();
      });
    }
    else {
      showDialog(
        context: context,
        builder: (ctxt) {
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.25,
              vertical: MediaQuery.sizeOf(context).height * 0.09,
            ),
            child: child,
          );
        }
      ).whenComplete(() {
        onDismissed!();
      });
    }
    
  }

  static bool isMobile() {
    return getDeviceType(MediaQuery.sizeOf(Utils.mainNav.currentContext!)) == DeviceScreenType.mobile;
  }
}