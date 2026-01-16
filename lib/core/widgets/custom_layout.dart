import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomLayout extends StatelessWidget {
  final Widget body;
  final Color statusColor;
  final Brightness statusIcons;
  final Brightness iosStatusBrightness;
  final Color navColor;
  final Brightness navIcons;

  // Parámetros del Scaffold expuestos
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool? primary;

  const CustomLayout({
    super.key,
    required this.body,
    this.statusColor = Colors.transparent,
    this.statusIcons = Brightness.dark,
    this.iosStatusBrightness = Brightness.light,
    this.navColor = Colors.white,
    this.navIcons = Brightness.dark,

    // Parámetros del Scaffold
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.drawer,
    this.endDrawer,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusColor,
        statusBarIconBrightness: statusIcons,
        statusBarBrightness: iosStatusBrightness,
        systemNavigationBarColor: navColor,
        systemNavigationBarIconBrightness: navIcons,
      ),
      child: Scaffold(
        key: key,
        appBar: appBar,
        body: body,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        bottomNavigationBar: bottomNavigationBar,
        drawer: drawer,
        endDrawer: endDrawer,
        backgroundColor: statusColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
        primary: primary ?? true,
      ),
    );
  }
}
