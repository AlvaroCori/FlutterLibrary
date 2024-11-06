import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
  });

  
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: "Botones",
    subTitle: "Varios botones",
    link: "/buttons",
    icon: Icons.smart_button
  ),
  MenuItem(
    title: "Tarjetas",
    subTitle: "Varios card estilizado",
    link: "/cards",
    icon: Icons.credit_card
  ),
MenuItem(
    title: "ProgressIndicator",
    subTitle: "Generales y controlados",
    link: "/progress",
    icon: Icons.refresh_rounded
  ),
  MenuItem(
    title: "Snackbar y dialogos",
    subTitle: "Indicadores en pantalla",
    link: "/snackbars",
    icon: Icons.info_outline
  ),
  MenuItem(
    title: "Animated container",
    subTitle: "Stateful widget animated",
    link: "/animated",
    icon: Icons.check_box_outline_blank_rounded
  ),
  MenuItem(
    title: "UI controls",
    subTitle: "A serie of Flutter controls",
    link: "/ui_controls",
    icon: Icons.car_rental_outlined
  ),
  MenuItem(
    title: "Introduction to the application",
    subTitle: "A introduced tutorial",
    link: "/tutorial",
    icon: Icons.accessible_rounded
  ),
  MenuItem(
    title: "Infinite Scroll y Pull",
    subTitle: "Infinity lists and pull to refresh",
    link: "/infinite",
    icon: Icons.list_alt_rounded
  ),
  MenuItem(
    title: "Riverpod Counter",
    subTitle: "Introduction to riverpod",
    link: "/counter-river",
    icon: Icons.reviews_sharp
  ),
  MenuItem(
    title: "Theme Changer",
    subTitle: "Change the theme color",
    link: "/theme-changer",
    icon: Icons.color_lens_outlined
  ),
];