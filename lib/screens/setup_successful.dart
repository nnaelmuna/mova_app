import 'package:flutter/material.dart';
import 'package:mova_app/utils/size_config.dart';
import 'dart:async';

class SetupSuccessful extends StatefulWidget {
  final String title;
  final String message;
  final VoidCallback onRedirectComplete; 
  final int delaySeconds; 
  final Color primaryColor = const Color(0xFFE21220); 
  const SetupSuccessful({super.key,  required this.title, required this.message, required this.onRedirectComplete, this.delaySeconds = 2});

  static String routeName = "/setup_successful";

  @override
  State<SetupSuccessful> createState() => _SetupSuccessfulState(); // <-- Baris 1: Wajib ada
}

class _SetupSuccessfulState extends State<SetupSuccessful> { 
  bool _isRedirecting = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: widget.delaySeconds), () {
      if (mounted) {
        setState(() {
          _isRedirecting = true;
        });
        Future.delayed(const Duration(milliseconds: 500), () {
          widget.onRedirectComplete();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    initSizeConfig(context);
    
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Center(
        child: Container(
          width: getProportionateScreenWidth(320),
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // animation success
              SizedBox(
                height: getProportionateScreenHeight(100),
                width: getProportionateScreenHeight(100),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [widget.primaryColor.withOpacity(0.8), widget.primaryColor],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50,
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: getProportionateScreenHeight(30)),
              
              // title
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: widget.primaryColor, 
                  fontSize: getProportionateScreenWidth(24),
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              SizedBox(height: getProportionateScreenHeight(10)),
              
              // message
              Text(
                widget.message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(16),
                ),
              ),
              
              SizedBox(height: getProportionateScreenHeight(30)),
              
              // loading indicator
              SizedBox(
                width: getProportionateScreenWidth(40),
                height: getProportionateScreenHeight(40),
                child: _isRedirecting
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(widget.primaryColor),
                        strokeWidth: 4,
                      )
                    : Text(
                        'Starting Redirect...', 
                        style: TextStyle(color: Colors.white70, fontSize: getProportionateScreenWidth(14)),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}