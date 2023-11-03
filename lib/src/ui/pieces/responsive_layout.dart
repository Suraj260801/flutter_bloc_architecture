import 'package:bloc_architecture/src/data/static/device_dimentions.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {super.key,
      required this.mobileWidget,
      required this.tabWidget,
      required this.desktopWidget});

  final Widget mobileWidget;
  final Widget tabWidget;
  final Widget desktopWidget;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < Dimensions.maxMobileWidth) {
        return mobileWidget;
      } else if (constraints.maxWidth >= Dimensions.maxMobileWidth &&
          constraints.maxWidth < Dimensions.maxTabWidth) {
        return tabWidget;
      } else {
        return desktopWidget;
      }
    });
  }
}
