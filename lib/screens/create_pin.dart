import 'package:flutter/material.dart';
import 'package:mova_app/screens/setup_successful.dart';
import 'package:mova_app/utils/size_config.dart';
import 'widgets/create_pin_widget.dart';

class CreatePin extends StatelessWidget {

  static String routeName = "/create_pin";

  const CreatePin({super.key});

  void _handleSuccess(BuildContext context) {
      showDialog(
        context: context,
        barrierDismissible: false, 
        builder: (BuildContext dialogContext) {
          return SetupSuccessful( 
            title: "Congratulations!",
            message: "Account setup is complete. Redirecting to Home.",
            onRedirectComplete: () {
              Navigator.of(dialogContext).pop(); 
              // GANTI '/home_screen_route' DENGAN NAMA ROUTE ANDA YANG SEBENARNYA!
              Navigator.pushReplacementNamed(context, '/home_screen_route'); 
            },
            delaySeconds: 2, 
          );
        },
      );
  }

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
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20), vertical: 40),
          child: Column(
            children: [
              Align(
                alignment: AlignmentGeometry.center,
                child: Text(
                  'Add a PIN Number to make your account more secure.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w100
                  ),
                ),
              ),
              SizedBox(height: 50),
              PinForm(),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: getProportionateScreenHeight(40)),
                child: SizedBox(
                  width: double.infinity,
                  height: getProportionateScreenHeight(56),
                  child: ElevatedButton(
                    onPressed: () {
                      // Panggil fungsi sukses saat tombol ditekan (setelah validasi PIN)
                      _handleSuccess(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE21220),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 8,
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}