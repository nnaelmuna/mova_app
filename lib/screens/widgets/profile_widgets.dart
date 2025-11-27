import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mova_app/screens/image_source_modal.dart';

class ProfilePictureArea extends StatefulWidget {
  const ProfilePictureArea({super.key});

  @override
  State<ProfilePictureArea> createState() => _ProfilePictureAreaState();
}

class _ProfilePictureAreaState extends State<ProfilePictureArea> {
  // State untuk menyimpan file gambar yang dipilih
  File? _selectedImage;
  final Color primaryColor = const Color(0xFFE21220);

  // Fungsi untuk menampilkan Bottom Sheet Modal
  void _showSourceSelection() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ImageSourceModal(
          onImageSelected: (File imageFile) {
            // Callback dari modal: Perbarui state dengan gambar baru
            setState(() {
              _selectedImage = imageFile;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          SizedBox(
            height: 140,
            width: 140,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black26,
              // Tampilkan gambar yang dipilih, jika ada
              backgroundImage: _selectedImage != null
                  ? FileImage(_selectedImage!)
                  : null,
              // Tampilkan Icon default jika belum ada gambar
              child: _selectedImage == null
                  ? const Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.black38,
                    )
                  : null,
            ),
          ),
          // Tombol Edit
          Positioned(
            bottom: 6,
            right: 4,
            child: GestureDetector(
              onTap: _showSourceSelection, // Panggil modal saat diklik
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: primaryColor, // Warna merah
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;

  const CustomTextInput({super.key, required this.controller, required this.hintText, this.keyboardType, this.suffixIcon, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        fillColor: Colors.black45,
        filled: true,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none
        )
      ),
      validator: validator,
    );
  }
}

class PhoneInput extends StatelessWidget {
  final TextEditingController controller;

  const PhoneInput({super.key, required this.controller, required TextInputType keyboardType});

  @override
  Widget build(BuildContext context) {
    return CustomTextInput(
      controller: controller,
      hintText: 'Phone Number',
      keyboardType: TextInputType.number,
      validator: (value) => value?.isEmpty ?? true ? 'Phone cannot be empty' : null
    );
  }
}

class ActionButtons extends StatelessWidget {
  final VoidCallback onSkip;
  final VoidCallback onContinue;

  const ActionButtons({super.key, required this.onSkip, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Skip button
        Expanded(
          child: TextButton(
            onPressed: onSkip,
            style: TextButton.styleFrom(
              backgroundColor: Colors.grey[800],
              padding: EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45),
              ),
            ),
            child: Text(
              'Skip',
              style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SizedBox(width: 15),
        
        // Continue button
        Expanded(
          child: ElevatedButton(
            onPressed: onContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFE21220),
              padding: EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45),
              ),
            ),
            child: Text(
              'Continue',
              style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}