import 'dart:io';

import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    if (Platform.isAndroid){

    }
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });
        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: 
      [
        Padding(
          padding:  EdgeInsets.fromLTRB(28, hasNotch? 10: 20, 16, 10),
          child: const Text("MAIN"),
        ),
        ...appMenuItems
          .sublist(0, 3)
          .map((item) => NavigationDrawerDestination(icon: Icon(item.icon), label: Text(item.title))),
        const NavigationDrawerDestination(
          icon: Icon(Icons.add),
          label: Text("Main")),
        const NavigationDrawerDestination(
          icon: Icon(Icons.add_shopping_cart_rounded),
          label: Text("Second")),
        const Padding(padding: EdgeInsets.fromLTRB(28, 16, 28, 10), child: Divider(),),

        Padding(
          padding:  EdgeInsets.fromLTRB(28, hasNotch? 10: 20, 16, 10),
          child: const Text("More Options"),
        ),
        ...appMenuItems
          .sublist(3)
          .map((item) => NavigationDrawerDestination(icon: Icon(item.icon), label: Text(item.title))),
      ]);
  }
}