import 'package:flutter/material.dart';
import 'package:instgram_clone/utils/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {

 const ResponsiveLayout({required this.webScreenLayout, required this.mobileScreenLayout});

  final Widget webScreenLayout;
  final Widget mobileScreenLayout;


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreen) {
          return webScreenLayout;
        }
        {
          return mobileScreenLayout;
        }
      },
    );
  }
}
