//setting model

import 'package:flutter/material.dart';

class SettengModel {
  String title;
  Icon icon;

  SettengModel({required this.title,required this.icon,
  });
}
List<SettengModel> link = [
  SettengModel(
    title: 'Arithmetic',
    icon: const Icon(Icons.person),
  ),
  SettengModel(title: 'change the password',
      icon:const Icon(Icons.password_outlined),
  ),
  SettengModel(
    title: 'call us',
    icon:const Icon(Icons.call_outlined),
  ),
  SettengModel(
    title: 'who are we',
    icon:const Icon(Icons.cloud_circle_outlined),
  ),
  SettengModel(
    title: 'Terms and Conditions',
    icon:const Icon(Icons.list_alt_rounded),
  ),
  SettengModel(
    title: 'privacy policy',
    icon:const Icon(Icons.privacy_tip),
  ),
];

