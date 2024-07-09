import 'package:administrador/screens/payment_screens.dart';
import 'package:administrador/screens/planes_screens.dart';
import 'package:administrador/screens/register_screens.dart';
import 'package:administrador/screens/store_details_screens.dart';
import 'package:flutter/material.dart';

class RoutesNavigation extends StatelessWidget {
  final int index;
  const RoutesNavigation({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> mylist = [
      const PaymentScreens(),
      const PlanesScreens(),
      const RegisterScreens(),
      const StoreDetailsScreen()
    ];
    return mylist[index ];
  }
}