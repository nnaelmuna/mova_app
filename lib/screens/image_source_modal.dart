import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

typedef OnImageSelected = void Function(File imageFile);

class ImageSourceModal extends StatelessWidget {
  final OnImageSelected onImageSelected;
  final Color primaryColor = const Color(0xFFE21220);

  const ImageSourceModal({
    super.key,
    required this.onImageSelected,
  });

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    PermissionStatus status;

    if (source == ImageSource.camera) {
      status = await Permission.camera.request();
    } else {
      status = await Permission.storage.request(); 
    }

    if (status.isDenied) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${source == ImageSource.camera ? 'Camera' : 'Gallery'} permission is required.'),
            backgroundColor: Colors.orange,
            action: SnackBarAction(
              label: 'Settings',
              onPressed: openAppSettings
            ),
          )
        );
        Navigator.pop(context); 
        return;
      }
    }

    if (status.isGranted) {
      try {
        final ImagePicker picker = ImagePicker();
        final XFile? pickedFile = await picker.pickImage(
          source: source,
          imageQuality: 70, 
        );

        if (pickedFile != null) {
          final File imageFile = File(pickedFile.path);
          onImageSelected(imageFile);
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error selecting image: ${e.toString()}'),
              backgroundColor: Colors.red,
            )
          );
        }
      }
      if (context.mounted) {
        Navigator.pop(context); 
      }
    }
  }

  Widget _buildOptionButton(BuildContext context, {required IconData icon, required String label, required ImageSource source}) {
    return ListTile(
      leading: Icon(icon, color: primaryColor),
      title: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () => _pickImage(context, source),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[850], // Warna background modal
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Choose Image Source',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildOptionButton(
            context,
            icon: Icons.camera_alt,
            label: 'Take Photo',
            source: ImageSource.camera,
          ),
          _buildOptionButton(
            context,
            icon: Icons.photo_library,
            label: 'Choose from Gallery',
            source: ImageSource.gallery,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}