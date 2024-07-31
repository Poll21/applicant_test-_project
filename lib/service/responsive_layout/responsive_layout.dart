import 'package:flutter/material.dart';
enum AppLayoutBuilder{
  mobile,
  tablet,
  desktop
}
late AppLayoutBuilder appLayoutBuilder;

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  const ResponsiveLayout(
      {super.key,
        required this.mobileScaffold,
        required this.tabletScaffold,
        required this.desktopScaffold});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 500) {
        appLayoutBuilder = AppLayoutBuilder.mobile;
        return mobileScaffold;
      } else if (constraints.maxWidth < 1100) {
        appLayoutBuilder = AppLayoutBuilder.tablet;
        return tabletScaffold;
      } else {
        appLayoutBuilder = AppLayoutBuilder.desktop;
        return desktopScaffold;
      }
    });
  }
}