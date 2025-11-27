import 'package:flutter/material.dart';
import 'package:mova_app/screens/create_pin.dart';
import 'package:mova_app/screens/profile_form.dart';

final Map<String, WidgetBuilder> routes = {
  ProfileForm.routeName: (context)  => ProfileForm(),
  CreatePin.routeName: (context) => CreatePin(),
}; 