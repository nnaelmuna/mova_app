// Revised: validator always uses `value`, nothing else changed.

import 'package:flutter/material.dart';
import 'package:mova_app/screens/create_pin.dart';
import 'widgets/profile_widgets.dart';

class ProfileForm extends StatefulWidget {
  static String routeName = "/choose_interest";

  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _fullNameController = TextEditingController();
  final _nicknameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  void _onSkip() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => CreatePin()));
  }

  void _onContinue() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => CreatePin()));
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _nicknameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  // void _submitForm() {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();

  //     final Map<String, dynamic> userData = {
  //       'fullName': _fullNameController.text,
  //       'nickname': _nicknameController.text,
  //       'email': _emailController.text,
  //       'phoneNumber': _phoneController.text,
  //       'gender': _gender,
  //     };

  //     print('Data Ready to Send $userData');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'Fill Your Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ProfilePictureArea(),
                    SizedBox(height: 40),

                    CustomTextInput(
                      controller: _fullNameController,
                      hintText: 'Full Name',
                      validator: (value) => value?.isEmpty ?? true
                          ? 'Please enter your full name'
                          : null,
                    ),
                    SizedBox(height: 16),

                    CustomTextInput(
                      controller: _nicknameController,
                      hintText: 'Nickname',
                      validator: (value) => value?.isEmpty ?? true
                          ? 'Please enter your nickname'
                          : null,
                    ),
                    SizedBox(height: 16),

                    CustomTextInput(
                      controller: _emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      suffixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.grey,
                      ),
                      validator: (value) => value?.isEmpty ?? true
                          ? 'Please enter your email'
                          : null,
                    ),
                    SizedBox(height: 16),

                    PhoneInput(
                      controller: _phoneController,
                      keyboardType: TextInputType.number,
                    ),

                    SizedBox(height: 40),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, CreatePin.routeName),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          color: Color(0xFF1E1E1E),
                          child: ActionButtons(
                            onSkip: _onSkip,
                            onContinue: _onContinue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
