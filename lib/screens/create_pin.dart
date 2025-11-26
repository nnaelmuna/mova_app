import 'package:flutter/material.dart';
import 'package:mova_app/utils/size_config.dart';
import 'widgets/create_pin_widget.dart';

class CreatePin extends StatelessWidget {

  static String routeName = "/create_pin";

  const CreatePin({super.key});

  @override
  
  Widget build(BuildContext context) {
    initSizeConfig(context);
    // final screenWidth = MediaQuery.of(context).size.width;
    // final double horizontalPadding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Create New Pin',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Text(
                'Add a PIN Number to make your account more secure.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w100
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}